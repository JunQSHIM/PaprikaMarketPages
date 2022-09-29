package com.spring.myweb.User.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.myweb.Service.AdminService.AdminService;
import com.spring.myweb.Service.BoardService.UserBoardService;
import com.spring.myweb.Service.NoticeService.NoticeService;
import com.spring.myweb.Service.PostService.PostService;
import com.spring.myweb.Service.RegisterAgreementService.RegisterAgreementService;
import com.spring.myweb.Service.UserService.UserService;
import com.spring.myweb.VO.DealVO.DealVO;
import com.spring.myweb.VO.LikeVO.LikeVO;
import com.spring.myweb.VO.MyMannerVO.MyMannerVO;
import com.spring.myweb.VO.PageVO.PageVO;
import com.spring.myweb.VO.PhotoVO.PhotoVO;
import com.spring.myweb.VO.PostVO.PostVO;
import com.spring.myweb.VO.QnaVO.QnaAnswersVO;
import com.spring.myweb.VO.QnaVO.QnaQuestionsVO;
import com.spring.myweb.VO.QnaVO.QnaVO;
import com.spring.myweb.VO.RegisterAgreementVO.RegisterAgreementVO;
import com.spring.myweb.VO.UserVO.UserVO;
import com.spring.myweb.VO.WithdrawalVO.WithdrawalVO;
import com.spring.myweb.awss3.vo.PostPhotoVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@SessionAttributes("user")
@PropertySource(value = { "classpath:config/api.properties" })
public class UserController {

	@Value("${SMS_API_KEY}")
	private String api_key;

	@Value("${SMS_API_SECRET}")
	private String api_secret;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	UserService userService;

	@Autowired
	AdminService adminService;

	@Autowired
	PostService postService;

	@Autowired
	UserBoardService userBoardService;

	@Autowired
	RegisterAgreementService registerService;

	@Autowired
	NoticeService noticeService;

	@RequestMapping(value = "/")
	public String mainPage() {
		return "redirect:main.do";
	}

	@RequestMapping(value = "/insertProc.do")
	public String insertUser(HttpSession session, Model model, UserVO vo, HttpServletRequest request) throws Exception {
		System.out.println("암호화 전 : " + vo.getPassword());
		String securePwd = passwordEncoder.encode(vo.getPassword());
		vo.setPassword(securePwd);
		System.out.println("암호화 후 : " + vo.getPassword());
		int result = 0;
		result = userService.insertUser(vo);

		if (result == 1) {
			session.setAttribute("user", vo);
			model.addAttribute("user", vo);
			System.out.println("INSERT   " + vo.getMsg_agree());
			if (vo.getMsg_agree() == 1) {
				HashMap<String, String> params = new HashMap<String, String>();
				params.put("to", vo.getPhone()); // 수신전화번호
				params.put("from", "01041250363"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
				params.put("type", "SMS");
				String[] text = { "파프리카 마켓 회원가입을 축하합니다.", "이 아이디는 신고횟수가 5회가 넘어 이용정지 되었으니 고객센터번호로 문의 바랍니다.",
						"님에게 신고가 접수되었습니다. 현재 신고횟수=" };
				String msg = vo.getId() + "님!!";
				msg += text[0];
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
			}
		} else {
			System.out.println("FAIL");
		}
		return "login/login&register/emailVerify";

	}

	@GetMapping("/rEmail.do")
	public String emailConfirm(UserVO vo, Model model) throws Exception {
		userService.updateMailAuth(vo);
		System.out.println("이메일 인증 완료");

		return "login/login&register/emailAuthSuccess";
	}

	@RequestMapping(value = "/insert.do")
	public String insert(Model model) {
		int agreement_seq = 1;
		RegisterAgreementVO list = registerService.select(agreement_seq);
		model.addAttribute("newest", list);
		return "login/login&register/registerAgree";
	}

	@RequestMapping(value = "registerAgree.do")
	public String insert2() {
		return "login/login&register/register";
	}

	@RequestMapping(value = "/loginForm.do")
	public String loginForm() {
		return "login/login&register/login";
	}

	@RequestMapping(value = "/login.do")
	public String loginUser(HttpSession session, Model model, String id, String password, ServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("User login service");
		UserVO vo = userService.select(id);
		if (passwordEncoder.matches(password, vo.getPassword())) {
			session.setAttribute("user", vo);
			model.addAttribute("user", vo);
		} else {
			System.out.println("FAILS");
		}

		return "login/main/mother";
	}

	// 카카오 로그인창 호출
	@RequestMapping(value = "/kakaoLogin.do")
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpServletRequest req,
			Model model) throws Exception {
		String access_Token = userService.getAccessToken(code);
		UserVO userInfo = userService.getUserInfo(access_Token);
		HttpSession session = req.getSession();
		model.addAttribute("kakaoUser", userInfo);
		session.setAttribute("kakaoUser", userInfo);
		session.setAttribute("kakaoId", userInfo.getId());
		session.setAttribute("user", userInfo);
		model.addAttribute("user", userInfo);
		System.out.println(userInfo.getEmail());
		System.out.println(userInfo.getProfile_image());
		List<GrantedAuthority> roles = new ArrayList<>();
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		Authentication auth = new UsernamePasswordAuthenticationToken(userInfo, null, roles);
		SecurityContextHolder.getContext().setAuthentication(auth);
		return "redirect:main.do";
	}

