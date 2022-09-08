package com.spring.myweb.VO.AdminVO;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int board_seq;
	private String user_id;
	private String photo;
	private String title;
	private String content;
	private Date upload_date;
	private int cnt;
	private int status;
}
