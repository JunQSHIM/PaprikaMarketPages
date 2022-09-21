package com.spring.myweb.VO.ReportVO;

import java.util.Date;

import lombok.Data;

@Data
public class ReportVO {

	private int user_seq; // 신고한 유저
	private int user_singo_seq; // 신고 당한 유저
	private int post_seq; // 신고 당한 게시판
	private String report_content; // 신고내용
	private Date report_date; // 신고 날짜
	private int status; // 상태...?
}
