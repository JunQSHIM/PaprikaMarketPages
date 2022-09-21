package com.spring.myweb.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.spring.myweb.VO.UserVO.UserVO;
 
@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	// 1:1로 할 경우
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {//클라이언트와 서버가 연결
		// TODO Auto-generated method stub
		logger.info("Socket 연결");
		sessionList.add(session);
		logger.info(currentUserName(session));//현재 접속한 사람
		String senderId = currentUserName(session);
		userSessionsMap.put(senderId,session);
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		System.out.println("fjfj");
		System.out.println("msg="+msg);
		if (StringUtils.isNotEmpty(msg)) {
			logger.info("if문 들어옴?");
			String[] strs = msg.split(",");
			if(strs != null && strs.length > 1) {
				
				String cmd = strs[0];
				String sellerId = strs[1];
				String buyerId = strs[2];
				String post_seq = strs[3];
				logger.info("length 성공?"+cmd);
				
				WebSocketSession sellerSession = userSessionsMap.get(sellerId);
				WebSocketSession mySession = userSessionsMap.get(currentUserName(session));

//				
//				//댓글
				if ("reply".equals(cmd) && mySession != null) {
					logger.info("onmessage되나?");
					TextMessage tmpMsg = new TextMessage(buyerId + "님이 "
							+ "<a href='/board/readView?bno=style=\"color: black\">"
							+ " 에 댓글을 달았습니다!</a>");
					mySession.sendMessage(tmpMsg);
				}
//				//찜
////				else if("scrap".equals(cmd) && boardWriterSession != null) {
////					//replyWriter = 스크랩누른사람 , boardWriter = 게시글작성자
////					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
////							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
////							+ title+"</strong>에 찜을 눌렀습니다!</a>");
////
////					boardWriterSession.sendMessage(tmpMsg);
////					
////				}
//				//좋아요
//				else if("like".equals(cmd) && boardWriterSession != null) {
//					//replyWriter = 좋아요누른사람 , boardWriter = 게시글작성자
//					TextMessage tmpMsg = new TextMessage(yourId + "님이 "
//							+ "<a href='/myweb/postDetail.do?post_seq=" + post_seq + "'  style=\"color: black\"><strong>"
//							+ title+"</strong>상품을 좋아요했습니다!</a>");
//					boardWriterSession.sendMessage(tmpMsg);
//					
//				}
//				
////				//DEV
////				else if("Dev".equals(cmd) && boardWriterSession != null) {
////					//replyWriter = 좋아요누른사람 , boardWriter = 게시글작성자
////					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
////							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
////							+ title+"</strong> 에 작성한 글을 DEV했습니다!</a>");
////
////					boardWriterSession.sendMessage(tmpMsg);
////					
////				}
//				
////				//댓글채택
////				else if("questionCheck".equals(cmd) && replyWriterSession != null) {
////					//replyWriter = 댓글작성자 , boardWriter = 글작성자
////					TextMessage tmpMsg = new TextMessage(boardWriter + "님이 "
////							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
////							+ title+"</strong> 에 작성한 댓글을 채택했습니다!</a>");
////
////					replyWriterSession.sendMessage(tmpMsg);
////					
////				}
//				
//				//페이
				else if("pay".equals(cmd) && sellerSession != null) {
					logger.info("파프리카 페이되나?");
					logger.info(buyerId+"가 "+sellerId+"님의 상품번호 "+post_seq+"를 구매예약했습니다.");
					TextMessage tmpMsg = new TextMessage(buyerId + "님이 "
							+ "<a href='/myweb/postDetail.do?post_seq="+post_seq+"'  style=\"color: black\"><strong>"
							+ "상품을" +"</strong> 구매예약했습니다.</a>");
					System.out.println(tmpMsg);
					TextMessage msg2 = new TextMessage(sellerId+"님의 상품을 예약했습니다.");
					mySession.sendMessage(msg2);
					sellerSession.sendMessage(tmpMsg);
				}
				
				//찜 신고 채팅 찜한상품이 구매완료가 됨 
				//후기 리뷰 
				
//				//댓글DEV
//				else if("commentDev".equals(cmd) && replyWriterSession != null) {
//					logger.info("좋아요onmessage되나?");
//					logger.info("result=board="+boardWriter+"//"+replyWriter+"//"+bno+"//"+bgno+"//"+title);
//					//replyWriter=댓글작성자 , boardWriter=좋아요누른사람 
//					TextMessage tmpMsg = new TextMessage(boardWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 댓글을 DEV했습니다!</a>");
//
//					replyWriterSession.sendMessage(tmpMsg);
//				}
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("Socket 끊음");
		userSessionsMap.remove(currentUserName(session),session);
	}
	private String currentUserName(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		UserVO loginUser = (UserVO)httpSession.get("user");
		
		if(loginUser == null) {
			String mid = session.getId();
			System.out.println("NULL ID");
			return mid;
		}
		String mid = loginUser.getNickname();
		System.out.println(mid);
		return mid;
		
	}
}