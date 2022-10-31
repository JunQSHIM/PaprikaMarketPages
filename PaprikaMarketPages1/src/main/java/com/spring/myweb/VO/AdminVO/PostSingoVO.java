package com.spring.myweb.VO.AdminVO;

import java.util.Date;

import lombok.Data;

@Data
public class PostSingoVO {
	private String type="post";
	private String user_id;
	private String user_singo_id;
	private int post_seq;
	private String report_content;
	private Date report_date;
	private int state;
	private String post_content;
}
