package com.spring.myweb.VO.noticeVO;


import java.util.Date;

import com.spring.myweb.VO.PostVO.Time;

import lombok.Data;

@Data
public class NoticeVO {
	private int notice_seq;
	private String buyerId;
	private String sellerId;
	private int seq;
	private int read_notice;
	private String messageFrom;
	private String action;
	private String sys_time;
	
	public void setSys_time(Date sys_time) {
		this.sys_time = Time.calculateTime(sys_time);
	}
}
