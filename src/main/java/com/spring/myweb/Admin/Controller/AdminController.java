package com.spring.myweb.Admin.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.myweb.MailUtil.MailHandler;
import com.spring.myweb.Service.AdminService.AdminService;
import com.spring.myweb.Service.AdminService.PayService.PayService;
import com.spring.myweb.Service.ChartService.ChartService;
import com.spring.myweb.Service.PostService.PostService;
import com.spring.myweb.Service.RegisterAgreementService.RegisterAgreementService;
import com.spring.myweb.Service.UserService.UserService;
import com.spring.myweb.VO.AdminVO.BannerVO;
import com.spring.myweb.VO.AdminVO.BoardVO;
import com.spring.myweb.VO.AdminVO.PostSingoVO;
import com.spring.myweb.VO.AdminVO.UserSmsVO;
import com.spring.myweb.VO.AdminVO.PayVO.PayVO;
import com.spring.myweb.VO.LikeVO.LikeVO;
import com.spring.myweb.VO.MyMannerVO.MyMannerVO;
import com.spring.myweb.VO.OneOnOneVO.OneOnOneVO;
import com.spring.myweb.VO.PostVO.PostVO;
import com.spring.myweb.VO.QnaVO.QnaAnswersVO;
import com.spring.myweb.VO.QnaVO.QnaQuestionsVO;
import com.spring.myweb.VO.QnaVO.QnaVO;
import com.spring.myweb.VO.RegisterAgreementVO.RegisterAgreementVO;
import com.spring.myweb.VO.UserVO.UserVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@SessionAttributes("admin")
@PropertySource(value = { "classpath:config/api.properties" })
public class AdminController {

	@Autowired
	AdminService adminService;

	@Autowired
	UserService userService;

	@Autowired
	PayService payService;

	@Autowired
	PostService postService;

	@Value("${SMS_API_KEY}")
	private String api_key;

	@Value("${SMS_API_SECRET}")
	private String api_secret;

	@Autowired
	JavaMailSender mailSender;

	@Autowired
	ChartService chartService;

	@Autowired
	RegisterAgreementService agreementService;

	@GetMapping("/error.mdo")
	public String error() {
		return "redirect:main.do";
	}

	// ????????????
	@RequestMapping(value = "/main.mdo", method = RequestMethod.GET)
	public String mainAdmin(Model model) {
		int newPost = chartService.getTodayPost();
		int newBoard = chartService.getTodayBoard();
		int newLogin = chartService.getTodayLogin();
		int newSingo = chartService.getTodaySingo();

		model.addAttribute("p", newPost);
		model.addAttribute("b", newBoard);
		model.addAttribute("l", newLogin);
		model.addAttribute("s", newSingo);

		return "Admin_page/layout/ad_main";
	}

	// ?????? ?????? ??????
	@RequestMapping(value = "/user.mdo", method = RequestMethod.GET)
	public String userAdmin(Model model) {
		System.out.println("????????? ????????? ????????????");
		List<UserVO> vo = adminService.selectAll();
		model.addAttribute("list", vo);
		return "Admin_page/member/ad_memlist";
	}

	// ?????? ?????? sms
	@RequestMapping(value = "/sms.mdo", method = RequestMethod.GET)
	public String userSmsAdmin(Model model) {
		System.out.println("????????? ????????? sms ????????????");
		List<UserSmsVO> sms = adminService.selectSmsAll();
		model.addAttribute("sms", sms);
		return "Admin_page/admin_board/ad_board";
	}

	// ????????? ?????? ?????????
	@RequestMapping(value = "adminEmail.mdo")
	public String adminEmail(Model model) {
		List<UserVO> list = adminService.selectAll();
		model.addAttribute("list", list);
		return "Admin_page/admin_board/ad_email";
	}

	@RequestMapping(value = "sendEmail.mdo")
	@ResponseBody
	public int sendEmail(@RequestParam(value = "jarr[]") List<String> jStr, String msgText)
			throws AddressException, MessagingException, Exception {

		System.out.println(jStr.toString());
		for (int i = 0; i < jStr.size(); i++) {
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[????????????][PaprikaMarket ?????????.]"); // ????????????
			sendMail.setText(msgText);
			sendMail.setFrom("junkyu970307@gmail.com", "??????????????????");
			sendMail.setTo(jStr.get(i));
			sendMail.send();
		}
		return 1;
	}

