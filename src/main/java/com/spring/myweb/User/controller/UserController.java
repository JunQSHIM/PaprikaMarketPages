package com.spring.myweb.User.controller;

import java.util.HashMap;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.myweb.Service.UserService.UserService;
import com.spring.myweb.VO.UserVO.UserVO;

@Controller
@SessionAttributes("user")
public class UserController {
	
	@Autowired
	UserService userService;

	@RequestMapping(value = "/insertProc.do", method=RequestMethod.GET)
	public String insertUser(Model model,UserVO vo) {
		int success = userService.insertUser(vo);
		if(success==1) {
			model.addAttribute("user",vo);
		}
		return "login/main/mother";
	}
	@RequestMapping(value="/insert.do")
	public String insert() {
		return "login/login&register/registerAgree";
	}
	@RequestMapping(value="registerAgree.do")
	public String insert2() {
		return "login/login&register/register";
	}
	@RequestMapping(value="/login.do")
	public String login() {
		return "login/login&register/login";
	}
	@RequestMapping(value="/loginProc.do", method=RequestMethod.GET)
	public String loginUser(Model model,String id, ServletRequest request) {
		System.out.println(request.getParameter("kakaoemail"));
		System.out.println("User login service");
		UserVO vo = userService.select(id);
		model.addAttribute("user",vo);
		return "login/main/mother";
	}
	// 카카오 로그인창 호출
	@RequestMapping(value="/kakaoLogin.do", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code,Model model) throws Exception {
		System.out.println("#########" + code);
		String access_Token = userService.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);
		HashMap<String, Object> userInfo = userService.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));
		model.addAttribute("kakaoUser",userInfo);
		return "login/main/mother";
		/*
		 * 리턴값의 testPage는 아무 페이지로 대체해도 괜찮습니다.
		 * 없는 페이지를 넣어도 무방합니다.
		 * 404가 떠도 제일 중요한건 #########인증코드 가 잘 출력이 되는지가 중요하므로 너무 신경 안쓰셔도 됩니다.
		 */
    	}
	@RequestMapping(value="/mypage.do")
	public String mypage() {
		return "login/mypage/mypage";
	}
	@RequestMapping(value="/main.do")
	public String main() {
		return "login/main/mother";
	}
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(Model model, HttpServletRequest req) throws Exception{
		model.addAttribute("user",null);
		ModelAndView mv = new ModelAndView("redirect:/main.do");
        HttpSession session = req.getSession();
        session.invalidate();
        return mv;
	}
}
