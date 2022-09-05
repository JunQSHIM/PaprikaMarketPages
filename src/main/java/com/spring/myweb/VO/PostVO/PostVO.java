package com.spring.myweb.VO.PostVO;

import java.util.Date;

import lombok.Data;

@Data
public class PostVO {
	
	private int post_seq;
	private int user_seq;
	private String nickname;
	private String post_title;
	private String post_content;
	private int price;
	private String location;
	private int category_seq;
	private int cnt;
	private Date upload_date;
	private int sell_status;
	private int status;

}
