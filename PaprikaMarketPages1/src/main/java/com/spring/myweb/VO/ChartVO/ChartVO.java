package com.spring.myweb.VO.ChartVO;

import lombok.Data;

@Data
public class ChartVO {
	private int today;
	private int week=7;
	private int month;
	private String type;
	
	private int cnt;
	private String name;
	
	private int time;
}
