package com.spring.myweb.awss3.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.myweb.VO.SellboardVO.SellBoardVO;
import com.spring.myweb.awss3.AwsS3;
import com.spring.myweb.awss3.vo.PhotoTest;
import com.spring.myweb.awss3.vo.ProdPhotoVO;

@Controller
public class AwsS3Controller {
	

	@GetMapping("/insertPhoto.do")
	public String dfsfdd() {
		return"login/main/prods";
	}
	@PostMapping("/insertPhoto.do")
	public String insertPhto(Model model, ProdPhotoVO vo) {
		System.out.println("컨트롤러");
	
		//메인 이미지 가져오기
		try {
			String key = vo.getOrigin_file_name().getOriginalFilename();
			InputStream is = vo.getOrigin_file_name().getInputStream();
			String contentType = vo.getOrigin_file_name().getContentType();
			long contentLength = vo.getOrigin_file_name().getSize();
			AwsS3 awsS3=AwsS3.getinstance();
			awsS3.upload(is, key,contentType ,contentLength);
			System.out.println("main 업로드 완료");
			
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		return "login/main/prods";
	}
}
