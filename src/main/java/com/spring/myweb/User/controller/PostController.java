package com.spring.myweb.User.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.PostService.PostService;
import com.spring.myweb.VO.PostVO.PostVO;
import com.spring.myweb.VO.UserVO.UserVO;
import com.spring.myweb.awss3.service.AwsS3Service;
import com.spring.myweb.awss3.vo.PostPhotoVO;

@Controller
@SessionAttributes("post")
public class PostController {

	@Autowired
	private PostService postService;

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String postList(Model model, PostVO vo) {
		System.out.println("Post Service");
		List<PostVO> list = postService.postList();
		model.addAttribute("post", list);
		return "login/main/mother";
	}

	@RequestMapping(value = "/create.do", method = RequestMethod.GET)
	public String getCreate(HttpSession session, Model model, CategoryVO vo, UserVO uvo) {
		System.out.println("판매하기 접속함");
		if (uvo != null) {
			List<CategoryVO> list = postService.categoryList();
			model.addAttribute("category", list);
		}
		return "login/sell";
	}

	@RequestMapping(value = "/createProc.do")
	public String post(Model model, PostVO vo, PostPhotoVO pvo) {
		System.out.println("글 등록");
		
		// 이미지 등록
		try {
			String key = pvo.getOrigin_file_name().getOriginalFilename();
			InputStream is = pvo.getOrigin_file_name().getInputStream();
			String contentType = pvo.getOrigin_file_name().getContentType();
			long contentLength = pvo.getOrigin_file_name().getSize();
			AwsS3Service awsS3 = AwsS3Service.getinstance();
			awsS3.upload(is, key, contentType, contentLength);
			System.out.println("이미지 업로드 완료");

		} catch (IOException e) {
			e.printStackTrace();
		}
		int success = postService.insertPost(vo);
		if (success == 1) {
			model.addAttribute("post", vo);
		}
		return "redirect:main.do";
	}

	@RequestMapping(value = "/postDelete.do", method = RequestMethod.GET)
	public String postDelete(int post_seq) throws Exception {
		System.out.println("글 삭제");
		postService.postDelete(post_seq);
		return "redirect:main.do";
	}

	@RequestMapping(value = "/postDetail.do", method = RequestMethod.GET)
	public String getDetail(Model model, int post_seq) {
		System.out.println("상세보기");
		postService.viewCount(post_seq); // 조회수
		PostVO vo = postService.postDetail(post_seq);
		model.addAttribute("post", vo);
		return "login/product&purchase/product_detail";
	}
	
	// 테스트 중
	@RequestMapping(value = "/category.do", method = RequestMethod.GET)
	public String categoryDetail(Model model, int category_seq) {
		System.out.println("카테고리 리스트");
		CategoryVO vo =postService.categoryDetail(category_seq);
		model.addAttribute("list", vo);
		return "login/main/mother";
	}

}
