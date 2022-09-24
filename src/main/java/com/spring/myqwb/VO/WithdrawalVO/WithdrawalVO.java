package com.spring.myqwb.VO.WithdrawalVO;

import java.util.Date;

import lombok.Data;

@Data
public class WithdrawalVO {
	private int withdrawal_seq;
	private int user_seq;
	private int withdrawal_content;
	private Date withdrawal_date;

}
