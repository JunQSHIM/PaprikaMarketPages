package com.spring.myweb.awss3.controller;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.myweb.awss3.service.AwsS3Service;
import com.spring.myweb.awss3.vo.PostPhotoVO;

@Controller
public class AwsS3Controller {
	

//	@GetMapping("/insertPhoto.do")
//	public String dfsfdd() {
//		return"login/main/prods";
//	}
//	@PostMapping("/insertPhoto.do")
//	public String insertPhoto(Model model, PostPhotoVO vo) {
//		System.out.println("컨트롤러");
//	
//		//메인 이미지 가져오기
//		try {
//			String key = vo.getOrigin_file_name().getOriginalFilename();
//			InputStream is = vo.getOrigin_file_name().getInputStream();
//			String contentType = vo.getOrigin_file_name().getContentType();
//			long contentLength = vo.getOrigin_file_name().getSize();
//			AwsS3Service awsS3=AwsS3Service.getinstance();
//			awsS3.upload(is, key,contentType ,contentLength);
//			System.out.println("main 업로드 완료");
//			
//			
//		} catch(IOException e) {
//			e.printStackTrace();
//		}
//		return "login/main/mother";
//	}
}
