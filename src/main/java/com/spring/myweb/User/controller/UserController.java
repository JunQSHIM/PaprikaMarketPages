package com.spring.myweb.User.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.myweb.DAO.UserDAO.UserDAO;
import com.spring.myweb.VO.UserVO.UserVO;

@Controller
@SessionAttributes("user")
public class UserController {

	@Resource(name = "userDAO")
	private UserDAO dao;

	@RequestMapping(value = "/insertProc.do", method=RequestMethod.GET)
	public String insertUser(Model model,UserVO vo) {
		System.out.println("User service");
		int success = dao.insertUser(vo);
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
	public String loginUser(Model model,String id) {
		System.out.println("User login service");
		UserVO vo = dao.select(id);
		model.addAttribute("user",vo);
		System.out.println(vo.getName());
		System.out.println(vo.getEmail());
		System.out.println(vo.getNickname());
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
		System.out.println("DDD");
		model.addAttribute("user",null);
		ModelAndView mv = new ModelAndView("redirect:/main.do");
        HttpSession session = req.getSession();
        session.invalidate();
        return mv;
	}
}
