package com.spring.myweb.VO.MyMannerVO;

import java.util.Date;

import lombok.Data;

@Data
public class MyMannerVO {
	private int user_seq; //구매한 유저
	private int	sell_user_seq; // 판매한 유저
	private int post_seq; // 판매된 게시물
	private int manner_temp; // 별점개수
	private String manner_compliment; // 칭찬 매너
	private String bad_manner; // 비매너
	private String manner_review; //후기작성
	private Date create_date; // 생성날짜

}
