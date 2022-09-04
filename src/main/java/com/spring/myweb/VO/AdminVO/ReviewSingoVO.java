package com.spring.myweb.VO.AdminVO;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewSingoVO {
	private String type="review";
	private String user_id;
	private String user_singo_id;
	private int review_seq;
	private String report_content;
	private Date report_date;
	private int state;
}