	// ?????? ????????????
	@RequestMapping(value = "/admin_list.mdo")
	public String adminList(Model model, int agreement_seq) {
		RegisterAgreementVO agreementList = agreementService.select(agreement_seq);
		model.addAttribute("newest", agreementList);
		return "Admin_page/admin_list/agreement";
	}

	// ?????? ??????
	@RequestMapping(value = "/edit_agreement.mdo")
	public String editagreement(Model model, RegisterAgreementVO vo) {
		System.out.println("??????...");
		agreementService.update(vo);
		return "redirect:admin_list.mdo?agreement_seq=1";
	}

	// ?????? ??????
	@RequestMapping(value = "/singo.mdo", method = RequestMethod.GET)
	public String singoAdmin(Model model) {
		System.out.println("????????? ????????? singo??????");

		List<PostSingoVO> postsingo = adminService.selectPostSingo();

		model.addAttribute("post", postsingo);
		return "Admin_page/singo/ad_singo_list";
	}

	// ????????? ????????? ??????
	@RequestMapping(value = "/deleteSingoPage.mdo", method = RequestMethod.GET)
	public String singoDeleteAdmin(int singo_page) throws Exception {
		System.out.println("????????? ????????? ??????");
		adminService.deleteSingoPage(singo_page);
		return "redirect:singo.mdo";
	}

	// ????????? ??????
	@RequestMapping(value = "/board.mdo", method = RequestMethod.GET)
	public String boardAdmin(Model model) {
		System.out.println("????????? ????????? ???????????????");
		List<BoardVO> board = adminService.selectBoardAll();
		model.addAttribute("board", board);
		return "Admin_page/admin_page_board/article_manage";
	}

	// ????????? ????????????
	@RequestMapping(value = "/boardde.mdo", method = RequestMethod.GET)
	public String boardde(Model model, int board_seq) {
		System.out.println("???????????? ??????????????? ????????? ??????");
		BoardVO bde = adminService.boardDetail(board_seq);
		model.addAttribute("board", bde);
		return "Admin_page/admin_page_board/adminBoardContent";
	}

	// ????????? ??????
	@RequestMapping(value = "boarddel.mdo", method = RequestMethod.GET)
	public String boarddel(int board_seq) throws Exception {
		System.out.println("???????????? ???????????? ??????????????????.");
		adminService.boardDelete(board_seq);
		return "redirect:/board.mdo";
	}

	// ????????? ????????????
	@RequestMapping(value = "adminList.mdo")
	public String adminList(Model model) {
		List<UserVO> list = adminService.adminList();
		model.addAttribute("adminList", list);
		return "Admin_page/admin_list/admin_list";
	}

	// ????????? ?????? ????????????
	@RequestMapping(value = "adminAuthority.mdo")
	public String adminAuthority(Model model) {
		List<UserVO> list = adminService.adminList();
		model.addAttribute("adminList", list);
		return "Admin_page/admin_list/admin_authority";
	}

	// ????????? ?????? ??????????????? ????????????
	@RequestMapping(value = "giveAdmin.mdo")
	public String giveAdmin() {
		return "Admin_page/admin_list/add";
	}

	// ????????? ?????? ??????????????? ???????????? ?????? ??????
	@RequestMapping(value = "checkId.mdo")
	public @ResponseBody UserVO checkId(@ModelAttribute("vo") UserVO vo, String id) throws Exception {
		vo = userService.select(id);
		return vo;
	}

	@RequestMapping(value = "giveAdmin.mdo", method = RequestMethod.POST)
	public String giveAdminAuthority(String id, UserVO vo) {
		System.out.println(id);
		int result = adminService.giveAdmin(id);
		if (result == 1) {
			vo = userService.select(id);
			System.out.println(vo.toString());
		}
		return "Admin_page/admin_list/add";
	}

	// ????????? ?????? ?????? ??? ??????
	@RequestMapping(value = "editAdmin.mdo")
	public String updateAdmin(Model model) {
		List<UserVO> list = adminService.adminList();
		model.addAttribute("adminList", list);
		return "Admin_page/admin_list/edit";
	}

