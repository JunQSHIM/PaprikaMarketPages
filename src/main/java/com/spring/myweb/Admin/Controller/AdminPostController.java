package com.spring.myweb.Admin.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.myweb.Service.BoardService.UserBoardService;
import com.spring.myweb.Service.PostService.PostService;
import com.spring.myweb.VO.PageVO.PageVO;
import com.spring.myweb.VO.PostVO.PostVO;
import com.spring.myweb.VO.UserBoardVO.UserBoardVO;

@Controller
public class AdminPostController {

	@Autowired
	private UserBoardService boardService;
	
	@Autowired 
	private PostService postService;

	@RequestMapping(value = "/prods.mdo", method = RequestMethod.GET)
	public String boardList(Model model, PageVO page) throws Exception {
		
		List<PostVO> list = postService.listPage(page);
		List<Integer> post_seq = new ArrayList<Integer>();
		
		for (PostVO post : list) {
			post_seq.add(post.getPost_seq());
		}

		List<String> photoNames = new ArrayList<String>();
		for (int post_num : post_seq) {
			photoNames.add(postService.photoOne(post_num));
		}

		model.addAttribute("list", list);
		model.addAttribute("photo", photoNames);
		return "Admin_page/product/ad_prods";
	}

	// 상품정보 페이지 이동 
	@RequestMapping(value = "/prod_de.mdo", method = RequestMethod.GET)
	public String getDetail(Model model, int prod_seq) {

		return "Admin_page/product/ad_prod_de";
	}
	
	//회원 상세 페이지 이동
	@RequestMapping(value = "/memde.mdo", method = RequestMethod.GET)
	public String memde() {
		
		return "Admin_page/member/ad_memde";
	}
	
	

	//관리자 상품 삭제
	@RequestMapping(value = "/prodel.mdo", method = RequestMethod.GET)
	public String sellDelete(int board_seq) throws Exception {

		return "redirect:prods.mdo";
	}
}