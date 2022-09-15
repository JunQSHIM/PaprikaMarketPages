package com.spring.myweb.User.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.servlet.ModelAndView;

import com.spring.myweb.MailUtil.MailHandler;
import com.spring.myweb.MailUtil.TempKey;
import com.spring.myweb.Service.RegisterAgreementService.RegisterAgreementService;
import com.spring.myweb.Service.UserService.UserService;
import com.spring.myweb.VO.RegisterAgreementVO.RegisterAgreementVO;
import com.spring.myweb.VO.UserVO.UserVO;

@Controller
@SessionAttributes("user")
public class UserController {
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	UserService userService;

	@Autowired
	RegisterAgreementService registerService;
	
	@RequestMapping(value="/")
	public String mainPage(){
		return "redirect:main.do";
	}
	
	@RequestMapping(value = "/insertProc.do")
	public String insertUser(HttpSession session, Model model,UserVO vo,HttpServletRequest request) throws Exception{
		System.out.println("암호화 전 : " + vo.getPassword());
		String securePwd = passwordEncoder.encode(vo.getPassword());
		vo.setPassword(securePwd);
		System.out.println("암호화 후 : " + vo.getPassword());
		int result = 0;
		result = userService.insertUser(vo);
		
		if(result ==1 ) {
			session.setAttribute("user", vo);
			model.addAttribute("user",vo);
		}else {
			System.out.println("FAIL");
		}
		return "login/login&register/emailVerify";
		
	}
	
	@GetMapping("/registerEmail.do")
	public String emailConfirm(UserVO vo)throws Exception{
	    userService.updateMailAuth(vo);
	    return "login/login&register/emailAuthSuccess";
	}
	
	@RequestMapping(value="/insert.do")
	public String insert(Model model) {
		int agreement_seq = 1;
		RegisterAgreementVO list = registerService.select(agreement_seq);
		model.addAttribute("newest",list);
		return "login/login&register/registerAgree";
	}
	@RequestMapping(value="registerAgree.do")
	public String insert2() {
		return "login/login&register/register";
	}
	