	/////

	@RequestMapping(value = "/mypage.do")
	public String mypage(HashMap<String,Object> info, Model model, HttpSession session, UserVO uvo, PageVO page, LikeVO lvo) throws Exception {
		uvo = (UserVO) session.getAttribute("user");
		lvo.setUser_seq(uvo.getUser_seq());
		int jjimCart = postService.jjimCart(lvo);
		int reviewCnt = postService.reviewCount(uvo.getUser_seq());
		List<MyMannerVO> manner = postService.reviewList(uvo.getUser_seq());
		uvo = userService.select(uvo.getId());
		model.addAttribute("manner", manner);
		model.addAttribute("reviewCnt", reviewCnt);
		model.addAttribute("jjimCart", jjimCart);
		model.addAttribute("user", uvo);
		return "login/mypage/mypage";
	}

	@RequestMapping(value = "/mypageA.do", method = RequestMethod.POST)
	public String mypage(HttpSession session, Model model, String KID,
			@RequestParam(value = "pay", required = false) List<MultipartFile> img)
			throws Exception {
		System.out.println("파프리카 페이 사용하기");
		UserVO uvo = (UserVO) session.getAttribute("user");
		System.out.println(KID);
		uvo.setKID(KID);
		// 이미지등록
		Map<String, String> names1 = postService.uploadImg(img, "qr/");
		// 저장이름, 랜덤이름 db에 저장
		Iterator<Entry<String, String>> entries = names1.entrySet().iterator();
		while (entries.hasNext()) {
			Map.Entry<String, String> entry = entries.next();
			String save_file_name = entry.getValue();
			uvo.setPay("https://paprikamarket.s3.ap-northeast-2.amazonaws.com/qr/" + save_file_name);
			userService.updatePay(uvo);
		}
		
		return "redirect:main.do";
	}

	// 내가 받은 매너 평가 페이지 이동
	@RequestMapping(value = "mannerView.do")
	public String mannerView(HttpSession session, Model model, UserVO uvo, LikeVO lvo, MyMannerVO mm) throws Exception {
		uvo = (UserVO) session.getAttribute("user");
		lvo.setUser_seq(uvo.getUser_seq());
		int jjimCart = postService.jjimCart(lvo);
		int reviewCnt = postService.reviewCount(uvo.getUser_seq());
		List<MyMannerVO> manner = postService.reviewList(uvo.getUser_seq());
		System.out.println("왜 3번 나오는거야 스벌 : " + manner);
		mm.setSell_user_seq(uvo.getUser_seq());

		mm.setManner_compliment("상품 상태가 설명한 것과 같아요.");
		int cnt1 = userService.mannerCount(mm);

		mm.setManner_compliment("시간 약속을 잘 지켜요.");
		int cnt2 = userService.mannerCount(mm);

		mm.setManner_compliment("친절하고 매너가 좋아요.");
		int cnt3 = userService.mannerCount(mm);

		mm.setManner_compliment("좋은 상품을 저렴하게 판매해요.");
		int cnt4 = userService.mannerCount(mm);

		mm.setManner_compliment("응답이 빨라요.");
		int cnt5 = userService.mannerCount(mm);

		mm.setManner_compliment("상품설명이 자세해요.");
		int cnt6 = userService.mannerCount(mm);

		mm.setBad_manner("상품상태가 설명한 것과 달라요.");
		int cnt7 = userService.badCount(mm);

		mm.setBad_manner("불친절하고 매너가 안좋아요.");
		int cnt8 = userService.badCount(mm);

		mm.setBad_manner("시간 약속을 잘 어겨요.");
		int cnt9 = userService.badCount(mm);

		mm.setBad_manner("상품의 가격이 너무 비싸요.");
		int cnt10 = userService.badCount(mm);

		mm.setBad_manner("응답이 느려요.");
		int cnt11 = userService.badCount(mm);

		mm.setBad_manner("상품설명이 부족해요.");
		int cnt12 = userService.badCount(mm);

		mm.setBad_manner("없음.");
		int cnt13 = userService.badCount(mm);

		model.addAttribute("cnt13", cnt13);
		model.addAttribute("cnt12", cnt12);
		model.addAttribute("cnt11", cnt11);
		model.addAttribute("cnt10", cnt10);
		model.addAttribute("cnt9", cnt9);
		model.addAttribute("cnt8", cnt8);
		model.addAttribute("cnt7", cnt7);
		model.addAttribute("cnt6", cnt6);
		model.addAttribute("cnt5", cnt5);
		model.addAttribute("cnt4", cnt4);
		model.addAttribute("cnt3", cnt3);
		model.addAttribute("cnt2", cnt2);
		model.addAttribute("cnt1", cnt1);
		model.addAttribute("reviewCnt", reviewCnt);
		model.addAttribute("jjimCart", jjimCart);
		model.addAttribute("manner", manner);
		return "login/mypage/mannerEval";
	}

