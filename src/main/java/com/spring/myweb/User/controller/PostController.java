package com.spring.myweb.User.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.myweb.Service.AdminService.AdminService;
import com.spring.myweb.Service.NoticeService.NoticeService;
import com.spring.myweb.Service.PostService.PostService;
import com.spring.myweb.VO.AdminVO.BannerVO;
import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.LikeVO.LikeVO;
import com.spring.myweb.VO.PageVO.PageVO;
import com.spring.myweb.VO.PhotoVO.PhotoVO;
import com.spring.myweb.VO.PostVO.PostVO;
import com.spring.myweb.VO.UserVO.UserVO;
import com.spring.myweb.VO.noticeVO.NoticeVO;
import com.spring.myweb.awss3.vo.PostPhotoVO;

@Controller
@SessionAttributes("post")
public class PostController {

	@Autowired
	private PostService postService;

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String postList(Model model, PageVO page, LikeVO lvo, UserVO uvo, HttpSession session) throws Exception {
		uvo = (UserVO) session.getAttribute("user");
		if(uvo != null) {
			List<NoticeVO> noticeList = noticeService.selectNotice(uvo.getNickname());
			session.setAttribute("notice",noticeList);	
		}
		
		if (page.getNum() == 0) {
			page.setNum(1);
		}
		int jjimCart;
		if (uvo == null) {
			jjimCart = 0;
		} else {
			lvo.setUser_seq(uvo.getUser_seq());
		}
		
		jjimCart = postService.jjimCart(lvo);

		page.setCount(postService.count(page));

		int num = page.getNum();
		System.out.println(page.getCount());
		List<Integer> post_seq = new ArrayList<Integer>();

		List<PostVO> list = postService.listPage(page);
		System.out.println(list);
		for (PostVO post : list) {
			post_seq.add(post.getPost_seq());
		}

		List<String> photoNames = new ArrayList<String>();
		for (int post_num : post_seq) {
			photoNames.add(postService.photoOne(post_num));
		}

		model.addAttribute("jjimCart", jjimCart);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		model.addAttribute("list", list);
		model.addAttribute("photo", photoNames);

		// 슬라이더 이미지
		List<BannerVO> banner = adminService.bannerList();
		model.addAttribute("banner", banner);

		return "login/main/mother";
	}

	@RequestMapping(value = "/create.do", method = RequestMethod.GET)
	public String getCreate(HttpSession session, Model model, CategoryVO vo, UserVO uvo, PostVO pvo) {
		System.out.println("판매하기 접속함");

		List<CategoryVO> list = postService.categoryList();
		List<PostVO> plist = postService.postList();
		List<Integer> post_seq = new ArrayList<Integer>();

		for (PostVO post : plist) {
			post_seq.add(post.getPost_seq());
		}

		List<String> photoNames = new ArrayList<String>();
		for (int post_num : post_seq) {
			photoNames.add(postService.photoOne(post_num));
		}
		// 글 목록
		model.addAttribute("plist", plist);

		// 카테고리 리스트
		model.addAttribute("category", list);

		// 이미지 보이기
		model.addAttribute("photo", photoNames);

		return "login/sell";
	}

	@RequestMapping(value = "/createProc.do")
	public String post(Model model, PostVO vo, String pay,
			@RequestParam(value = "origin_file_name", required = false) List<MultipartFile> img, PostPhotoVO pvo,
			PhotoVO photo) {
		System.out.println("글 등록");
		
		if (vo.getPay() == null) {
			vo.setPay(null);
		} else {
			vo.setPay(pay);
		}
		// 상품 등록
		int success = postService.insertPost(vo);
		if (success == 1) {
			model.addAttribute("post", vo);
		}
		int post_seq = postService.post_seq(vo.getUser_seq());
		// 이미지 등록
		Map<String, String> names = postService.uploadImg(img, "post/");
		// 저장이름, 랜덤이름 db에 저장
		Iterator<Entry<String, String>> entries = names.entrySet().iterator();
		while (entries.hasNext()) {
			Map.Entry<String, String> entry = entries.next();
			String origin_file_name = entry.getKey();
			String save_file_name = entry.getValue();

			photo.setPost_seq(post_seq);
			photo.setO_name(origin_file_name);
			photo.setS_name("https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/" + save_file_name);

			postService.insertPhoto(photo);
		}
		return "redirect:main.do";
	}

