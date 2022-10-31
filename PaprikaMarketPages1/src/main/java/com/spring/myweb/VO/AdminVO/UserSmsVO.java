package com.spring.myweb.VO.AdminVO;

import lombok.Data;

@Data
public class UserSmsVO {
	private int user_seq;
	private int join_type;
	private String id;
	private String name;
	private String phone;
	private String email;
	private int msg_agree;
	private int user_type;
}
