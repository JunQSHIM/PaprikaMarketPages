package com.spring.myweb.VO.AdminVO;

import java.util.Date;

import lombok.Data;

@Data
public class PostSingoVO {
	private String type="post";
	private int user_seq;
	private int post_user_seq;
	private int post_seq;
	private String report_content;
	private Date report_date;
}
