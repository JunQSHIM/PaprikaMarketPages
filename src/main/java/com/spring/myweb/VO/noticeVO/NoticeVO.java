package com.spring.myweb.VO.noticeVO;

import lombok.Data;

@Data
public class NoticeVO {
	private int notice_seq;
	private String buyerId;
	private String sellerId;
	private int seq;
	private int read_notice;
}
