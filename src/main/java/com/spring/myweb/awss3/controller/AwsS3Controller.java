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

@Controller
public class AwsS3Controller {
	

	@GetMapping("/insertPhoto.mdo")
	public String insertPhto() {
		return"testPhoto";
	}
	@PostMapping("/insertPhoto.mdo")
	public String insertPhto(Model model, PhotoTest vo) {
		System.out.println("컨트롤러");
		//메인 이미지 가져오기
		try {
			String key = vo.getMain_image().getOriginalFilename();
			InputStream is = vo.getMain_image().getInputStream();
			String contentType = vo.getMain_image().getContentType();
			long contentLength = vo.getMain_image().getSize();
			
			AwsS3 awsS3=AwsS3.getinstance();
			awsS3.upload(is, key,contentType ,contentLength);
			System.out.println("main 업로드 완료");
		} catch(IOException e) {
			e.printStackTrace();
		}
		return "testPhoto";
	}
}