	// ????????? ?????? ?????? ??? ??????
	@RequestMapping(value = "editAdmin.mdo", method = RequestMethod.POST)
	public String editAdmin(UserVO vo, String id, String stat, Model model) {
		int idx = 0;
		String[] ids = id.split(",");
		String[] stats = stat.split(",");
		for (int i = 0; i < stats.length; i++) {
			if (stats[i].equals("delete")) {
				idx = i;
			}
		}
		id = ids[idx];
		System.out.println(id);
		int result = adminService.deleteAdmin(id);
		if (result == 1) {
			vo = userService.select(id);
			System.out.println(vo.toString());
		}
		return "redirect:adminList.mdo";
	}

	// qna
	@RequestMapping(value = "qna.mdo")
	public String qna(Model model) {
		List<QnaVO> qnaList = adminService.selectQnaCate();
		List<QnaQuestionsVO> questionsList = adminService.selectQuestions();
		List<QnaAnswersVO> answersList = adminService.selectAnswers();

		model.addAttribute("qnaList", qnaList);
		model.addAttribute("qList", questionsList);
		model.addAttribute("aList", answersList);

		return "Admin_page/admin_list/qna";
	}

	// qna ??????
	@RequestMapping(value = "addQna.mdo")
	public String addQna(Model model) {
		List<QnaVO> qnaList = adminService.selectQnaCate();
		List<QnaQuestionsVO> questionsList = adminService.selectQuestions();
		List<QnaAnswersVO> answersList = adminService.selectAnswers();

		model.addAttribute("qnaList", qnaList);
		model.addAttribute("qList", questionsList);
		model.addAttribute("aList", answersList);
		return "Admin_page/admin_list/addQna";
	}

	@RequestMapping(value = "catePopUp.mdo")
	public String catePopUp() {
		return "Admin_page/admin_list/catePopUp";
	}

	@RequestMapping(value = "catePopUp.mdo", method = RequestMethod.POST)
	public String addCate(String qna_title) {
		System.out.println(qna_title);
		int result = adminService.insertQnaCate(qna_title);
		if (result == 1) {
			System.out.println("Succ");
		}
		return "Admin_page/admin_list/catePopUpConfirm";
	}

	@RequestMapping(value = "qPopUp.mdo")
	public String qPopUp(Model model) {
		List<QnaVO> qnaList = adminService.selectQnaCate();
		model.addAttribute("qnaList", qnaList);
		return "Admin_page/admin_list/qPopUp";
	}

	@RequestMapping(value = "qPopUp.mdo", method = RequestMethod.POST)
	public String qPopUpConfirm(String qna_title, String question, String[] answer, HashMap<String, String> qnas) {
		System.out.println(qna_title);
		System.out.println(question);
		qnas.put("qna_title", qna_title);
		qnas.put("question", question);
		int result1 = 0;
		if (adminService.checkQ(question) < 1) {
			result1 = adminService.insertQ(qnas);
			if (result1 == 1) {
				System.out.println("Succ");
			}
		}
		for (int i = 0; i < answer.length; i++) {
			qnas.put("answer", answer[i]);
			int result2 = 0;
			result2 = adminService.insertA(qnas);
			if (result2 == 1) {
				System.out.println("Succ");
			}
			qnas.remove("answer", answer[i]);
		}
		return "Admin_page/admin_list/qPopUpConfirm";
	}

	// Qna ?????? ??? ??????
	@RequestMapping(value = "updateQna.mdo")
	public String updateQna(Model model) {
		List<QnaVO> qnaList = adminService.selectQnaCate();
		List<QnaQuestionsVO> questionsList = adminService.selectQuestions();
		List<QnaAnswersVO> answersList = adminService.selectAnswers();

		model.addAttribute("qnaList", qnaList);
		model.addAttribute("qList", questionsList);
		model.addAttribute("aList", answersList);
		return "Admin_page/admin_list/editQna";
	}

	@RequestMapping(value = "updateCatePopUp.mdo")
	public String catePopUp(Model model) {
		List<QnaVO> qnaList = adminService.selectQnaCate();
		model.addAttribute("qnaList", qnaList);
		return "Admin_page/admin_list/updateCatePopUp";
	}

	@RequestMapping(value = "updateCatePopUp.mdo", method = RequestMethod.POST)
	public String updateCatePopUp(Model model, QnaVO vo, String qna_title) {
		System.out.println(qna_title);
		vo = adminService.selectCateStr(qna_title);
		model.addAttribute("qnaCate", vo);
		return "Admin_page/admin_list/updateCatePopUp";
	}

