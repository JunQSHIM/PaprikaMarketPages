package com.spring.myweb.DAO.ChatDAO;

import java.util.List;

import com.spring.myweb.VO.ChatVO.ChatMessage;
import com.spring.myweb.VO.ChatVO.ChatRoom;
import com.spring.myweb.VO.PostVO.PostVO;


public interface ChatDAO {
	public ChatRoom searchChatRoom(ChatRoom room);//채팅방 찾기 DB
	public ChatRoom searchRoomId(String roomId);//채팅방 이름으로 찾기

	public void createChat(ChatRoom room);//채팅방 만들기

	public void updateunReadCount(ChatRoom chatroom);//메시지 저장

	public List<ChatRoom> chatRoomList(String userNickname);//판매 채팅방 리스트 불러오기

	public List<ChatRoom> chatRoomListSell(String userNickname);//구매 채팅방 불러오기

	public List<ChatMessage> messageList(String roomId);//메시지 불러오기
	public void insertMessage(ChatMessage chatMessage);//메시지 db에 저장
	public void updateSellStatus(PostVO vo);//거래 예약

}
