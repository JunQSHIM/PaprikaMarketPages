package com.spring.myweb.Admin.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.myweb.Service.UserService.UserService;
import com.spring.myweb.VO.UserVO.UserVO;


@Controller
public class AdminController {
	
	@Autowired
	UserService userService;

	@RequestMapping(value = "/test.mdo", method=RequestMethod.GET)
	public String testAdmin(Model model) {
		List<UserVO> vo2 = userService.selectAll();
		model.addAttribute("list",vo2);
		return "Admin_page/member/ad_memlist";
	}
	

}