	// 카카오 페이 체크박스, 상품 상태 라디오버튼
	@RequestMapping("/payCheck.do")
	@ResponseBody
	public void payCheck(PostVO vo) {
		postService.insertPost(vo);
	}

	@RequestMapping(value = "/postDelete.do", method = RequestMethod.GET)
	public String postDelete(int post_seq) throws Exception {
		System.out.println("글 삭제");
		postService.deleteImage(post_seq);
		postService.postDelete(post_seq);
		return "redirect:main.do?num=1";
	}

	@RequestMapping(value = "/postDetail.do", method = RequestMethod.GET)
	public String getDetail(HttpSession session, HashMap<String, Object> info, Model model, int post_seq, UserVO uvo,
			LikeVO lvo) {
		uvo = (UserVO)session.getAttribute("user");
		System.out.println("상세보기");
		postService.viewCount(post_seq); // 조회수
		// 좋아요
		lvo.setPost_seq(post_seq);
		lvo.setUser_seq(uvo.getUser_seq());
		int like = 0;
		
		int check = postService.likeCount(lvo);
		int jjimCart = postService.jjimCart(lvo);
		int allLike = postService.allLike(lvo);

		if (check == 0) {
			postService.likeinsert(lvo);
		} else if (check == 1) {
			like = postService.likeGetInfo(lvo);
		}

		model.addAttribute("like", like);
		model.addAttribute("jjimCart", jjimCart);
		model.addAttribute("allLike",allLike);
		PostVO vo = postService.postDetail(post_seq);
		model.addAttribute("post", vo);

		// 이미지 불러오기
		List<String> photoName = postService.photoDetail(post_seq);
		model.addAttribute("name", photoName);

		return "login/product&purchase/product_detail";
	}