	// 구매 완료 후 매너평가 페이지
	@RequestMapping(value = "evaluationView.do")
	public String evaluationView(HttpSession session, Model model, UserVO uvo, LikeVO lvo) throws Exception {
		uvo = (UserVO) session.getAttribute("user");
		int jjimCart = postService.jjimCart(lvo);
		model.addAttribute("jjimCart", jjimCart);
		return "login/product&purchase/purchase";
	}
	
	

	@RequestMapping(value = "evaluation.do")
	public @ResponseBody int evaluation(DealVO dvo, HttpSession session,int bUser_seq, int sUser_seq, int post_seq, Model model, HashMap<String, Object> info, int manner_temp, String manner_compliment, String bad_manner, String manner_review) throws Exception {
		info.put("user_seq", bUser_seq);
		info.put("sell_user_seq", sUser_seq);
		info.put("post_seq", post_seq);
		info.put("manner_temp", manner_temp);
		info.put("manner_compliment", manner_compliment);
		info.put("bad_manner",bad_manner);
		info.put("manner_review", manner_review);
		int result = userService.evaluation(info);
		if(result==1) {
			System.out.println("매너평가 완료");
		}
		return result;
	}
	
	@RequestMapping(value="evaluationComp.do")
	public String evalComp(HttpSession session,int bUser_seq, int sUser_seq, int post_seq, Model model, HashMap<String, Object> info, int manner_temp, String manner_compliment, String bad_manner, String manner_review) throws Exception {
		info.put("user_seq", bUser_seq);
		info.put("sell_user_seq", sUser_seq);
		info.put("post_seq", post_seq);
		info.put("manner_temp", manner_temp);
		info.put("manner_compliment", manner_compliment);
		info.put("bad_manner",bad_manner);
		info.put("manner_review", manner_review);
		int result = userService.evaluation(info);
		if(result==1) {
			System.out.println("매너평가 완료");
		}
		UserVO vo = (UserVO)session.getAttribute("user");
		
		double mannerT = vo.getTemp();
		if(manner_temp==1) {
			mannerT -= 0.5;
		}else if(manner_temp==2) {
			mannerT -= 0.3;
		}else if(manner_temp==4) {
			mannerT += 0.3;
		}else if(manner_temp==5) {
			mannerT += 0.5;
		}
		vo.setTemp(mannerT);
		int result1 = userService.updateMannerTemp(vo);
		if(result1==1) {
			System.out.println("매너온도 수정 완료");
		}
		
		return "redirect:main.do";
	}

	// 회원탈퇴 페이지 이동
	@RequestMapping(value = "/withdrawalView.do")
	public String withdrawaView() throws Exception {
		return "login/quit";
	}

	// 탈퇴사유
	@RequestMapping(value = "/reason.do")
	public @ResponseBody int Reason(HttpSession session, WithdrawalVO vo) throws Exception {
		UserVO uvo = (UserVO) session.getAttribute("user");
		vo.setUser_seq(uvo.getUser_seq());
		return userService.WithdrawalReason(vo);
	}

