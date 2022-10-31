package com.spring.myweb.VO.DealVO;

import java.util.Date;

import lombok.Data;

@Data
public class DealVO {

	private int deal_seq;
	private int user_seq;
	private int post_seq;
	private int price;
	private Date deal_time;
	private String post_title;
}
