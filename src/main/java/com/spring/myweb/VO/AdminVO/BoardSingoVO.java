package com.spring.myweb.VO.AdminVO;

import java.util.Date;

import lombok.Data;

@Data
public class BoardSingoVO {
	private String type="board";
	private String user_id;
	private String user_singo_id;
	private int board_seq;
	private String report_content;
	private Date report_date;
	private int state;
	private String board_content;
}
