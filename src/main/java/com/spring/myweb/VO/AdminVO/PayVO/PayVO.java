package com.spring.myweb.VO.AdminVO.PayVO;

import lombok.Data;

@Data
public class PayVO {
	
	private int pay_seq;
	private String sellerId;
	private String buyerId;
	private int post_seq;
	private int process;
	private String sellerQr;
	private String buyerQr;
	private int status;
}
