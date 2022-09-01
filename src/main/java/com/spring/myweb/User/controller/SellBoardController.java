package com.spring.myweb.User.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.myweb.Service.BoardService.BoardService;
import com.spring.myweb.VO.SellboardVO.SellBoardVO;

@Controller
@SessionAttributes("board")
public class SellBoardController {
	
	@Autowired
	private BoardService boardService;
	
	// 메인 페이지에서 판매 중인 상품 목록 불러오기
	@RequestMapping(value="/list.do", method = RequestMethod.GET)
	public String boardList(Model model, SellBoardVO vo) {
		System.out.println("boardList Service");
		List<SellBoardVO> list = boardService.boardList();
		model.addAttribute("board",list);
		return "login/main/prods";
	}
	
	// 판매하기 등록하기 페이지 이동
	@RequestMapping(value = "/create.do", method = RequestMethod.GET)
	public String getCreate() throws Exception {
		System.out.println("판매하기 접속함");
		return "login/sell";
	}
	
	// 판매하기 등록 프로세스
	@RequestMapping(value = "/createProc.do", method =RequestMethod.GET)
	public String insertSell(Model model, SellBoardVO vo){
		System.out.println("판매하기 등록함");
		int success = boardService.insertSell(vo);
		if(success == 1) {
			model.addAttribute("board",vo);
		}
		return "login/main/prods";
	}
	//글 상세보기
	@RequestMapping(value = "/sellDetail.do", method = RequestMethod.GET)
	public String getDetail(Model model, int prod_seq){
		System.out.println("상세보기 페이지 이동");
		boardService.viewCount(prod_seq); // 조회수 증가
		SellBoardVO vo = boardService.sellDetail(prod_seq);
		model.addAttribute("board", vo);
		return "login/product&purchase/product_detail";
	}
	
	@RequestMapping(value = "/sellDelete.do", method = RequestMethod.GET)
	public String sellDelete(int prod_seq) throws Exception{
		System.out.println("판매하기 삭제됨.");
		boardService.sellDelete(prod_seq);
		return "/main.do";
	}
	
	


}
