package com.spring.myweb.VO.SellboardVO;


import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@Data
public class SellBoardVO {

	private int prod_seq;
	private String nickname;
	private String location;
	private String prod_title;
	private String prod_content;
	private int price;
	private String category;
	@Temporal(TemporalType.TIMESTAMP)
	private Date upload_date;
	private int count;
	private int status;

}