	@RequestMapping(value = "updateCatePopUpConfirm.mdo")
	public String updateCatePopUpConfirm(Model model, int qna_seq, QnaVO vo, String qna_title,
			HashMap<String, Object> qnas) {
		qnas.put("qna_seq", vo.getQna_seq());
		qnas.put("qna_title", qna_title);
		if (qna_title.equals("")) {
			adminService.deleteQna(qnas);
			return "Admin_page/admin_list/updateCatePopUpConfirm";
		}
		vo = adminService.selectCate(qna_seq);
		System.out.println(vo.toString());
		int result1 = adminService.updateQnaCateofQ(qnas);
		int result2 = adminService.updateQnaCate(qnas);
		if (result1 == 1 && result2 == 1) {
			System.out.println("Succ");
		} else {
			System.out.println("Fail");
		}
		return "Admin_page/admin_list/updateCatePopUpConfirm";
	}

	// QnA ??????
	@RequestMapping(value = "updateQPopUp.mdo")
	public String updateQPopUp(Model model) {
		List<QnaVO> qnaList = adminService.selectQnaCate();
		List<QnaQuestionsVO> questionsList = adminService.selectQuestions();
		List<QnaAnswersVO> answersList = adminService.selectAnswers();

		model.addAttribute("qnaList", qnaList);
		model.addAttribute("qList", questionsList);
		model.addAttribute("aList", answersList);
		return "Admin_page/admin_list/updateQPopUp";
	}

	@RequestMapping(value = "qList.mdo")
	public @ResponseBody List<QnaQuestionsVO> qList(String qna_title) throws Exception {
		List<QnaQuestionsVO> qList = adminService.bringQ(qna_title);
		return qList;
	}

	@RequestMapping(value = "aList.mdo")
	public @ResponseBody List<QnaAnswersVO> aList(String question) throws Exception {
		System.out.println(question);
		List<QnaAnswersVO> aList = adminService.bringA(question);
		return aList;
	}

	@RequestMapping(value = "updateQPopUpConfirm.mdo")
	public String updateQConfirm(String qna_title, String question, String answer, Model model) {
		System.out.println(question);
		System.out.println(answer);
		model.addAttribute("question", question);
		model.addAttribute("answer", answer);
		QnaQuestionsVO qVO = adminService.selectQStr(question);
		QnaAnswersVO aVO = adminService.selectAStr(answer);
		model.addAttribute("q_seq", qVO.getQ_seq());
		model.addAttribute("a_seq", aVO.getA_seq());
		return "Admin_page/admin_list/updateQPopUpConfirm";
	}

	@RequestMapping(value = "updateQPopUpConfirmed.mdo")
	public String updateQConfirmed(HashMap<String, Object> qnas, int q_seq, int a_seq, String question, String answer,
			Model model) {
		qnas.put("q_seq", q_seq);
		qnas.put("question", question);
		qnas.put("a_seq", a_seq);
		qnas.put("answer", answer);
		if (question.equals("")) {
			adminService.deleteQ(qnas);
			if (answer.equals("")) {
				adminService.deleteA(qnas);
			}
			return "Admin_page/admin_list/updateQPopUpConfirmed";
		}
		if (answer.equals("")) {
			adminService.deleteA(qnas);
			return "Admin_page/admin_list/updateQPopUpConfirmed";
		}
		int result1 = adminService.updateQofA(qnas);
		int result2 = adminService.updateA(qnas);
		int result3 = adminService.updateQ(qnas);
		if (result1 == 1 && result2 == 1 && result3 == 1) {
			System.out.println("SUCC");
		}
		return "Admin_page/admin_list/updateQPopUpConfirmed";
	}

	// pay
	@RequestMapping(value = "pay.mdo")
	public String pay(Model model) {
		System.out.println("????????? ???????????? ????????????");
		List<PayVO> vo = payService.payList();
		model.addAttribute("payList", vo);
		return "Admin_page/admin_list/pay";
	}

