package com.spring.myweb.User.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.myweb.Service.AdminService.AdminService;
import com.spring.myweb.Service.PostService.PostService;
import com.spring.myweb.VO.AdminVO.BannerVO;
import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.LikeVO.LikeVO;
import com.spring.myweb.VO.PageVO.PageVO;
import com.spring.myweb.VO.PhotoVO.PhotoVO;
import com.spring.myweb.VO.PostVO.PostVO;
import com.spring.myweb.VO.UserVO.UserVO;
import com.spring.myweb.awss3.vo.PostPhotoVO;

@Controller
@SessionAttributes("post")
public class PostController {

	@Autowired
	private PostService postService;

	@Autowired
	private AdminService adminService;

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String postList(Model model, PostVO vo, PageVO page) throws Exception {

		if (page.getNum() == 0) {
			page.setNum(1);
		}
		int total = postService.count(page);
		page.setCount(total);

		int num = page.getNum();
		List<Integer> post_seq = new ArrayList<Integer>();

		List<PostVO> list = postService.listPage(page);
		for (PostVO post : list) {
			post_seq.add(post.getPost_seq());
		}

		List<String> photoNames = new ArrayList<String>();
		for (int post_num : post_seq) {
			photoNames.add(postService.photoOne(post_num));
		}

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
	public String post(Model model, PostVO vo,
			@RequestParam(value = "origin_file_name", required = false) List<MultipartFile> img, PostPhotoVO pvo,
			PhotoVO photo) {

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
	public String getDetail(Model model, int post_seq, UserVO uvo, PostVO vo, HttpSession session) {
		// 좋아요
		LikeVO likeVO = new LikeVO();
		likeVO.setPost_seq(vo.getPost_seq());
		// System.out.println(vo.getPost_seq());
		likeVO.setUser_seq(uvo.getUser_seq());
		// System.out.println(vo.getUser_seq());

		int like = 0;
		int check = postService.likeCount(likeVO);
		if (check == 0) {
			postService.likeinsert(likeVO);
		} else if (check == 1) {
			like = postService.likeGetInfo(likeVO);
		}

		model.addAttribute("like", like);

		postService.viewCount(post_seq); // 조회수

		vo = postService.postDetail(post_seq);
		model.addAttribute("post", vo);

		// 이미지 불러오기
		List<String> photoName = postService.photoDetail(post_seq);
		model.addAttribute("name", photoName);
		return "login/product&purchase/product_detail";
	}

	// 카테고리 별 목록 나오게 하기.
	@RequestMapping(value = "/category.do", method = RequestMethod.GET)
	public String categoryDetail(Model model, int category_seq, PostVO vo, PageVO pvo) throws Exception {
		System.out.println("카테고리 리스트");

		if (pvo.getNum() == 0) {
			pvo.setNum(1);
		}

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
		}

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
	public String getUpdate(int post_seq, Model model) throws Exception {
		System.out.println("수정하기");
		PostVO vo = postService.postDetail(post_seq);
		List<CategoryVO> category = postService.categoryList();

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

	// 좋아요 컨트롤러
	@RequestMapping("/likeupdate.do")
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

		System.out.println("js post" + vo.getPost_seq());
		System.out.println("js user" + vo.getUser_seq());

		return map;
	}

	// 내상품 보기
	@RequestMapping(value = "/myProductCart.do", method = RequestMethod.GET)
	public String myList(Model model, PostVO vo, PageVO pvo, CategoryVO cvo) throws Exception {
		int total = postService.myCount(pvo);

		// 페이징
		if (pvo.getNum() == 0) {
			pvo.setNum(1);
		}

		pvo.setCount(total);
		int num = pvo.getNum();

		List<Integer> post_seq = new ArrayList<Integer>();
		List<PostVO> list = postService.myPageList(pvo);
		for (PostVO post : list) {
			post_seq.add(post.getPost_seq());
		}
		System.out.println(list);
		System.out.println(pvo.getDisplayPost());
		System.out.println(pvo.getPageNum());
		System.out.println(pvo.getCount());

		List<String> photoNames = new ArrayList<String>();
		for (int post_num : post_seq) {
			photoNames.add(postService.photoOne(post_num));
		}

		List<CategoryVO> clist = postService.categoryList();
		model.addAttribute("total", total);
		model.addAttribute("clist", clist);
		model.addAttribute("page", pvo);
		model.addAttribute("select", num);
		model.addAttribute("list", list);
		model.addAttribute("photo", photoNames);
		return "login/myProductCart";
	}

}