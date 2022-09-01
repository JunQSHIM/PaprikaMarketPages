package com.spring.myweb.awss3.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PhotoTest {

	private String photo_name;
	private String photo_path;
	private MultipartFile main_image;
	
}
