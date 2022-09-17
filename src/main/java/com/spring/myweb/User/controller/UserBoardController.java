package com.spring.myweb.User.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.myweb.Service.BoardService.UserBoardService;
import com.spring.myweb.Service.PostService.PostService;
import com.spring.myweb.VO.PhotoVO.PhotoVO;
import com.spring.myweb.VO.UserBoardVO.UserBoardVO;

@Controller
@SessionAttributes("board")
public class UserBoardController {
	
	@Autowired
	private UserBoardService boardService;
	
	@Autowired
	private PostService postService;
	
	//userboard list 출력
	@RequestMapping(value="/boardlist.do")
	public String boardList(Model model, UserBoardVO vo) {
		List<UserBoardVO> list = boardService.boardList();
		model.addAttribute("board",list);
		return "login/board/board";
	}
	
	 //판매하기 등록하기 페이지 이동
	@RequestMapping(value = "/insertboard.do")
	public String insertForm(Model model) {
		return "login/board_write/write";
	}
	
	@RequestMapping(value = "/insertboardProc.do")
	public String insertProc(Model model, UserBoardVO vo, @RequestParam(value = "file_1", required = false)List<MultipartFile> img_1, @RequestParam(value = "file_2", required = false)List<MultipartFile> img_2, PhotoVO photo) {
		boardService.insertBoard(vo);
		Map<String, String> img_1_name = postService.uploadImg(img_1, "board/");
		Map<String, String> img_2_name = postService.uploadImg(img_2, "board/");
		
		int board_seq = boardService.board_seq(vo.getUser_seq());
		
		Iterator<Entry<String, String>> entries = img_1_name.entrySet().iterator();
		while (entries.hasNext()) {
			Map.Entry<String, String> entry = entries.next();
			String origin_file_name = entry.getKey();
			String save_file_name = entry.getValue();

			photo.setPost_seq(board_seq);
			photo.setO_name(origin_file_name);
			photo.setS_name("https://paprikamarket.s3.ap-northeast-2.amazonaws.com/board/" + save_file_name);

			postService.insertPhoto(photo);
		}
			Iterator<Entry<String, String>> entries_2 = img_2_name.entrySet().iterator();
			while (entries_2.hasNext()) {
				Map.Entry<String, String> entry = entries_2.next();
				String origin_file_name = entry.getKey();
				String save_file_name = entry.getValue();

				photo.setPost_seq(board_seq);
				photo.setO_name(origin_file_name);
				photo.setS_name("https://paprikamarket.s3.ap-northeast-2.amazonaws.com/board/" + save_file_name);

				postService.insertPhoto(photo);
		}
		return "redirect:boardlist.do";
	}
	
	// 판매하기 등록 프로세스
//	@RequestMapping(value = "/createProc.do", method =RequestMethod.GET)
//	public String insertSell(Model model, SellBoardVO vo){
//		System.out.println("판매하기 등록함");
//		int success = boardService.insertSell(vo);
//		if(success == 1) {
//			model.addAttribute("board",vo);
//		}
//		return "redirect:main.do";
//	}
	//글 상세보기
//	@RequestMapping(value = "/sellDetail.do", method = RequestMethod.GET)
//	public String getDetail(Model model, int prod_seq){
//		System.out.println("상세보기 페이지 이동");
//		boardService.viewCount(prod_seq); // 조회수 증가
//		SellBoardVO vo = boardService.sellDetail(prod_seq);
//		model.addAttribute("board", vo);
//		return "login/product&purchase/product_detail";
//	}
//	
//	@RequestMapping(value = "/sellDelete.do", method = RequestMethod.GET)
//	public String sellDelete(int prod_seq) throws Exception{
//		System.out.println("판매하기 삭제됨.");
//		boardService.sellDelete(prod_seq);
//		return "redirect:main.do";
//	}
	
	


}