	// 회원탈퇴
	@RequestMapping(value = "/withdrawal.do")
	public ModelAndView withdrawal(Model model, UserVO vo, RedirectAttributes rttr, HttpServletRequest req,
			HttpSession session, LikeVO lvo) throws Exception {
		vo = (UserVO) session.getAttribute("user");
		
		String password = vo.getPassword();
		if (!(password.equals(password))) {
			ModelAndView mv = new ModelAndView("login/mypage/withdrawal");
			return mv;
		}
		model.addAttribute("user", null);
		ModelAndView mv = new ModelAndView("login/login&register/login");

		//상품
		postService.postWithdrawal(vo.getUser_seq());
		//찜
		postService.likeWithdrawal(vo.getUser_seq());
		//게시판
		postService.boardWithdrawal(vo.getUser_seq());
		
		//알림
		noticeService.deleteUserNotice(vo.getNickname());
		//회원탈퇴
		userService.withdrawal(vo);
		session = req.getSession();
		session.invalidate();
		return mv;
	}

	@RequestMapping(value = "/main.do")
	public String main() {
		return "login/main/mother";
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session, Model model, HttpServletRequest req) throws Exception {
		model.addAttribute("user", null);
		ModelAndView mv = new ModelAndView("login/main/mother");
		session = req.getSession();
		session.invalidate();
		return mv;
	}

	@RequestMapping(value = "/kakaoLogout.do")
	public String logout(Model model, HttpSession session) {
		userService.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("kakaoUser");
		session.removeAttribute("user");
		model.addAttribute("user", null);
		return "redirect:main.do";
	}

	@RequestMapping(value = "/kakaounlink.do")
	public String unlink(HttpSession session) {
		userService.unlink((String) session.getAttribute("access_token"));
		session.invalidate();
		return "redirect:main.do";
	}

	@RequestMapping(value = "/location.do", method = RequestMethod.POST)
	public String loaction(Model model, String id, UserVO vo, String join_type) {
		id = vo.getId();
		int success = userService.locationInsert(vo);
		if (success == 1) {
			UserVO vo2 = userService.select(id);
			if (join_type.equals("0")) {
				model.addAttribute("user", vo2);
			} else {
				model.addAttribute("kakaoUser", vo2);
			}
		} else {
			System.out.println("fail");
		}
		return "login/mypage/mypage";
	}

	@RequestMapping(value = "/location.do", method = RequestMethod.GET)
	public String loactionForm(Model model, HttpSession session, UserVO vo) {
		if (session.getAttribute("user") != null) {
			vo = (UserVO) session.getAttribute("user");
			session.setAttribute("user", vo);
			model.addAttribute("user", vo);
		} else if (session.getAttribute("kakaoUser") != null) {
			vo = (UserVO) session.getAttribute("kakaoUser");
			session.setAttribute("kakaoUser", vo);
			model.addAttribute("kakaoUser", vo);
		}
		return "login/location/verify";
	}

	@RequestMapping(value = "/idEmailCheck.do")
	public @ResponseBody int idEmailCheck(@ModelAttribute("vo") UserVO vo, String id, Model model) throws Exception {
		int result = 0;
		System.out.println(id);
		UserVO vo2 = userService.select(id);
		System.out.println(vo2.getEmail());
		System.out.println(vo.getEmail());
		if (vo.getEmail().equals(vo2.getEmail())) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}

	@RequestMapping(value = "/idCheck.do")
	public @ResponseBody int idCheck(@ModelAttribute("vo") UserVO vo, Model model) throws Exception {
		int result = userService.idCheck(vo.getId());
		return result;
	}

	@RequestMapping(value = "/emailCheck.do", method = RequestMethod.POST)
	public @ResponseBody int emailCheck(@ModelAttribute("vo") UserVO vo, Model model) throws Exception {
		int result = userService.emailCheck(vo.getEmail());
		return result;
	}

	@RequestMapping(value = "/nicknameCheck.do", method = RequestMethod.POST)
	public @ResponseBody int nicknameCheck(@ModelAttribute("vo") UserVO vo, Model model) throws Exception {
		int result = userService.nicknameCheck(vo.getNickname());
		return result;
	}

	@RequestMapping(value = "/phoneCheck.do", method = RequestMethod.POST)
	public @ResponseBody int phoneCheck(@ModelAttribute("vo") UserVO vo, Model model) throws Exception {
		int result = userService.phoneCheck(vo.getPhone());
		return result;
	}

	@RequestMapping(value = "/userVerify.do")
	public String userVerify() {
		return "login/mypage/userVerify";
	}

