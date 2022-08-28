package com.spring.myweb.User.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.myweb.DAO.UserDAO.UserDAO;
import com.spring.myweb.VO.UserVO.UserVO;

@Controller
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
}
