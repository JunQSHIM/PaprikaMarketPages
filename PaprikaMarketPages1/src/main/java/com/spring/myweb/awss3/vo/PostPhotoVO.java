package com.spring.myweb.awss3.vo;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PostPhotoVO {

	private int photo_seq;
	private int post_seq;
	private MultipartFile origin_file_name;
	private MultipartFile saved_file_name;
	private Timestamp create_time;
}
