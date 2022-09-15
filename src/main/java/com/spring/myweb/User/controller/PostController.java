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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.myweb.Service.PostService.PostService;
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

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String postList(Model model, PostVO vo, PageVO pvo) throws Exception {
		System.out.println("Post Service");
		System.out.println("페이징");

		if (pvo.getNum() == 0) {
			pvo.setNum(1);
		}

		int num = pvo.getNum();
		pvo.setCount(postService.count());
		List<Integer> post_seq = new ArrayList<Integer>();
		List<PostVO> list = postService.listPage(pvo.getDisplayPost(), pvo.getPostNum());
		for (PostVO post : list) {
			post_seq.add(post.getPost_seq());
		}

		List<String> photoNames = new ArrayList<String>();
		for (int post_num : post_seq) {
			photoNames.add(postService.photoOne(post_num));
			System.out.println(postService.photoOne(post_num));
		}

		model.addAttribute("page", pvo);
		model.addAttribute("select", num);
		model.addAttribute("list", list);
		model.addAttribute("photo", photoNames);
		return "login/main/mother";
	}

	@RequestMapping(value = "/create.do", method = RequestMethod.GET)
	public String getCreate(HttpSession session, Model model, CategoryVO vo, UserVO uvo, PostVO pvo) {
		System.out.println("판매하기 접속함");
		if (uvo != null) {
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
		}

		return "login/sell";
	}

	@RequestMapping(value = "/createProc.do")
	public String post(Model model, PostVO vo,
			@RequestParam(value = "origin_file_name", required = false) List<MultipartFile> img, PostPhotoVO pvo,
			PhotoVO photo) {
		System.out.println("글 등록");

		// 상품 등록
		int success = postService.insertPost(vo);
		if (success == 1) {
			model.addAttribute("post", vo);
		}
		int post_seq = postService.post_seq(vo.getUser_seq());
		// 이미지 등록
		Map<String, String> names = postService.uploadImg(img);
		// 저장이름, 랜덤이름 db에 저장
		Iterator<Entry<String, String>> entries = names.entrySet().iterator();
		while (entries.hasNext()) {
			Map.Entry<String, String> entry = entries.next();
			String origin_file_name = entry.getKey();
			String save_file_name = entry.getValue();

			photo.setPost_seq(post_seq);
			photo.setO_name(origin_file_name);
			photo.setS_name("https://paprikamarket.s3.ap-northeast-2.amazonaws.com/" + save_file_name);

			postService.insertPhoto(photo);
		}
		return "redirect:main.do";
	}

	@RequestMapping(value = "/postDelete.do", method = RequestMethod.GET)
	public String postDelete(int post_seq) throws Exception {
		System.out.println("글 삭제");
		postService.deleteImage(post_seq);
		postService.postDelete(post_seq);
		return "redirect:main.do?num=1";
	}

	@RequestMapping(value = "/postDetail.do", method = RequestMethod.GET)
	public String getDetail(Model model, int post_seq, UserVO uvo, LikeVO lvo) {
		System.out.println("상세보기");
		postService.viewCount(post_seq); // 조회수
		// 좋아요
		lvo.setPost_seq(post_seq);
		lvo.setUser_seq(uvo.getUser_seq());

		int like = 0;

		int check = postService.likeCount(lvo);

		if (check == 0) {
			postService.likeinsert(lvo);
		} else if (check == 1) {
			like = postService.likeGetInfo(lvo);
		}

		model.addAttribute("like", like);

		PostVO vo = postService.postDetail(post_seq);
		model.addAttribute("post", vo);

		// 이미지 불러오기
		List<String> photoName = postService.photoDetail(post_seq);
		model.addAttribute("name", photoName);
		return "login/product&purchase/product_detail";
	}

	// 카테고리 별 목록 나오게 하기.
	@RequestMapping(value = "/category.do", method = RequestMethod.GET)
	public String categoryDetail(Model model, int category_seq) {
		System.out.println("카테고리 리스트");
		List<PostVO> vo = postService.categoryDetail(category_seq);
		model.addAttribute("post", vo);

		return "login/main/mother";
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

	@RequestMapping(value = "/updateProc.do")
	public String postUpdate(PostVO vo) throws Exception {
		System.out.println("수정완료");
		postService.updatePost(vo);
		return "redirect:main.do";
	}

	// 좋아요 컨트롤러
	@PutMapping("/likeupdate.do")
	public Map<String, String> likeUpdate(@RequestBody LikeVO vo) {
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

	// 내상품 보기
	@RequestMapping(value = "/myProductCart.do", method = RequestMethod.GET)
	public String myList(Model model, PostVO vo, PageVO pvo, CategoryVO cvo) throws Exception {
		int total = postService.count();
		// 페이징
		if (pvo.getNum() == 0) {
			pvo.setNum(1);
		}

		int num = pvo.getNum();
		pvo.setCount(postService.count());
		List<Integer> post_seq = new ArrayList<Integer>();
		List<PostVO> list = postService.listPage(pvo.getDisplayPost(), pvo.getPostNum());
		for (PostVO post : list) {
			post_seq.add(post.getPost_seq());
		}

		List<String> photoNames = new ArrayList<String>();
		for (int post_num : post_seq) {
			photoNames.add(postService.photoOne(post_num));
			System.out.println(postService.photoOne(post_num));
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

	/*
	 * @RequestMapping(value = "/listPage.do", method = RequestMethod.GET) public
	 * String getlistPage(Model model, @RequestParam("num") int num) throws
	 * Exception { System.out.println("페이징"); // 게시물 총 개수 int count =
	 * postService.count(); // 한페이지에 출력할 게시물 수 int postNum = 5; // 하단 페이지 번호([게시물 총
	 * 갯수 ÷ 한 페이지에 출력할 개수] 의 올림) int pageNum =
	 * (int)Math.ceil((double)count/postNum); // 출력할 게시물 int displayPost = (num -1)
	 * * postNum; //한번에 표시할 페이징 번호의 갯수 int pageNum_cnt = 3; //표시되는 페이지 번호 중 마지막 번호
	 * int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) *
	 * pageNum_cnt); // 표시되는 페이지 번호 중 첫번째 번호 int startPageNum = endPageNum -
	 * (pageNum_cnt - 1); // 마지막 번호 재계산 int endPageNum_tmp =
	 * (int)(Math.ceil((double)count / (double)pageNum_cnt)); if(endPageNum >
	 * endPageNum_tmp) { endPageNum = endPageNum_tmp; } boolean prev = startPageNum
	 * == 1 ? false : true; boolean next = endPageNum * pageNum_cnt >= count ? false
	 * : true; // 시작 및 끝 번호 model.addAttribute("startPageNum", startPageNum);
	 * model.addAttribute("endPageNum", endPageNum); // 이전 및 다음
	 * model.addAttribute("prev", prev); model.addAttribute("next", next); // 현재 페이지
	 * model.addAttribute("select", num); List<PostVO> list =
	 * postService.listPage(displayPost, postNum);
	 * model.addAttribute("pageNum",pageNum); model.addAttribute("list", list);
	 * return "login/main/listPage"; }
	 */
}