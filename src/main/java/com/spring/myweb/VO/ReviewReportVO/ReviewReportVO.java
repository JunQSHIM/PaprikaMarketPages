package com.spring.myweb.VO.ReviewReportVO;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewReportVO {

	private int singo_seq;
	private int user_seq;
	private int user_singo_seq;
	private String report_content;
	private Date report_date;
	
}