	@RequestMapping(value = "/verify.do")
	public String verify(HttpServletRequest request, HttpSession session, Model model) {
		UserVO vo = (UserVO) session.getAttribute("kakaoUser");
		String strDate = request.getParameter("birth");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		try {
			date = sdf.parse(strDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		vo.setBirth(date);
		vo.setAvailable(1);
		int result = 0;
		result = userService.reloadUser(vo);
		if (result == 1) {
			session.setAttribute("kakaoUser", vo);
			model.addAttribute("kakaoUser", vo);
		} else {
			System.out.println("FAIL");
		}

		return "login/mypage/verify";
	}

	@RequestMapping(value = "/profileEdit.do")
	public String profileEdit() {
		return "login/mypage/profileEdit";
	}

	@RequestMapping(value = "/mypageProc.do")
	public String editProfile(UserVO vo, String id, Model model, HttpSession session, @RequestParam(value="file", required=false)List<MultipartFile> img, PhotoVO photo) {
		int success = 0;

		UserVO vo2 = (UserVO) model.getAttribute("user");
		id = vo2.getId();
		vo.setId(id);
		String securePwd = passwordEncoder.encode(vo.getPassword());
		System.out.println(vo.getPassword());
		vo.setPassword(securePwd);
		success = userService.updateProfile(vo);
		System.out.println(vo.toString());
		System.out.println(vo2.toString());
		if (success == 1) {
			vo = userService.select(vo.getId());
			System.out.println("success");
			model.addAttribute("user", vo);
			session.setAttribute("user", vo);
		} else {
			System.out.println("fail");
		}
		if(img != null) {
			Map<String, String> img_name = postService.uploadImg(img, "profile/");
			Iterator<Entry<String, String>> entries = img_name.entrySet().iterator();
			while (entries.hasNext()) {
				Map.Entry<String, String> entry = entries.next();
				String save_file_name = entry.getValue();
	
				photo.setPost_seq(vo2.getUser_seq());
				photo.setS_name("https://paprikamarket.s3.ap-northeast-2.amazonaws.com/profile/" + save_file_name);
	
				userService.insertPhoto(photo);
			}
		}
		
		return "redirect:mypage.do";
	}

	@RequestMapping(value = "/findPassword.do")
	public String findPasswordForm() {
		return "login/login&register/findPassword";
	}

	@RequestMapping(value = "/findPassword.do", method = RequestMethod.POST)
	public String findPassword(UserVO vo) throws Exception {
		System.out.println(vo.getId());
		System.out.println(vo.getEmail());
		int success = 0;
		success = userService.updatePw(vo);
		if (success == 1) {
			System.out.println("success");
		}
		return "login/login&register/findPasswordVerify";
	}

	@RequestMapping(value = "/qna.do")
	public String qna(Model model) {
		List<QnaVO> qnaList = adminService.selectQnaCate();
		List<QnaQuestionsVO> questionsList = adminService.selectQuestions();
		List<QnaAnswersVO> answersList = adminService.selectAnswers();

		model.addAttribute("qnaList", qnaList);
		model.addAttribute("qList", questionsList);
		model.addAttribute("aList", answersList);
		return "login/main/footer/qna";
	}

	@RequestMapping(value = "/pay.do")
	public String pay(Model model) {
		UserVO uvo = (UserVO) model.getAttribute("user");

		model.addAttribute("user", uvo);
		return "login/mypage/pay";
	}

	// 알림 읽음 처리
	@RequestMapping(value = "/readNotice.do")
	public @ResponseBody int readNotice(String notice_seq) {
		int result = 1;
		int seq = Integer.parseInt(notice_seq);
		result = noticeService.updateNotice(seq);
		if (result == 1) {
			System.out.println("알림 읽음");
			noticeService.deleteNotice();
		}
		return result;
	}
	
	//채팅창에서 거래확정했을 때 
	@RequestMapping("/compDeal.do")
    public String compDeal(PostVO pvo, DealVO dvo, int post_seq, String buyer, String seller, Model model) {
		System.out.println("후기작성하기");
		System.out.println(post_seq);
		System.out.println(buyer);
		System.out.println(seller);
		
		UserVO bUser = (UserVO)userService.selectByNickname(buyer);
		UserVO sUser = (UserVO)userService.selectByNickname(seller);
		model.addAttribute("bUser",bUser);
		model.addAttribute("sUser",sUser);
		model.addAttribute("post_seq",post_seq);
		
		dvo.setUser_seq(bUser.getUser_seq());
		dvo.setPost_seq(post_seq);
		dvo.setPrice(postService.postDetail(post_seq).getPrice());
		dvo.setPost_title(postService.postDetail(post_seq).getPost_title());
		int result2 = userService.doneDeal(dvo);
		
		int result3 = postService.updateSellProduct(post_seq);
		
		pvo.setPost_seq(post_seq);
		pvo.setPay_status(3);
		int result4 = postService.updatePayStatus(pvo);
		
		if(result2 == 1 && result3 == 1) {
			System.out.println("거래 완료");
		}
		
    	return "login/product&purchase/purchase";
    }
}
