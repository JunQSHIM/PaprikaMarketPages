package com.spring.myweb.VO.UserBoardVO;


import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@Data
public class UserBoardVO {

	private int board_seq;
	private int user_seq;
	private String nickname;
	private String title;
	private String content;
	@Temporal(TemporalType.TIMESTAMP)
	private Date upload_date;
	private int cnt;
	private int status;

}