	// pay
	@RequestMapping(value = "pay.mdo", method = RequestMethod.POST)
	public String payConfirm(PostVO pvo, Model model, HashMap<String, Object> vo, String[] post_seq, String[] process,
			String[] status, String[] pay_seq) {
		System.out.println(post_seq[0]);
		System.out.println("pay"+pay_seq.length);
		System.out.println(post_seq.length);
		System.out.println("????????? ???????????? ????????????");
		for (int i = 0; i < pay_seq.length; i++) {
			System.out.println("cc"); 
			
			pvo = (PostVO)postService.postDetail(Integer.parseInt(post_seq[i]));
			if (Integer.parseInt(process[i]) == 4) {
				vo.put("process", process[i]);
			} else {
				vo.put("process", pvo.getPay_status());
			}
			vo.put("status", status[i]);
			vo.put("pay_seq", pay_seq[i]);
			int result = adminService.updatePay(vo);
			if (result == 1) {
				System.out.println("SUCC");
				vo.remove("process");
				vo.remove("status");
				vo.remove("pay_seq");
			}
		}

		List<PayVO> vo1 = payService.payList();
		model.addAttribute("payList", vo1);
		for (int i = 0; i < vo1.size(); i++) {
			adminService.deletePay();
		}
		return "redirect:pay.mdo";
	}

	@RequestMapping(value = "payForm.mdo")
	public String payForm(Model model) {
		System.out.println("????????? ???????????? ????????????");
		List<PayVO> vo = payService.payList();
		model.addAttribute("payList", vo);
		return "Admin_page/admin_list/payFormList";
	}

	// ?????? ??????
	@RequestMapping(value = "banner.mdo")
	public String bannerList(Model model) {
		System.out.println("????????? ???????????? ??????");
		List<BannerVO> banner = adminService.bannerList();
		model.addAttribute("banner", banner);
		return "Admin_page/admin_banner/admin_banner";
	}

	@RequestMapping(value = "addbanner.mdo")
	public String addbanner(Model model) {
		return "Admin_page/admin_banner/register_banner";
	}

