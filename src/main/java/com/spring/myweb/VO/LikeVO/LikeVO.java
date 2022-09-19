package com.spring.myweb.VO.LikeVO;

import lombok.Data;

@Data
public class LikeVO {

	private int post_seq;
	private int user_seq;
	private int likeCnt;
	private int count; // 좋아요가 눌렸는지 안 눌렸는지
}