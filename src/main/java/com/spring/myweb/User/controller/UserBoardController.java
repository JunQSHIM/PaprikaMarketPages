package com.spring.myweb.User.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.myweb.Service.BoardService.UserBoardService;
import com.spring.myweb.Service.PostService.PostService;
import com.spring.myweb.VO.LikeVO.LikeVO;
import com.spring.myweb.VO.PageVO.UserBoardPageVO;
import com.spring.myweb.VO.PhotoVO.PhotoVO;
import com.spring.myweb.VO.UserBoardVO.UserBoardVO;
import com.spring.myweb.VO.UserVO.UserVO;

@Controller
@SessionAttributes("board")
public class UserBoardController {
	
	@Autowired
	private UserBoardService boardService;
	
	@Autowired
	private PostService postService;
	
	//userboard list 출력
	@RequestMapping(value="/boardlist.do")
	public String boardList(HttpSession session, Model model, UserBoardVO vo, UserBoardPageVO pvo, LikeVO lvo) throws Exception {
		UserVO uvo = (UserVO)session.getAttribute("user");
		lvo.setUser_seq(uvo.getUser_seq());
		
		int jjimCart = postService.jjimCart(lvo);
		
		if (pvo.getNum() == 0) {
			pvo.setNum(1);
		}

		int num = pvo.getNum();
		pvo.setCount(boardService.count(vo.getUser_seq()));
		List<Integer> board_seq = new ArrayList<Integer>();
		List<UserBoardVO> list = boardService.listPage(pvo);
		for (UserBoardVO post : list) {
			board_seq.add(post.getBoard_seq());
			post.setNickname(boardService.findNickname(post.getUser_seq()));
		}
		List<String> photoNames = new ArrayList<String>();
		for (int board_num : board_seq) {
			photoNames.add(boardService.photoOne(board_num));
		}
		
		model.addAttribute("jjimCart", jjimCart);
		model.addAttribute("page", pvo);
		model.addAttribute("select", num);
		model.addAttribute("board", list);
		model.addAttribute("photo", photoNames);
		return "login/board/board";
	}
	
	 //판매하기 등록하기 페이지 이동
	@RequestMapping(value = "/insertboard.do")
	public String insertForm(Model model) {
		return "login/board_write/write";
	}
	
	@RequestMapping(value = "/insertboardProc.do")
	public String insertProc(Model model, UserBoardVO vo, @RequestParam(value = "file",required=false)List<MultipartFile> img, PhotoVO photo) {
		boardService.insertBoard(vo);
		Map<String, String> img_1_name = postService.uploadImg(img, "board/");
		
		int board_seq = boardService.board_seq(vo.getUser_seq());
		
		Iterator<Entry<String, String>> entries = img_1_name.entrySet().iterator();
		while (entries.hasNext()) {
			Map.Entry<String, String> entry = entries.next();
			String origin_file_name = entry.getKey();
			String save_file_name = entry.getValue();

			photo.setPost_seq(board_seq);
			photo.setO_name(origin_file_name);
			photo.setS_name("https://paprikamarket.s3.ap-northeast-2.amazonaws.com/board/" + save_file_name);

			boardService.insertPhoto(photo);
		}
		
		return "redirect:boardlist.do";
	}
	
	//userboard list 출력
		@RequestMapping(value="/myboard.do")
		public String myboardList(HttpSession session, Model model, UserBoardVO vo, UserBoardPageVO pvo,LikeVO lvo) throws Exception {
			UserVO uvo = (UserVO)session.getAttribute("user");
			lvo.setUser_seq(uvo.getUser_seq());
			int jjimCart = postService.jjimCart(lvo);
			if (pvo.getNum() == 0) {
				pvo.setNum(1);
			}

			int num = pvo.getNum();
			pvo.setCount(boardService.count(vo.getUser_seq()));

			List<Integer> board_seq = new ArrayList<Integer>();
			List<UserBoardVO> list = boardService.listPage(pvo);
			for (UserBoardVO post : list) {
				board_seq.add(post.getBoard_seq());
				post.setNickname(boardService.findNickname(post.getUser_seq()));
			}
			List<String> photoNames = new ArrayList<String>();
			for (int board_num : board_seq) {
				photoNames.add(boardService.photoOne(board_num));
			}
			model.addAttribute("jjimCart", jjimCart);
			model.addAttribute("page", pvo);
			model.addAttribute("select", num);
			model.addAttribute("board", list);
			model.addAttribute("photo", photoNames);
			return "login/board/board";
		}
	

	//글 상세보기
	@RequestMapping(value = "/boardDetail.do")
	public String getDetail(HttpSession session, Model model, int board_seq, LikeVO lvo){
		UserVO uvo = (UserVO)session.getAttribute("user");
		lvo.setUser_seq(uvo.getUser_seq());
		int jjimCart = postService.jjimCart(lvo);
		
		boardService.viewCount(board_seq); // 조회수 증가
		UserBoardVO vo = boardService.boardDetail(board_seq);
		String photo = boardService.photoOne(board_seq);
		vo.setNickname(boardService.findNickname(vo.getUser_seq()));
		
		model.addAttribute("jjimCart", jjimCart);
		model.addAttribute("board", vo);
		model.addAttribute("photo", photo);
		return "login/board/board_content";
	}

	//글 삭제
	@RequestMapping(value = "/deleteboard.do")
	public String deleteBoard(int board_seq) throws Exception{
		boardService.deleteImage(board_seq);
		boardService.deleteBoard(board_seq);
		return "redirect:boardlist.do";
	}
	//글 수정 창
	@RequestMapping(value = "/updateboard.do")
	public String updateBoard(Model model, int board_seq){
		UserBoardVO vo = boardService.boardDetail(board_seq);
		vo.setBoard_seq(board_seq);
		String photo = boardService.photoOne(board_seq);
		vo.setNickname(boardService.findNickname(vo.getUser_seq()));
		model.addAttribute("board", vo);
		model.addAttribute("photo", photo);
		return "login/board_write/update";
	}
	//글 수정
	@RequestMapping(value = "/updateboardProc.do")
	public String updateBoardProc(UserBoardVO vo, @RequestParam(value = "file",required=false)List<MultipartFile> img, PhotoVO photo){
	boardService.deleteImage(vo.getBoard_seq());
	
	Map<String, String> img_1_name = postService.uploadImg(img, "board/");
	
	int board_seq = boardService.board_seq(vo.getUser_seq());
	
	Iterator<Entry<String, String>> entries = img_1_name.entrySet().iterator();
	while (entries.hasNext()) {
		Map.Entry<String, String> entry = entries.next();
		String origin_file_name = entry.getKey();
		String save_file_name = entry.getValue();

		photo.setPost_seq(board_seq);
		photo.setO_name(origin_file_name);
		photo.setS_name("https://paprikamarket.s3.ap-northeast-2.amazonaws.com/board/" + save_file_name);

		boardService.insertPhoto(photo);
	}
	
	boardService.updateBoard(vo);
	return "redirect:myboard.do";
	}
	

}