	@RequestMapping(value = "addbannerProc.mdo")
	public String addbannerProc(BannerVO vo, @RequestParam(value = "chooseFile") List<MultipartFile> img,
			@RequestParam(value = "title") String title, @RequestParam(value = "content") String content) {
		System.out.println("????????? ????????????");

		Map<String, String> names = postService.uploadImg(img, "Banner/");
		// ????????????, ???????????? db??? ??????
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

	// ?????? ??????
	@RequestMapping(value = "deletebanner.mdo")
	public String bannerDelete(Model model, int banner_seq) {
		adminService.bannerDelete(banner_seq);

		return "redirect:banner.mdo";
	}

	// ????????? ??????

	@RequestMapping(value = "/sendMsg.mdo")
	public @ResponseBody int sms(@RequestParam(value = "info[]") List<String> info) throws Exception {
		System.out.println(info);
		System.out.println(info.get(4));
		System.out.println(info.get(0));
		int cycle = info.size() / 8;
		int index = 0;
		HashMap<String, String> params = new HashMap<String, String>();
		for (int i = 0; i < cycle; i++) {
			params.put("to", info.get(4 + 8 * i)); // ??????????????????
			params.put("from", "01041250363"); // ??????????????????. ?????????????????? ??????,?????? ?????? ?????? ????????? ?????? ???
			params.put("type", "SMS");
			String[] text = { "???????????? ?????? ??????????????? ???????????????.", "??? ???????????? ??????????????? 5?????? ?????? ???????????? ???????????? ????????????????????? ?????? ????????????.",
					"????????? ????????? ?????????????????????. ?????? ????????????=" };
			String msg = info.get(2) + "???!!";
			System.out.println(info.get(7 + 8 * i));
			if (info.get(7 + 8 * i).equals("1")) {
				msg += text[0];
				System.out.println(text.toString());
				System.out.println(msg);
			} else if (info.get(7 + 8 * i).equals("2")) {
				msg += text[1];
				System.out.println(text.toString());
				System.out.println(msg);
			} else {
				msg += text[2];
				int repNo = userService.select(info.get(2 + 8 * i)).getRep_no();
				msg += String.valueOf(repNo);
				System.out.println(text.toString());
				System.out.println(msg);
			}
			params.put("text", msg);
			params.put("app_version", "test app 1.2"); // application name and version

			Message coolsms = new Message(api_key, api_secret);

			try {
				JSONObject obj = (JSONObject) coolsms.send(params);
				System.out.println(obj.toString());
			} catch (CoolsmsException e) {
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
			}
			msg = "";
		}
		return 1;
	}

	@RequestMapping(value = "oneOnAdminView.mdo")
	public String oneOnAdminView(Model model) {
		List<OneOnOneVO> one = adminService.oneOnList();

		for (OneOnOneVO vo : one) {
			if (adminService.findUser(vo.getUser_seq()) == null) {
				vo.setNickname("????????? ??????");
				vo.setId("????????? ??????");
				vo.setEmail("????????? ??????");
			} else {
				vo.setNickname(adminService.findUser(vo.getUser_seq()).getNickname());
				vo.setId(adminService.findUser(vo.getUser_seq()).getId());
				vo.setEmail(adminService.findUser(vo.getUser_seq()).getEmail());
			}
		}

		model.addAttribute("one", one);
		return "Admin_page/admin_list/oneOnForm";
	}

	@RequestMapping(value = "/adminPostView.mdo")
	public String adminPostView(Model model, PostVO post) throws Exception {

		List<PostVO> postList = adminService.adminPost();
		List<Integer> post_seq = new ArrayList<Integer>();
		for (PostVO pvo : postList) {
			post_seq.add(pvo.getPost_seq());
		}

		List<String> photoNames = new ArrayList<String>();
		for (int post_num : post_seq) {
			photoNames.add(postService.photoOne(post_num));
		}
		model.addAttribute("postList", postList);
		model.addAttribute("photo", photoNames);
		return "Admin_page/admin_board/ad_post";
	}

	@RequestMapping(value = "/adminPostDetail.mdo")
	public String adminPostDetail(Model model, int post_seq) throws Exception {
		LikeVO lvo = new LikeVO();
		List<String> photoName = postService.photoDetail(post_seq);
		int allLike = postService.allLike(lvo);
		PostVO post = adminService.adminPostDetail(post_seq);

		model.addAttribute("allLike", allLike);
		model.addAttribute("post", post);

		model.addAttribute("name", photoName);
		return "Admin_page/admin_board/ad_post_detail";
	}

	@RequestMapping(value = "/adminPostDelete.mdo")
	public String adminPostDelete(int post_seq) {
		postService.postDelete(post_seq);
		postService.deleteImage(post_seq);
		return "redirect:adminPostView.mdo";
	}

	@RequestMapping(value = "/adminReview.mdo")
	public String adminReview(Model model) throws Exception {
		List<MyMannerVO> review = adminService.adminReview();
		List<PostVO> post = adminService.adminPost();

		for (MyMannerVO manner : review) {
			manner.setPost_title(postService.findReviewer(manner.getPost_seq()));
			manner.setNickname(postService.Reviewer(manner.getUser_seq()));
		}
		model.addAttribute("post", post);
		model.addAttribute("review", review);
		return "Admin_page/admin_board/ad_review";
	}

	@RequestMapping(value = "/block.mdo")
	public @ResponseBody int blockUser(String user_seq, String email, String id) throws Exception {
		UserVO vo = userService.select(id);
		int result = adminService.blockUser(vo.getUser_seq());
		if (result == 1) {
			System.out.println("????????????");
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[PaprikaMarket ?????????.]"); // ????????????
			sendMail.setText(id + "?????? ?????? 5????????? ???????????? ?????? ?????????????????? ??????????????????. ????????? ????????? ????????? ???????????? ??????????????? ????????????.");
			sendMail.setFrom("junkyu970307@gmail.com", "??????????????????");
			sendMail.setTo(email);
			sendMail.send();
		}
		return result;
	}
	

	@RequestMapping(value = "/unblock.mdo")
	public @ResponseBody int unblockUser(String user_seq, String email, String id) throws Exception {
		UserVO vo = userService.select(id);
		int result = adminService.unblockUser(vo.getUser_seq());
		if (result == 1) {
			System.out.println("????????????");
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[PaprikaMarket ?????????.]"); // ????????????
			sendMail.setText(id + "?????? ????????? ?????????????????????. ????????? ??? ??????????????? ?????????????????? ???????????? ???????????? ??? ????????????.");
			sendMail.setFrom("junkyu970307@gmail.com", "??????????????????");
			sendMail.setTo(email);
			sendMail.send();
		}
		return result;
	}

	@RequestMapping(value = "/oneDelete.mdo")
	@ResponseBody
	public void oneDelete(int one_seq) {
		adminService.oneDelete(one_seq);
	}
}