	@RequestMapping(value = "/loginForm.do")
	public String loginForm() {
		return "login/login&register/login";
	}
	private boolean rememberId(boolean rememberId) {
		return rememberId;
	}
	@RequestMapping(value="/login.do")
	public String loginUser(HttpSession session, Model model,String id, String password, ServletRequest request, HttpServletResponse response, boolean rememberId) throws Exception {
		System.out.println("User login service");
		UserVO vo = userService.select(id);
		if(passwordEncoder.matches(password,vo.getPassword())){
			session.setAttribute("user", vo);
			model.addAttribute("user",vo);
		}else {
			System.out.println("FAILS");
		}
		if(rememberId(rememberId)) {
			Cookie cookie = new Cookie("id", id);
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		return "login/main/mother";
	}
	// 카카오 로그인창 호출
	@RequestMapping(value="/kakaoLogin.do", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpServletRequest req,  Model model) throws Exception {
		String access_Token = userService.getAccessToken(code);
		UserVO userInfo = userService.getUserInfo(access_Token);
        HttpSession session = req.getSession();
        model.addAttribute("kakaoUser",userInfo);
		session.setAttribute("kakaoUser",userInfo);
		session.setAttribute("kakaoId",userInfo.getId());
		System.out.println(userInfo.getEmail());
		System.out.println(userInfo.getProfile_image());
		return "login/main/mother";
    }
	
	@RequestMapping(value="/mypage.do")
	public String mypage(Model model, HttpSession session) {
		model.addAttribute("user",userService.select((String)session.getAttribute("id")));
		return "login/mypage/mypage";
	}
	@RequestMapping(value="/main.do")
	public String main() {
		return "login/main/mother";
	}
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(Model model, HttpServletRequest req) throws Exception{
		model.addAttribute("user",null);
		ModelAndView mv = new ModelAndView("login/main/mother");
        HttpSession session = req.getSession();
        session.invalidate();
        return mv;
	}
	@RequestMapping(value = "/kakaoLogout.do")
	public String logout(HttpSession session) {
	    userService.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    session.removeAttribute("kakaoUser");
	    return "login/main/mother";
	}
	@RequestMapping(value="/kakaounlink.do")
	public String unlink(HttpSession session) {
		userService.unlink((String)session.getAttribute("access_token"));
		session.invalidate();
		return "redirect:main.do";
	}
	@RequestMapping(value="/location.do", method=RequestMethod.POST)
	public String loaction(Model model, String id, UserVO vo, String join_type) {
		id = vo.getId();
		int success = userService.locationInsert(vo);
		if(success == 1) {
			UserVO vo2 = userService.select(id);
			if(join_type.equals("0")) {
				model.addAttribute("user",vo2);
			}else {
				model.addAttribute("kakaoUser",vo2);
			}
		}else {
			System.out.println("fail");
		}
		return "login/mypage/mypage";
	}
	@RequestMapping(value="/location.do", method=RequestMethod.GET)
	public String loactionForm(Model model, HttpSession session, UserVO vo) {
		if(session.getAttribute("user")!=null) {
			vo = (UserVO)session.getAttribute("user");
			session.setAttribute("user",vo);
			model.addAttribute("user",vo);
		}else if(session.getAttribute("kakaoUser")!=null) {
			vo = (UserVO)session.getAttribute("kakaoUser");
			session.setAttribute("kakaoUser",vo);
			model.addAttribute("kakaoUser",vo);
		}
		return "login/location/verify";
	}
	@RequestMapping(value="/idEmailCheck.do")
	public @ResponseBody int idEmailCheck(@ModelAttribute("vo") UserVO vo ,String id, Model model) throws Exception{
		int result = 0;
		System.out.println(id);
		UserVO vo2 = userService.select(id);
		System.out.println(vo2.getEmail());
		System.out.println(vo.getEmail());
		if(vo.getEmail().equals(vo2.getEmail())) {
			result = 1;
		}else {
			result = 0;
		}
		return result;
	}
	@RequestMapping(value = "/idCheck.do")
	public @ResponseBody int idCheck(@ModelAttribute("vo") UserVO vo , Model model) throws Exception{
	    int result = userService.idCheck(vo.getId());
	    return result;
	}
	
	@RequestMapping(value = "/emailCheck.do" , method = RequestMethod.POST)
	public @ResponseBody int emailCheck(@ModelAttribute("vo") UserVO vo , Model model) throws Exception{
	    int result = userService.emailCheck(vo.getEmail());
	    return result;
	}
	
	@RequestMapping(value = "/nicknameCheck.do" , method = RequestMethod.POST)
	public @ResponseBody int nicknameCheck(@ModelAttribute("vo") UserVO vo , Model model) throws Exception{
	    int result = userService.nicknameCheck(vo.getNickname());
	    return result;
	}
	
	@RequestMapping(value = "/phoneCheck.do" , method = RequestMethod.POST)
	public @ResponseBody int phoneCheck(@ModelAttribute("vo") UserVO vo , Model model) throws Exception{
	    int result = userService.phoneCheck(vo.getPhone());
	    return result;
	}
	@RequestMapping(value="/userVerify.do")
	public String userVerify() {
		return "login/mypage/userVerify";
	}
	
	@RequestMapping(value="/verify.do")
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
		if(result ==1 ) {
			session.setAttribute("kakaoUser", vo);
			model.addAttribute("kakaoUser",vo);
		}else {
			System.out.println("FAIL");
		}
		
		return "login/mypage/verify";
	}
	
	@RequestMapping(value="/profileEdit.do")
	public String profileEdit() {
		return "login/mypage/profileEdit";
	}
	
	@RequestMapping(value="/mypageProc.do")
	public String editProfile(UserVO vo, String id, Model model, HttpSession session) {
		int success = 0;
		
		UserVO vo2 = (UserVO)model.getAttribute("user");
		id = vo2.getId();
		vo.setId(id);
		String securePwd = passwordEncoder.encode(vo.getPassword());
		System.out.println(vo.getPassword());
		vo.setPassword(securePwd);
		success = userService.updateProfile(vo);
		System.out.println(vo.toString());
		System.out.println(vo2.toString());
		if(success == 1) {
			vo = userService.select(vo.getId());
			System.out.println("success");
			model.addAttribute("user", vo);
			session.setAttribute("user", vo);
		}else {
			System.out.println("fail");
		}
		return "redirect:mypage.do";
	}
	
	@RequestMapping(value="/findPassword.do")
	public String findPasswordForm() {
		return "login/login&register/findPassword";
	}
	
	@RequestMapping(value="/findPassword.do", method = RequestMethod.POST)
	public String findPassword(UserVO vo) throws Exception {
		System.out.println(vo.getId());
		System.out.println(vo.getEmail());
		int success = 0;
		success = userService.updatePw(vo);
		if(success == 1) {
			System.out.println("success");
		}
		return "login/login&register/findPasswordVerify";
	}
	
	
}
