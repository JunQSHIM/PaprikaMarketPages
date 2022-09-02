package com.spring.myweb.Admin.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.myweb.Service.AdminService.AdminService;
import com.spring.myweb.Service.UserService.UserService;
import com.spring.myweb.VO.AdminVO.UserSmsVO;

import com.spring.myweb.Service.RegisterAgreementService.RegisterAgreementService;
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
	RegisterAgreementService agreementService;


	@RequestMapping(value = "/main.mdo", method=RequestMethod.GET)
	public String mainAdmin() {
		return "Admin_page/layout/ad_main";
	}
	
	@RequestMapping(value = "/user.mdo", method=RequestMethod.GET)
	public String userAdmin(Model model) {
		System.out.println("관리자 페이지 회원목록");
		List<UserVO> vo = adminService.selectAll();
		model.addAttribute("admin",vo);
		return "Admin_page/member/ad_memlist";
	}
	
	@RequestMapping(value = "/sms.mdo", method=RequestMethod.GET)
	public String userSmsAdmin(Model model) {
		System.out.println("관리자 페이지 sms 회원목록");
		List<UserSmsVO> sms = adminService.selectSmsAll();
		model.addAttribute("admin",sms);
		return "Admin_page/admin_board/ad_board";
	}
	
	@RequestMapping(value ="/admin_list.mdo")
	public String adminList(Model model) {
		List<RegisterAgreementVO> agreementList = agreementService.selectAll();
		model.addAttribute("newest",agreementList);
		return "Admin_page/admin_list/agreement";
	}
	
}