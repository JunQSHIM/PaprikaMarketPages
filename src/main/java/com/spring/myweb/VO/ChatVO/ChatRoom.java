package com.spring.myweb.VO.ChatVO;

import lombok.Data;

@Data
public class ChatRoom {
	private String masterNickname;
	private String postPic;
	private String userNickname;
	private int unReadCount;
	private int post_seq;
	private String roomId;
}
