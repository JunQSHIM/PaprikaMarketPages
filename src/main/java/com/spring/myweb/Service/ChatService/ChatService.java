package com.spring.myweb.Service.ChatService;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.myweb.DAO.ChatDAO.ChatDAO;
import com.spring.myweb.VO.ChatVO.ChatMessage;
import com.spring.myweb.VO.ChatVO.ChatRoom;
import com.spring.myweb.VO.PostVO.PostVO;
@Service
public class ChatService {
	
	@Inject
	private ChatDAO chatDao;

	public List<ChatMessage> messageList(String roomId) {
		return chatDao.messageList(roomId);
	}
	
	public List<ChatRoom> chatRoomList(String userNickname) {
		List<ChatRoom> cList = chatDao.chatRoomList(userNickname);
		return cList;
	}

	public void updateunReadCount(ChatRoom chatroom) {
		chatDao.updateunReadCount(chatroom);
	}

	public ChatRoom searchChatRoom(ChatRoom room) {
		return chatDao.searchChatRoom(room);
	}

	public int createChat(ChatRoom room) {
		int success = 1;
		chatDao.createChat(room);
		return success;
	}

	public int selectUnReadCount(ChatMessage message) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public void updateSellStatus(PostVO vo) {
		chatDao.updateSellStatus(vo);
	}

	public void insertMessage(ChatMessage chatMessage) {
		System.out.println(chatMessage);
		chatDao.insertMessage(chatMessage);
	}

	public ChatRoom searchChatRoomId(String roomId) {
		return chatDao.searchRoomId(roomId);
	}
	
	public List<ChatRoom> chatRoomListSell(String userNickname) {
		List<ChatRoom> cList = chatDao.chatRoomListSell(userNickname);
		System.out.println(cList);
		return cList;
	}

	



}
