package com.spring.myweb.User.controller;

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

@Controller
@SessionAttributes("post")
public class PostConroller {

	@Autowired
	private PostService postService;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String postList(Model model, PostVO vo) {
		System.out.println("Post Service");
		List<PostVO> list = postService.postList();
		model.addAttribute("post",list);
		return "login/main/prods";
	}
	
	@RequestMapping(value = "/create.do", method = RequestMethod.GET)
	public String getCreate(HttpSession session, Model model, CategoryVO vo, UserVO uvo) {
		System.out.println("판매하기 접속함");
		uvo = (UserVO)session.getAttribute("user");
		System.out.println(uvo);
		if(uvo != null) {
			System.out.println(uvo.toString());
			List<CategoryVO> list = postService.categoryList();
			model.addAttribute("category",list);
			return "login/sell";
		} else {
			return "redirect:login.do";
		}
	}
	
	@RequestMapping(value = "/createProc.do")
	public String post(Model model, PostVO vo) {
		System.out.println("글 등록");
		int success = postService.insertPost(vo);
		if(success == 1) {
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
		postService.viewCount(post_seq);
		PostVO vo = postService.postDetail(post_seq);
		model.addAttribute("post",vo);
		return "login/product&purchase/product_detail";
	}
	
	
	
	
	
	
	
	
	
	
}
