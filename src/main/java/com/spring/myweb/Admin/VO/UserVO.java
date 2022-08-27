package com.spring.myweb.Admin.VO;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	private int user_seq;
	private String id;
	private String password;
	private String name;
	private String nickname;
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
}
