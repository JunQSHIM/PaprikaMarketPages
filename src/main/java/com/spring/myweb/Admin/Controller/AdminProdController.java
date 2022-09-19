package com.spring.myweb.Admin.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.myweb.Service.BoardService.UserBoardService;
import com.spring.myweb.VO.UserBoardVO.UserBoardVO;

@Controller
public class AdminProdController {

	@Autowired
	private UserBoardService boardService;

	@RequestMapping(value = "/prods.mdo", method = RequestMethod.GET)

	public String boardList(Model model, UserBoardVO vo) {
		System.out.println("관리자가 상품 목록 페이지로 접속함");
		List<UserBoardVO> list = boardService.boardList();
		model.addAttribute("board", list);
		return "Admin_page/product/ad_prods";
	}

	// 상품정보 페이지 이동 
	@RequestMapping(value = "/prod_de.mdo", method = RequestMethod.GET)
	public String getDetail(Model model, int prod_seq) {
		System.out.println("관리자가 상품정보 페이지로 접속함");
		UserBoardVO vo = boardService.boardDetail(prod_seq);
		model.addAttribute("board", vo);
		return "Admin_page/product/ad_prod_de";
	}
	
	//회원 상세 페이지 이동
	@RequestMapping(value = "/memde.mdo", method = RequestMethod.GET)
	public String memde() {
		System.out.println("관리자가 회원정보 페이지로 접속함");
		return "Admin_page/member/ad_memde";
	}
	
	

	//관리자 상품 삭제
	@RequestMapping(value = "/prodel.mdo", method = RequestMethod.GET)
	public String sellDelete(int board_seq) throws Exception {
		System.out.println("관리자가 상품 삭제함");
		boardService.deleteBoard(board_seq);
		return "redirect:prods.mdo";
	}
}