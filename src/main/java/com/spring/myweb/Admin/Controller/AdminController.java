package com.spring.myweb.Admin.Controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.myweb.DAO.UserDAO.UserDAO;
import com.spring.myweb.VO.UserVO.UserVO;


@Controller
public class AdminController {
	
	// 루트 컨테이너에서 DAO 객체를 가져와 저장
	@Resource(name = "userDAO")
	private UserDAO dao;

	@RequestMapping(value = "/test.mdo", method=RequestMethod.GET)
	public String testAdmin(Model model) {
		System.out.println("Admid service");
		List<UserVO> vo2 = dao.selectAll();
		model.addAttribute("list",vo2);
		return "Admin_page/member/ad_memlist";
	}
	

}