package com.spring.myweb.Admin.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.myweb.Service.AdminService.AdminService;
import com.spring.myweb.Service.AdminService.PayService.PayService;
import com.spring.myweb.Service.PostService.PostService;
import com.spring.myweb.Service.RegisterAgreementService.RegisterAgreementService;
import com.spring.myweb.Service.UserService.UserService;
import com.spring.myweb.VO.AdminVO.BannerVO;
import com.spring.myweb.VO.AdminVO.BoardSingoVO;
import com.spring.myweb.VO.AdminVO.BoardVO;
import com.spring.myweb.VO.AdminVO.PostSingoVO;
import com.spring.myweb.VO.AdminVO.ReviewSingoVO;
import com.spring.myweb.VO.AdminVO.UserSmsVO;
import com.spring.myweb.VO.AdminVO.PayVO.PayVO;
import com.spring.myweb.VO.QnaVO.QnaAnswersVO;
import com.spring.myweb.VO.QnaVO.QnaQuestionsVO;
import com.spring.myweb.VO.QnaVO.QnaVO;
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
	PayService payService;

	@Autowired
	PostService postService;
	
	

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

	// 약관 불러오기
	@RequestMapping(value = "/admin_list.mdo")
	public String adminList(Model model,int agreement_seq) {
		RegisterAgreementVO agreementList = agreementService.select(agreement_seq);
		model.addAttribute("newest", agreementList);
		return "Admin_page/admin_list/agreement";
	}
	//약관 수정
	@RequestMapping(value = "/edit_agreement.mdo")
	public String editagreement(Model model, RegisterAgreementVO vo) {
		System.out.println("수정...");
		agreementService.update(vo);
		return "redirect:admin_list.mdo?agreement_seq=1";
	}

	//신고 관리
		@RequestMapping(value = "/singo.mdo", method=RequestMethod.GET)
		public String singoAdmin(Model model) {
			System.out.println("관리자 페이지 singo목록");
			List<BoardSingoVO> boardsingo = adminService.selectBoardSingo();
			List<ReviewSingoVO> reviewsingo = adminService.selectReviewSingo();
			List<PostSingoVO> postsingo = adminService.selectPostSingo();
			model.addAttribute("review", reviewsingo);
			model.addAttribute("board", boardsingo);
			model.addAttribute("post", postsingo);
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
	@RequestMapping(value = "/board.mdo", method=RequestMethod.GET)
	public String boardAdmin(Model model) {
		System.out.println("관리자 페이지 게시판목록");
		List<BoardVO> board = adminService.selectBoardAll();
		model.addAttribute("board",board);
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
		return "redirect:/board.mdo";
	}
	
	//관리자 목록보기
	@RequestMapping(value="adminList.mdo")
	public String adminList(Model model){
		List<UserVO> list = adminService.adminList();
		model.addAttribute("adminList",list);
		return "Admin_page/admin_list/admin_list";
	}
	
	//관리자 권한 설정하기 
	@RequestMapping(value="adminAuthority.mdo")
	public String adminAuthority(Model model){
		List<UserVO> list = adminService.adminList();
		model.addAttribute("adminList",list);
		return "Admin_page/admin_list/admin_authority";
	}
	
	//관리자 권한 추가창으로 이동하기 
	@RequestMapping(value="giveAdmin.mdo")
	public String giveAdmin() {
		return "Admin_page/admin_list/add";
	}
	
	//관리자 권한 추가창에서 아이디로 회원 검색
	@RequestMapping(value="checkId.mdo")
	public @ResponseBody UserVO checkId(@ModelAttribute("vo") UserVO vo ,String id) throws Exception{
		vo = userService.select(id);
		return vo;
	}
	
	@RequestMapping(value="giveAdmin.mdo", method=RequestMethod.POST)
	public String giveAdminAuthority(String id, UserVO vo) {
		int result = adminService.giveAdmin(id);
		if(result ==1 ) {
			vo = userService.select(id);
		}
		return "Admin_page/admin_list/add";
	}
	
	//관리자 권한 수정 및 삭제 
	@RequestMapping(value="editAdmin.mdo")
	public String updateAdmin(Model model) {
		List<UserVO> list = adminService.adminList();
		model.addAttribute("adminList",list);
		return "Admin_page/admin_list/edit";
	}
	
	//관리자 권한 수정 및 삭제 
	@RequestMapping(value="editAdmin.mdo", method=RequestMethod.POST)
	public String editAdmin(UserVO vo, String id, String stat, Model model) {
		int idx = 0;
		String[] ids = id.split(",");
		String[] stats = stat.split(",");
		for(int i=0; i<stats.length; i++) {
			if(stats[i].equals("delete")) {
				idx = i;
			}
		}
		id = ids[idx];
		int result = adminService.deleteAdmin(id);
		if(result ==1 ) {
			vo = userService.select(id);
		}
		return "redirect:adminList.mdo";
	}
	
	//qna 
	@RequestMapping(value="qna.mdo")
	public String qna(Model model) {
		List<QnaVO> qnaList = adminService.selectQnaCate();
		List<QnaQuestionsVO> questionsList = adminService.selectQuestions();
		List<QnaAnswersVO> answersList = adminService.selectAnswers();

		model.addAttribute("qnaList",qnaList);
		model.addAttribute("qList",questionsList);
		model.addAttribute("aList",answersList);

		return "Admin_page/admin_list/qna";
	}
	
	//qna 추가
	@RequestMapping(value="addQna.mdo")
	public String addQna(Model model) {
		List<QnaVO> qnaList = adminService.selectQnaCate();
		List<QnaQuestionsVO> questionsList = adminService.selectQuestions();
		List<QnaAnswersVO> answersList = adminService.selectAnswers();

		model.addAttribute("qnaList",qnaList);
		model.addAttribute("qList",questionsList);
		model.addAttribute("aList",answersList);
		return "Admin_page/admin_list/addQna";
	}
	
	@RequestMapping(value="catePopUp.mdo")
	public String catePopUp() {
		return "Admin_page/admin_list/catePopUp";
	}
	
	@RequestMapping(value="catePopUp.mdo", method=RequestMethod.POST)
	public String addCate(String qna_title) {
		int result = adminService.insertQnaCate(qna_title);
		if(result == 1) {
			System.out.println("Succ");
		}
		return "Admin_page/admin_list/catePopUpConfirm";
	}
	@RequestMapping(value="qPopUp.mdo")
	public String qPopUp(Model model) {
		List<QnaVO> qnaList = adminService.selectQnaCate();
		model.addAttribute("qnaList",qnaList);
		return "Admin_page/admin_list/qPopUp";
	}
	
	@RequestMapping(value="qPopUp.mdo", method=RequestMethod.POST)
	public String qPopUpConfirm(String qna_title, String question, String[] answer,HashMap<String,String> qnas) {
		qnas.put("qna_title", qna_title);
		qnas.put("question", question);
		int result1 = 0;
		if(adminService.checkQ(question)<1) {
			result1 = adminService.insertQ(qnas);
			if(result1 == 1) {
				System.out.println("Succ");
			}
		}
		for(int i=0; i<answer.length; i++) {
			qnas.put("answer", answer[i]);
			int result2 = 0;
			result2 = adminService.insertA(qnas);
			if(result2==1) {
				System.out.println("Succ");
			}
			qnas.remove("answer",answer[i]);
		}
		return "Admin_page/admin_list/qPopUpConfirm";
	}
	
	//Qna 삭제 및 수정 
	@RequestMapping(value="updateQna.mdo")
	public String updateQna(Model model) {
		List<QnaVO> qnaList = adminService.selectQnaCate();
		List<QnaQuestionsVO> questionsList = adminService.selectQuestions();
		List<QnaAnswersVO> answersList = adminService.selectAnswers();

		model.addAttribute("qnaList",qnaList);
		model.addAttribute("qList",questionsList);
		model.addAttribute("aList",answersList);
		return "Admin_page/admin_list/editQna";
	}
	
	@RequestMapping(value="updateCatePopUp.mdo")
	public String catePopUp(Model model) {
		List<QnaVO> qnaList = adminService.selectQnaCate();
		model.addAttribute("qnaList",qnaList);
		return "Admin_page/admin_list/updateCatePopUp";
	}
	
	@RequestMapping(value="updateCatePopUp.mdo", method=RequestMethod.POST)
	public String updateCatePopUp(Model model, QnaVO vo, String qna_title) {
		vo = adminService.selectCateStr(qna_title);
		model.addAttribute("qnaCate",vo);
		return "Admin_page/admin_list/updateCatePopUp";
	}
	
	@RequestMapping(value="updateCatePopUpConfirm.mdo")
	public String updateCatePopUpConfirm(Model model, int qna_seq, QnaVO vo, String qna_title, HashMap<String, Object> qnas) {
		qnas.put("qna_seq",vo.getQna_seq());
		qnas.put("qna_title", qna_title);
		if(qna_title.equals("")){
			adminService.deleteQna(qnas);
			return "Admin_page/admin_list/updateCatePopUpConfirm";
		}
		vo = adminService.selectCate(qna_seq);
		int result1 = adminService.updateQnaCateofQ(qnas);
		int result2 = adminService.updateQnaCate(qnas);
		if(result1==1 && result2==1) {
			System.out.println("Succ");
		}else {
			System.out.println("Fail");
		}
		return "Admin_page/admin_list/updateCatePopUpConfirm";
	}
	
	//QnA 수정
	@RequestMapping(value="updateQPopUp.mdo")
	public String updateQPopUp(Model model) {
		List<QnaVO> qnaList = adminService.selectQnaCate();
		List<QnaQuestionsVO> questionsList = adminService.selectQuestions();
		List<QnaAnswersVO> answersList = adminService.selectAnswers();

		model.addAttribute("qnaList",qnaList);
		model.addAttribute("qList",questionsList);
		model.addAttribute("aList",answersList);
		return "Admin_page/admin_list/updateQPopUp";
	}
	
	@RequestMapping(value="qList.mdo")
	public @ResponseBody List<QnaQuestionsVO> qList(String qna_title) throws Exception{
		List<QnaQuestionsVO> qList = adminService.bringQ(qna_title);
		return qList;
	}
	
	@RequestMapping(value="aList.mdo")
	public @ResponseBody List<QnaAnswersVO> aList(String question) throws Exception{
		List<QnaAnswersVO> aList = adminService.bringA(question);
		return aList;
	}
	
	@RequestMapping(value="updateQPopUpConfirm.mdo")
	public String updateQConfirm(String qna_title, String question, String answer, Model model) {
		model.addAttribute("question",question);
		model.addAttribute("answer",answer);
		QnaQuestionsVO qVO = adminService.selectQStr(question);
		QnaAnswersVO aVO = adminService.selectAStr(answer);
		model.addAttribute("q_seq",qVO.getQ_seq());
		model.addAttribute("a_seq",aVO.getA_seq());
		return "Admin_page/admin_list/updateQPopUpConfirm";
	}
	
	@RequestMapping(value="updateQPopUpConfirmed.mdo")
	public String updateQConfirmed(HashMap<String, Object> qnas, int q_seq, int a_seq, String question, String answer, Model model) {
		qnas.put("q_seq", q_seq);
		qnas.put("question", question);
		qnas.put("a_seq", a_seq);
		qnas.put("answer", answer);
		if(question.equals("")) {
			adminService.deleteQ(qnas);
			if(answer.equals("")) {
				adminService.deleteA(qnas);
			}
			return "Admin_page/admin_list/updateQPopUpConfirmed";
		}
		if(answer.equals("")) {
			adminService.deleteA(qnas);
			return "Admin_page/admin_list/updateQPopUpConfirmed";
		}
		int result1 = adminService.updateQofA(qnas);
		int result2 = adminService.updateA(qnas);
		int result3 = adminService.updateQ(qnas);
		if(result1 == 1 && result2 == 1 && result3 == 1) {
			System.out.println("SUCC");
		}
		return "Admin_page/admin_list/updateQPopUpConfirmed";
	}
	
	//pay
	@RequestMapping(value="pay.mdo")
	public String pay(Model model) {
		System.out.println("처리할 파프리카 페이목록");
		List<PayVO> vo = payService.payList();
		model.addAttribute("payList", vo);
		return "Admin_page/admin_list/pay";
	}
	
	//pay
	@RequestMapping(value="pay.mdo", method=RequestMethod.POST)
	public String payConfirm(Model model,HashMap<String, Object> vo, String[] process, String[] status, String[] pay_seq) {
		System.out.println("수정된 파프리카 페이목록");
		for(int i=0; i<pay_seq.length; i++) {
			System.out.println("cc");
			vo.put("process", process[i]);
			vo.put("status", status[i]);
			vo.put("pay_seq", pay_seq[i]);
			int result = adminService.updatePay(vo);
			if(result==1) {
				System.out.println("SUCC");
				vo.remove("process");
				vo.remove("status");
				vo.remove("pay_seq");
			}
		}
		
		List<PayVO> vo1 = payService.payList();
		model.addAttribute("payList", vo1);
		return "Admin_page/admin_list/pay";
	}
	
	@RequestMapping(value="payForm.mdo")
	public String payForm(Model model) {
		System.out.println("처리할 파프리카 페이목록");
		List<PayVO> vo = payService.payList();
		model.addAttribute("payList", vo);
		return "Admin_page/admin_list/payFormList";
	}
	
	//배너 관리
		@RequestMapping(value = "banner.mdo" )
		public String bannerList(Model model) {
			System.out.println("관리자 배너관리 접속");
			List<BannerVO> banner = adminService.bannerList();
			model.addAttribute("banner", banner);
			return "Admin_page/admin_banner/admin_banner";
		}
		
		@RequestMapping(value = "addbanner.mdo" )
		public String addbanner(Model model) {
			return "Admin_page/admin_banner/register_banner";
		}
		
		@RequestMapping(value = "addbannerProc.mdo" )
		public String addbannerProc(BannerVO vo, @RequestParam(value = "chooseFile") List<MultipartFile> img, @RequestParam(value = "title")String title, @RequestParam(value = "content")String content) {
			System.out.println("관리자 배너추가");
			

			Map<String, String> names = postService.uploadImg(img,"Banner/");
			// 저장이름, 랜덤이름 db에 저장
			Iterator<Entry<String, String>> entries = names.entrySet().iterator();
			while (entries.hasNext()) {
				Map.Entry<String, String> entry = entries.next();
				String origin_file_name = entry.getKey();
				String save_file_name = entry.getValue();
				
				vo.setTitle(title);
				vo.setContent(content);
				vo.setOrigin_file_name(origin_file_name);
				vo.setSaved_file_name("https://paprikamarket.s3.ap-northeast-2.amazonaws.com/Banner/" + save_file_name);

				adminService.addBanner(vo);
			}
		
			return "redirect:banner.mdo";
	
		}
		//배너 삭제
		@RequestMapping(value = "deletebanner.mdo" )
		public String bannerDelete(Model model, int banner_seq) {
			adminService.bannerDelete(banner_seq);
			
			return "redirect:banner.mdo";
		}
		
}