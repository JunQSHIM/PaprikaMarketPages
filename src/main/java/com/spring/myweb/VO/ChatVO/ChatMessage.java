package com.spring.myweb.VO.ChatVO;

import java.util.Date;

import lombok.Data;

@Data
public class ChatMessage {
	private String roomId;
	private int sessionCount;
	private String name;
	private String message;
	private Date time;
}
