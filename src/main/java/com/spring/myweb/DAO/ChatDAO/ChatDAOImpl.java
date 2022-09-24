package com.spring.myweb.DAO.ChatDAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.myweb.VO.ChatVO.ChatMessage;
import com.spring.myweb.VO.ChatVO.ChatRoom;
import com.spring.myweb.VO.PostVO.PostVO;

@Repository
public class ChatDAOImpl implements ChatDAO{
	@Inject
	private SqlSession session;
	
	@Override
	public ChatRoom searchChatRoom(ChatRoom room) {
		return session.selectOne("chatDB.selectRoom",room);
	}

	@Override
	public void createChat(ChatRoom room) {
		session.insert("chatDB.createChat",room);
	}

	@Override
	public void updateunReadCount(ChatRoom chatroom) {
		session.update("chatDB.updateunReadCount", chatroom);
	}

	@Override
	public List<ChatRoom> chatRoomList(String userNickname) {
		return session.selectList("chatDB.selectRoomList", userNickname);
	}

	@Override
	public List<ChatRoom> chatRoomListSell(String userNickname) {
		return session.selectList("chatDB.selectRoomListSell", userNickname);
	}

	@Override
	public List<ChatMessage> messageList(String roomId) {
		return session.selectList("chatDB.messageList", roomId);
	}

	@Override
	public ChatRoom searchRoomId(String roomId) {
		return session.selectOne("chatDB.searchRoomId",roomId);
	}

	@Override
	public void insertMessage(ChatMessage chatMessage) {
		session.insert("chatDB.insertMessage", chatMessage);
		
	}

	@Override
	public void updateSellStatus(PostVO vo) {
		session.update("chatDB.updateSellStatus", vo);
	}
	
}
