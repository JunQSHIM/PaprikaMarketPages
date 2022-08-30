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

import com.spring.myweb.Service.KakaoService.KakaoService;
import com.spring.myweb.Service.UserService.UserService;
import com.spring.myweb.VO.KakaoVO.KakaoVO;
import com.spring.myweb.VO.UserVO.UserVO;

@Controller
@SessionAttributes("user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	KakaoService kakaoService;

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
		System.out.println("User login service");
		UserVO vo = userService.select(id);
		model.addAttribute("user",vo);
		return "login/main/mother";
	}
	// 카카오 로그인창 호출
	@RequestMapping(value="/kakaoLogin.do", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpServletRequest req) throws Exception {
		String access_Token = userService.getAccessToken(code);
		UserVO userInfo = userService.getUserInfo(access_Token);
        HttpSession session = req.getSession();
		session.setAttribute("kakaoUser",userInfo);
		return "login/main/mother";
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
}
