package com.spring.myweb.User.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.myweb.DAO.SellBoardDAO.SellBoardDAOImpl;
import com.spring.myweb.Service.BoardService.BoardService;
import com.spring.myweb.VO.SellboardVO.SellBoardVO;

@Controller
@SessionAttributes("board")
public class SellBoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/list.do", method = RequestMethod.GET)
	public String boardList(Model model, SellBoardVO vo) {
		System.out.println("boardList Service");
		List<SellBoardVO> list = boardService.boardList();
		model.addAttribute("board",list);
		return "login/main/prods";
	}
}
