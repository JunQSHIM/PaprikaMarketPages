package com.spring.myweb.VO.AdminVO;

import lombok.Data;

@Data
public class BannerVO {
	private int banner_seq;
	private String title;
	private String content;
	private String origin_file_name;
	private String saved_file_name;
}
