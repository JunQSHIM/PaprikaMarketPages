package com.spring.myweb.Admin.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.myweb.Service.AdminService.AdminService;
import com.spring.myweb.Service.UserService.UserService;
import com.spring.myweb.VO.AdminVO.BoardVO;
import com.spring.myweb.VO.AdminVO.ReviewSingoVO;
import com.spring.myweb.VO.AdminVO.UserSmsVO;

import com.spring.myweb.Service.RegisterAgreementService.RegisterAgreementService;
import com.spring.myweb.VO.RegisterAgreementVO.RegisterAgreementVO;
import com.spring.myweb.VO.UserVO.UserVO;

@Controller
@SessionAttributes("admin")
public class AdminController {

	@Autowired
	AdminService adminService;

	@Autowired
	UserService userService;

	@Autowired
	RegisterAgreementService agreementService;

	// 메인화면
	@RequestMapping(value = "/main.mdo", method = RequestMethod.GET)
	public String mainAdmin() {
		return "Admin_page/layout/ad_main";
	}

	// 전체 회원 목록
	@RequestMapping(value = "/user.mdo", method = RequestMethod.GET)
	public String userAdmin(Model model) {
		System.out.println("관리자 페이지 회원목록");
		List<UserVO> vo = adminService.selectAll();
		model.addAttribute("list", vo);
		return "Admin_page/member/ad_memlist";
	}

	// 회원 관리 sms
	@RequestMapping(value = "/sms.mdo", method = RequestMethod.GET)
	public String userSmsAdmin(Model model) {
		System.out.println("관리자 페이지 sms 회원목록");
		List<UserSmsVO> sms = adminService.selectSmsAll();
		model.addAttribute("sms", sms);
		return "Admin_page/admin_board/ad_board";
	}

	// 약관 관리
	@RequestMapping(value = "/admin_list.mdo")
	public String adminList(Model model) {
		List<RegisterAgreementVO> agreementList = agreementService.selectAll();
		model.addAttribute("newest", agreementList);
		return "Admin_page/admin_list/agreement";
	}

	// 신고 관리
	@RequestMapping(value = "/singo.mdo", method = RequestMethod.GET)
	public String singoAdmin(Model model) {
		System.out.println("관리자 페이지 singo목록");
		List<ReviewSingoVO> reviewsingo = adminService.selectReviewSingo();
		model.addAttribute("review", reviewsingo);
		return "Admin_page/singo/ad_singo_list";
	}

	// 신고된 페이지 관리
	@RequestMapping(value = "/deleteSingoPage.mdo", method = RequestMethod.GET)
	public String singoDeleteAdmin(int singo_page) throws Exception {
		System.out.println("신고된 페이지 삭제");
		adminService.deleteSingoPage(singo_page);
		return "redirect:singo.mdo";
	}

	// 게시판 관리
	@RequestMapping(value = "/board.mdo", method = RequestMethod.GET)
	public String boardAdmin(Model model) {
		System.out.println("관리자가 게시판관리 목록 접속");
		List<BoardVO> board = adminService.selectBoardAll();
		model.addAttribute("board", board);
		return "Admin_page/admin_page_board/article_manage";
	}

	// 게시글 불러오기
	@RequestMapping(value = "/boardde.mdo", method = RequestMethod.GET)
	public String boardde(Model model, int board_seq) {
		System.out.println("관리자가 게시판내용 페이지 접속");
		BoardVO bde = adminService.boardDetail(board_seq);
		model.addAttribute("board", bde);
		return "Admin_page/admin_page_board/adminBoardContent";
	}
	
	//게시글 삭제
	@RequestMapping(value = "boarddel.mdo", method = RequestMethod.GET)
	public String boarddel(int board_seq) throws Exception {
		System.out.println("관리자가 게시글을 삭제했습니다.");
		adminService.boardDelete(board_seq);
		return "redirect:/boardde.mdo";
	}
}