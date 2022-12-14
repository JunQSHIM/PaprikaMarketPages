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
import com.spring.myweb.Service.UserService.UserService;
import com.spring.myweb.VO.AdminVO.BannerVO;
import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.DealVO.DealVO;
import com.spring.myweb.VO.LikeVO.LikeVO;
import com.spring.myweb.VO.MyMannerVO.MyMannerVO;
import com.spring.myweb.VO.OneOnOneVO.OneOnOneVO;
import com.spring.myweb.VO.PageVO.PageVO;
import com.spring.myweb.VO.PhotoVO.PhotoVO;
import com.spring.myweb.VO.PostVO.PostVO;
import com.spring.myweb.VO.ReportVO.ReportVO;
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

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String postList(Model model, PageVO page, LikeVO lvo, UserVO uvo, HttpSession session) throws Exception {
		uvo = (UserVO) session.getAttribute("user");
		if (uvo != null) {
			List<NoticeVO> noticeList = noticeService.selectNotice(uvo.getNickname());
			session.setAttribute("notice", noticeList);
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
		List<Integer> post_seq = new ArrayList<Integer>();
		List<PostVO> temp = postService.listPage(page);
		List<PostVO> list = new ArrayList<PostVO>();
		for (PostVO post : temp) {
			post_seq.add(post.getPost_seq());
			if (postService.withdrawalPost(post.getUser_seq()) == 1) {
				list.add(post);
			}
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

		// ???????????? ?????????
		List<BannerVO> banner = adminService.bannerList();
		model.addAttribute("banner", banner);

		return "login/main/mother";
	}

	// ????????? ??????
	@RequestMapping(value = "/myProductCart.do", method = RequestMethod.GET)
	public String myList(HttpSession session, Model model, PostVO vo, PageVO pvo, CategoryVO cvo, LikeVO lvo,
			UserVO uvo) throws Exception {
		uvo = (UserVO) session.getAttribute("user");
		int total = postService.myCount(pvo);
		int jjimCart = postService.jjimCart(lvo);
		int reviewCnt = postService.reviewCount(uvo.getUser_seq());

		// ?????????
		if (pvo.getNum() == 0) {
			pvo.setNum(1);
		}

		pvo.setSort(pvo.getSort()); // ??????
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
		model.addAttribute("reviewCnt", reviewCnt);
		model.addAttribute("jjimCart", jjimCart);
		model.addAttribute("total", total);
		model.addAttribute("clist", clist);
		model.addAttribute("page", pvo);
		model.addAttribute("select", num);
		model.addAttribute("list", list);
		model.addAttribute("photo", photoNames);
		return "login/myProductCart";
	}

	@RequestMapping(value = "/create.do", method = RequestMethod.GET)
	public String getCreate(HttpSession session, Model model, CategoryVO vo, UserVO uvo, PostVO pvo, PageVO page,
			LikeVO lvo) throws Exception {

		int total = postService.myCount(page);
		int jjimCart = postService.jjimCart(lvo);
		int allLike = postService.allLike(lvo);
		if (page.getNum() == 0) {
			page.setNum(1);
		}
		page.setCount(total);
		int num = page.getNum();

		List<CategoryVO> list = postService.categoryList();
		List<PostVO> plist = postService.myPageList(page);
		List<Integer> post_seq = new ArrayList<Integer>();

		for (PostVO post : plist) {
			post_seq.add(post.getPost_seq());
		}

		List<String> photoNames = new ArrayList<String>();
		for (int post_num : post_seq) {
			photoNames.add(postService.photoOne(post_num));
		}

		List<DealVO> doneDealList = userService.doneDealList(uvo.getUser_seq());

		List<String> photoDeal = new ArrayList<String>();
		for (DealVO post_num : doneDealList) {
			photoDeal.add(postService.photoOne(post_num.getPost_seq()));
		}
		// ??? ??????
		model.addAttribute("plist", plist);
		model.addAttribute("select", num);
		model.addAttribute("page", page);
		model.addAttribute("jjimCart", jjimCart);
		model.addAttribute("allLike", allLike);

		// ???????????? ?????????
		model.addAttribute("category", list);

		// ????????? ?????????
		model.addAttribute("photo", photoNames);
		model.addAttribute("dealPhoto", photoDeal);

		// ????????????
		model.addAttribute("doneDeal", doneDealList);

		return "login/sell";
	}

	@RequestMapping(value = "/createProc.do")
	public String post(Model model, PostVO vo, String pay,
			@RequestParam(value = "origin_file_name", required = false) List<MultipartFile> img, PostPhotoVO pvo,
			PhotoVO photo) {

		if (vo.getPay() == null) {
			vo.setPay(null);
		} else {
			vo.setPay(pay);
		}
		// ?????? ??????
		int success = postService.insertPost(vo);
		if (success == 1) {
			model.addAttribute("post", vo);
		}
		int post_seq = postService.post_seq(vo.getUser_seq());

		// ????????? ??????
		Map<String, String> names = postService.uploadImg(img, "post/");
		// ????????????, ???????????? db??? ??????
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

	// ????????? ?????? ????????????, ?????? ?????? ???????????????
	@RequestMapping("/payCheck.do")
	@ResponseBody
	public void payCheck(PostVO vo) {
		postService.insertPost(vo);
	}

	@RequestMapping(value = "/postDelete.do", method = RequestMethod.GET)
	public String postDelete(HttpSession session, int post_seq) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		int user_seq = user.getUser_seq();
		System.out.println("??? ??????");
		postService.deleteImage(post_seq);
		postService.postDelete(post_seq);
		return "redirect:main.do";
	}

	@RequestMapping(value = "upPost.do")
	public String upPost(HttpSession session, int post_seq) throws Exception {
		UserVO user = (UserVO) session.getAttribute("user");
		int user_seq = user.getUser_seq();
		postService.upPost(post_seq);
		return "redirect:create.do?user_seq=" + user_seq;
	}

	@RequestMapping(value = "/postDetail.do", method = RequestMethod.GET)
	public String getDetail(HttpSession session, HashMap<String, Object> info, Model model, int post_seq, UserVO uvo,
			LikeVO lvo, ReportVO rvo) throws Exception {
		uvo = (UserVO) session.getAttribute("user");
		PostVO vo = postService.postDetail(post_seq);
		postService.viewCount(post_seq); // ?????????

		if (uvo != null) {
			List<MyMannerVO> manner = postService.reviewList(vo.getUser_seq());
			for (MyMannerVO mm : manner) {
				mm.setPost_title(postService.findReviewer(mm.getPost_seq()));
				mm.setNickname(postService.Reviewer(mm.getUser_seq()));
			}
			model.addAttribute("manner", manner);

			// ?????????
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
			model.addAttribute("allLike", allLike);
		}

		int report = 0;
		if (postService.reportStatus(rvo).isEmpty()) {
			report = 1;
		}

		int category_seq = vo.getCategory_seq();

		// ????????????
		List<Integer> cate_seq = postService.related(category_seq);
		List<String> rPhotoName = new ArrayList<String>();
		for (int post : cate_seq) {
			rPhotoName.add(postService.photoOne(post));
		}

		model.addAttribute("cate_seq", cate_seq);
		model.addAttribute("rPhotoName", rPhotoName);
		model.addAttribute("report", report);

		model.addAttribute("post", vo);

		// ????????? ????????????
		List<String> photoName = postService.photoDetail(post_seq);
		model.addAttribute("name", photoName);

		return "login/product&purchase/product_detail";
	}

	// ????????? ????????????
	@PostMapping("/likeupdate.do")
	@ResponseBody
	public void likeupdate(LikeVO vo) {
		postService.likeupdate(vo);
	}

	// ???????????? ??? ?????? ????????? ??????.
	@RequestMapping(value = "/category.do", method = RequestMethod.GET)
	public String categoryDetail(HttpSession session, Model model, int category_seq, PostVO vo, PageVO pvo, LikeVO lvo,
			UserVO uvo) throws Exception {
		int jjimCart;
		uvo = (UserVO) session.getAttribute("user");
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
		PostVO vo = postService.postDetail(post_seq);
		return "login/product&purchase/purchased";
	}

	// ???????????? ??????????????? ??????
	@RequestMapping(value = "/updatePost.do")
	public String getUpdate(int post_seq, Model model, LikeVO lvo) throws Exception {
		PostVO vo = postService.postDetail(post_seq);
		List<CategoryVO> category = postService.categoryList();
		int jjimCart = postService.jjimCart(lvo);
		model.addAttribute("jjimCart", jjimCart);
		model.addAttribute("category", category);
		model.addAttribute("vo", vo);
		return "login/update";
	}

	// ???????????? ???
	@RequestMapping(value = "/updateProc.do")
	public String postUpdate(PostVO vo,
			@RequestParam(value = "origin_file_name", required = false) List<MultipartFile> img, PhotoVO photo)
			throws Exception {
		System.out.println("????????????");

		postService.deleteImage(vo.getPost_seq());
		Map<String, String> img_name = postService.uploadImg(img, "post/");

		Iterator<Entry<String, String>> entries = img_name.entrySet().iterator();
		while (entries.hasNext()) {
			Map.Entry<String, String> entry = entries.next();
			String origin_file_name = entry.getKey();
			String save_file_name = entry.getValue();

			photo.setPost_seq(vo.getPost_seq());
			photo.setO_name(origin_file_name);
			photo.setS_name("https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/" + save_file_name);

			postService.insertPhoto(photo);
		}

		postService.updatePost(vo);

		return "redirect:main.do";
	}

	// ????????? ?????????
	@RequestMapping(value = "/favorite.do")
	public String getFavorite(Model model, PageVO pvo, LikeVO lvo, UserVO uvo, HttpSession session) throws Exception {
		int jjimCart;
		int total = postService.myCount(pvo);
		uvo = (UserVO) session.getAttribute("user");

		if (uvo == null) {
			jjimCart = 0;
		} else {
			lvo.setUser_seq(uvo.getUser_seq());
		}

		jjimCart = postService.jjimCart(lvo);
		if (pvo.getNum() == 0) {
			pvo.setNum(1);
		}

		pvo.setSort(pvo.getSort()); // ??????

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

		model.addAttribute("total", total);
		model.addAttribute("jjimCart", jjimCart);
		model.addAttribute("page", pvo);
		model.addAttribute("select", num);
		model.addAttribute("list", list);
		model.addAttribute("photo", photoNames);
		return "login/jjim_cart";
	}

	// ??? ??????
	@RequestMapping(value = "/jjimDelete.do")
	@ResponseBody
	public void jjimDelete(HttpServletRequest request, HttpSession session, UserVO uvo, LikeVO vo, String[] valueArr) {
		uvo = (UserVO) session.getAttribute("user");

		int[] num = new int[valueArr.length];
		for (int i = 0; i < valueArr.length; i++) {
			num[i] = Integer.parseInt(valueArr[i]);
		}

		for (int n : num) {
			vo.setUser_seq(uvo.getUser_seq());
			vo.setPost_seq(n);

			postService.jjimDelete(vo);
		}

	}

	// ????????????
	@RequestMapping(value = "/report.do")
	@ResponseBody
	public void report(Model model, HttpSession session, ReportVO vo, PostVO pvo, UserVO uvo) throws Exception {
		uvo = (UserVO) session.getAttribute("user");
		vo.setUser_seq(uvo.getUser_seq());
		pvo = (PostVO) model.getAttribute("post");
		vo.setUser_singo_seq(pvo.getUser_seq());
		int repNo = uvo.getRep_no();
		if (vo.getUser_singo_seq() == pvo.getUser_seq()) {
			repNo += 1;
			uvo.setRep_no(repNo);
		}
		userService.repNo(pvo.getUser_seq());
		postService.postReport(vo);
	}

	// ???????????? ????????? ??????
	@RequestMapping(value = "reviewProductView.do")
	public String reviewProductView(HttpSession session, Model model, PostVO post, UserVO uvo, LikeVO lvo, PageVO pvo,
			MyMannerVO mvo) throws Exception {
		uvo = (UserVO) session.getAttribute("user");
		int total = postService.myCount(pvo);

		int jjimCart;
		if (uvo == null) {
			jjimCart = 0;
		} else {
			lvo.setUser_seq(uvo.getUser_seq());
		}
		int reviewCnt = postService.reviewCount(uvo.getUser_seq());

		List<MyMannerVO> manner = postService.reviewList(post.getUser_seq());
		for (MyMannerVO mm : manner) {
			mm.setPost_title(postService.findReviewer(mm.getPost_seq()));
			mm.setNickname(postService.Reviewer(mm.getUser_seq()));
		}

		jjimCart = postService.jjimCart(lvo);
		model.addAttribute("reviewCnt", reviewCnt);
		model.addAttribute("total", total);
		model.addAttribute("jjimCart", jjimCart);
		model.addAttribute("manner", manner);
		return "login/review_product";
	}

	// ???????????? ????????? ????????? post db??? pay_status ???????????? 0-?????? 1-?????????????????? 2-???????????? 3-????????????
	@RequestMapping(value = "ppkPayPopUp.do")
	public String ppkPopUp(Model model, UserVO uvo, HttpSession session, HashMap<String, Object> info) {
		PostVO pvo = (PostVO) model.getAttribute("post");

		if (pvo.getPay_status() == 3) {
			model.addAttribute("message", "?????? ?????? ????????? ??? ???????????????.");
		} else {
			pvo.setPay_status(1); // ???????????? ????????? ??????
			int result = postService.updatePayStatus(pvo);
			if (result == 1) {
				model.addAttribute("message", "???????????? ???????????????! ?????? qr????????? 3?????? ????????? ?????? ??????????????? ????????? ???????????? ??????????????????!");
				if (pvo.getPay_status() == 1) {
					uvo = (UserVO) session.getAttribute("user");
					pvo.setPay_status(2);
					int result1 = postService.updatePayStatus(pvo);
					if (result1 == 1) {
					}
					UserVO uvo2 = (UserVO) userService.selectByUserSeq(pvo.getUser_seq());
					info.put("sellerId", pvo.getNickname());
					info.put("buyerId", uvo.getNickname());
					info.put("post_seq", pvo.getPost_seq());
					info.put("process", 0);
					info.put("sellerQr", pvo.getPay());
					info.put("buyerQr", uvo.getPay());
					info.put("sellerKID", uvo2.getKID());
					info.put("buyerKID", uvo.getKID());

					int result2 = postService.insertPPKPay(info);
					if (result2 == 1) {
					}

				}
				pvo.setPay_status(2);
				result = postService.updatePayStatus(pvo);
				if (result == 1) {
				}
			}
		}
		return "login/product&purchase/ppkPopUp";
	}

	// ?????? ?????? ????????? ????????? ??????????????? ??????
	@RequestMapping(value = "/addPayNotice.do")
	public @ResponseBody String addPayNotice(HttpSession session, Model model, String cmd) {
		PostVO pvo = (PostVO) model.getAttribute("post");
		UserVO uvo = (UserVO) session.getAttribute("user");
		String msg = cmd + "," + pvo.getNickname() + "," + uvo.getNickname() + "," + pvo.getPost_seq();
		return msg;
	}

	// ?????? ?????? ????????? ????????? ??????????????? ??????
	@RequestMapping(value = "/cancelPayNotice.do")
	public @ResponseBody String cancelPayNotice(HttpSession session, Model model, String cmd) {
		System.out.println(cmd);
		PostVO pvo = (PostVO) model.getAttribute("post");
		UserVO uvo = (UserVO) session.getAttribute("user");
		System.out.println(uvo.toString());
		System.out.println(pvo.toString());
		String msg = cmd + "," + pvo.getNickname() + "," + uvo.getNickname() + "," + pvo.getPost_seq();
		System.out.println(msg);
		return msg;
	}

	// ??? ????????? ????????? ?????????
	@RequestMapping(value = "/addJjimNotice.do")
	public @ResponseBody String addJjimNotice(HttpSession session, Model model, String cmd) {
		UserVO uvo = (UserVO) session.getAttribute("user");
		PostVO pvo = (PostVO) model.getAttribute("post");
		String msg = cmd + "," + pvo.getNickname() + "," + uvo.getNickname() + "," + pvo.getPost_seq();
		return msg;
	}

	// ??? ????????? ????????? ?????????
	@RequestMapping(value = "/cancelJjimNotice.do")
	public @ResponseBody String cancelJjimNotice(HttpSession session, Model model, String cmd) {
		System.out.println(cmd);
		UserVO uvo = (UserVO) session.getAttribute("user");
		PostVO pvo = (PostVO) model.getAttribute("post");
		String msg = cmd + "," + pvo.getNickname() + "," + uvo.getNickname() + "," + pvo.getPost_seq();
		return msg;
	}

	// ??????????????? ???????????????
	@RequestMapping(value = "/sendReport.do")
	public @ResponseBody String sendReport(HttpSession session, Model model, String cmd) {
		UserVO uvo = (UserVO) session.getAttribute("user");
		PostVO pvo = (PostVO) model.getAttribute("post");
		String msg = cmd + "," + pvo.getNickname() + "," + uvo.getNickname() + "," + pvo.getPost_seq();
		return msg;
	}

	// 1:1??????
	@RequestMapping(value = "oneOnOne.do")
	@ResponseBody
	public void oneOnInsert(OneOnOneVO one) throws Exception {
		postService.oneOnInsert(one);
	}
}
