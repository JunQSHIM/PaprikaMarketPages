package com.spring.myweb.VO.OneOnOneVO;

import java.util.Date;

import lombok.Data;

@Data
public class OneOnOneVO {
	private int user_seq;
	private String content;
	private Date create_date;
	private String nickname;
	private String id;
	private String email;
	private int status;

}
