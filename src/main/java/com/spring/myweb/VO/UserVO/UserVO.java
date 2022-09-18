package com.spring.myweb.VO.UserVO;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class UserVO {
	private int user_seq;
	private String id;
	private String password;
	private String name;
	private String nickname;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String email;
	private String phone;
	private String location1;
	private String location2;
	private int rep_no;
	private String fav_category;
	private String fav_product;
	private int join_type;
	private int msg_agree;
	private int user_type;
	private String profile_image;
	private int available;
	private String mail_key;
	private int mail_auth;
	private String pay;

}