	// 좋아요 컨트롤러
	@PostMapping("/likeupdate.do")
	@ResponseBody
	public Map<String, String> likeupdate(LikeVO vo) {
		Map<String, String> map = new HashMap<String, String>();

		try {
			postService.likeupdate(vo);
			map.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}

	// 카테고리 별 목록 나오게 하기.
	@RequestMapping(value = "/category.do", method = RequestMethod.GET)
	public String categoryDetail(HttpSession session, Model model, int category_seq, PostVO vo, PageVO pvo, LikeVO lvo, UserVO uvo) throws Exception {
		int jjimCart;
		uvo=(UserVO)session.getAttribute("user");
		if (pvo.getNum() == 0) {
			pvo.setNum(1);
		}

		if (uvo == null) {
			jjimCart = 0;
		} else {
			lvo.setUser_seq(uvo.getUser_seq());
		}
		
		jjimCart = postService.jjimCart(lvo);
		
		int num = pvo.getNum();
		pvo.setCount(postService.countCate(category_seq));
		List<Integer> post_seq = new ArrayList<Integer>();
		List<PostVO> list = postService.catePage(pvo.getDisplayPost(), pvo.getPostNum(), category_seq);

		for (PostVO post : list) {
			post_seq.add(post.getPost_seq());
		}
		List<String> photoNames = new ArrayList<String>();
		for (int post_num : post_seq) {
			photoNames.add(postService.photoOne(post_num));
			System.out.println(postService.photoOne(post_num));
		}

		model.addAttribute("jjimCart", jjimCart);
		model.addAttribute("page", pvo);
		model.addAttribute("select", num);
		model.addAttribute("ct", list);
		model.addAttribute("photo", photoNames);
		return "login/main/mother";
	}

	@RequestMapping(value = "/purchased.do", method = RequestMethod.GET)
	public String purchased(Model model, int post_seq) {
		System.out.println("구매완료");
		PostVO vo = postService.postDetail(post_seq);
		return "login/product&purchase/purchased";
	}

	// 판매하기 수정페이지 이동
	@RequestMapping(value = "/updatePost.do")
	public String getUpdate(int post_seq, Model model, LikeVO lvo) throws Exception {
		System.out.println("수정하기");
		PostVO vo = postService.postDetail(post_seq);
		List<CategoryVO> category = postService.categoryList();
		int jjimCart = postService.jjimCart(lvo);
		model.addAttribute("jjimCart", jjimCart);
		model.addAttribute("category", category);
		model.addAttribute("vo", vo);
		return "login/update";
	}

	// 수정하기 폼
	@RequestMapping(value = "/updateProc.do")
	public String postUpdate(PostVO vo) throws Exception {
		System.out.println("수정완료");
		postService.updatePost(vo);
		return "redirect:main.do";
	}

	// 내상품 보기
	@RequestMapping(value = "/myProductCart.do", method = RequestMethod.GET)
	public String myList(Model model, PostVO vo, PageVO pvo, CategoryVO cvo, LikeVO lvo) throws Exception {
		int total = postService.myCount(pvo);
		int jjimCart = postService.jjimCart(lvo);

		// 페이징
		if (pvo.getNum() == 0) {
			pvo.setNum(1);
		}

		pvo.setSort(pvo.getSort()); // 정렬
		pvo.setCount(total);
		int num = pvo.getNum();

		List<Integer> post_seq = new ArrayList<Integer>();
		List<PostVO> list = postService.myPageList(pvo);
		for (PostVO post : list) {
			post_seq.add(post.getPost_seq());
		}

		List<String> photoNames = new ArrayList<String>();
		for (int post_num : post_seq) {
			photoNames.add(postService.photoOne(post_num));
		}

		List<CategoryVO> clist = postService.categoryList();
		model.addAttribute("jjimCart", jjimCart);
		model.addAttribute("total", total);
		model.addAttribute("clist", clist);
		model.addAttribute("page", pvo);
		model.addAttribute("select", num);
		model.addAttribute("list", list);
		model.addAttribute("photo", photoNames);
		return "login/myProductCart";
	}
	
	//찜목록 페이지
	@RequestMapping(value = "/favorite.do")
	public String getFavorite(Model model, PageVO pvo, LikeVO lvo, UserVO uvo, HttpSession session) throws Exception{
		int jjimCart;
		int total = postService.myCount(pvo);
		uvo=(UserVO)session.getAttribute("user");
		
		if (uvo == null) {
			jjimCart = 0;
		} else {
			lvo.setUser_seq(uvo.getUser_seq());
		}
		
		jjimCart = postService.jjimCart(lvo);
		if (pvo.getNum() == 0) {
			pvo.setNum(1);
		}

		pvo.setSort(pvo.getSort()); // 정렬
		
		pvo.setCount(jjimCart);
		int num = pvo.getNum();

		List<Integer> post_seq = new ArrayList<Integer>();
		
		List<PostVO> list = postService.jjimList(pvo);
		System.out.println(list);
		for (PostVO post : list) {
			post_seq.add(post.getPost_seq());
		
		}

		List<String> photoNames = new ArrayList<String>();
		for (int post_num : post_seq) {
			photoNames.add(postService.photoOne(post_num));
		}
		
		model.addAttribute("total",total);
		model.addAttribute("jjimCart",jjimCart);
		model.addAttribute("page", pvo);
		model.addAttribute("select", num);
		model.addAttribute("list", list);
		model.addAttribute("photo", photoNames);
		return "login/jjim_cart";
	}
	
	//찜 삭제
	@RequestMapping(value = "/jjimDelete.do")
	@ResponseBody
	public void jjimDelete(HttpServletRequest request, HttpSession session,UserVO uvo, LikeVO vo, String[] valueArr) {
		uvo = (UserVO)session.getAttribute("user");
		
		int[] num = new int[valueArr.length];
		for(int i=0; i < valueArr.length; i++) {
			num[i] = Integer.parseInt(valueArr[i]);
		}
		
		for(int n : num) {
			vo.setUser_seq(uvo.getUser_seq());
			vo.setPost_seq(n);
			
			System.out.println(n);
			postService.jjimDelete(vo);
		}
		
	}
	
	//신고하기
	@RequestMapping(value = "/report.do")
	@ResponseBody
	public void report() {
		
	}

	// 바로구매 팝업창 띄우기 post db에 pay_status 추가했음 0-판매 1-구매예약대기 2-구매예약 3-구매완료
	@RequestMapping(value = "ppkPayPopUp.do")
	public String ppkPopUp(Model model,UserVO uvo, HttpSession session, HashMap<String, Object> info) {
		System.out.println("구매버튼 클릭");
		PostVO pvo = (PostVO) model.getAttribute("post");
		
		System.out.println(pvo.toString());
		
		if(pvo.getPay_status()==3) {
			model.addAttribute("message","이미 구매 예약이 된 상품입니다.");
		}else {
			pvo.setPay_status(1); // 구매예약 대기로 변경
			int result = postService.updatePayStatus(pvo);
			if (result == 1) {
				System.out.println("SUCC");
				model.addAttribute("message","구매예약 되셨습니다! 아래 qr링크로 3일내 송금이 되지 않을시에는 예약이 취소되니 주의해주세요!");
				if (pvo.getPay_status() == 1) {
					uvo = (UserVO) session.getAttribute("user");
					pvo.setPay_status(2);
					int result1 = postService.updatePayStatus(pvo);
					if (result1 == 1) {
						System.out.println("구매예약 대기 신청 -> 확인완료");
					}
					info.put("sellerId", pvo.getNickname());
					info.put("buyerId", uvo.getNickname());
					info.put("post_seq", pvo.getPost_seq());
					info.put("process", 0);
					info.put("sellerQr", pvo.getPay());
					info.put("buyerQr", uvo.getPay());

					int result2 = postService.insertPPKPay(info);
					if (result2 == 1) {
						System.out.println("구매예약 완료 -> 관리자에게 전달");
					}

				}
				pvo.setPay_status(2);
				result = postService.updatePayStatus(pvo);
				if(result==1) {
					System.out.println("구매예약으로 변경");
				}
			}
		}
		return "login/product&purchase/ppkPopUp";
	}
	// 바로 구매 클릭시 알림에 값넘겨주는 역할
		@RequestMapping(value = "/addPayNotice.do")
		public @ResponseBody String addPayNotice(HttpSession session, Model model, String cmd) {
			System.out.println("페이 알람으로 값 넘겨주자.");
			System.out.println(cmd);
			PostVO pvo = (PostVO) model.getAttribute("post");
			UserVO uvo = (UserVO) session.getAttribute("user");
			System.out.println(pvo.toString());
			String msg = cmd + "," + pvo.getNickname() + "," + uvo.getNickname() + "," + pvo.getPost_seq();
			System.out.println(msg);
			return msg;
		}
		
		// 바로 구매 클릭시 알림에 값넘겨주는 역할
		@RequestMapping(value = "/cancelPayNotice.do")
		public @ResponseBody String cancelPayNotice(HttpSession session, Model model, String cmd) {
			System.out.println("페이 알람으로 값 넘겨주자.");
			System.out.println(cmd);
			PostVO pvo = (PostVO) model.getAttribute("post");
			UserVO uvo = (UserVO) session.getAttribute("user");
			System.out.println(uvo.toString());
			System.out.println(pvo.toString());
			String msg = cmd + "," + pvo.getNickname() + "," + uvo.getNickname() + "," + pvo.getPost_seq();
			System.out.println(msg);
			return msg;
		}
		
		//찜 누르면 알림에 넘겨줌
		@RequestMapping(value="/addJjimNotice.do")
		public @ResponseBody String addJjimNotice(HttpSession session, Model model, String cmd) {
			System.out.println("찜 목록으로 값 넘겨주자.");
			System.out.println(cmd);
			UserVO uvo = (UserVO)session.getAttribute("user");
			PostVO pvo = (PostVO) model.getAttribute("post");
			System.out.println(uvo.toString());
			System.out.println(pvo.toString());
			String msg = cmd + "," + pvo.getNickname() + "," + uvo.getNickname() + "," + pvo.getPost_seq();
			System.out.println(msg);
			return msg;
		}
		//찜 누르면 알림에 넘겨줌
		@RequestMapping(value="/cancelJjimNotice.do")
		public @ResponseBody String cancelJjimNotice(HttpSession session, Model model, String cmd) {
			System.out.println("찜 취소 값 넘겨주자.");
			System.out.println(cmd);
			UserVO uvo = (UserVO)session.getAttribute("user");
			PostVO pvo = (PostVO) model.getAttribute("post");
			System.out.println(uvo.toString());
			System.out.println(pvo.toString());
			String msg = cmd + "," + pvo.getNickname() + "," + uvo.getNickname() + "," + pvo.getPost_seq();
			return msg;
		}

	}
