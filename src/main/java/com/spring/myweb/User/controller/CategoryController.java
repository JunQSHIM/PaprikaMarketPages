package com.spring.myweb.User.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;


import com.spring.myweb.VO.CategoryVO.CategoryVO;

//@Controller
//@SessionAttributes("category")
//public class CategoryController {
//	
//	@Autowired
//	private CategoryService categoryService;
//	
//	@RequestMapping(value = "/create.do")
//	public String categoryList(Model model, CategoryVO vo) {
//		System.out.println("카테고리 목록 불러오기");
//		List<CategoryVO> list = categoryService.categoryList();
//		model.addAttribute("category",list);
//		return "login/sellpage/new";
//	}
//
//}
