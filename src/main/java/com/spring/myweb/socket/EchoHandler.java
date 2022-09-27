package com.spring.myweb.socket;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.spring.myweb.Service.NoticeService.NoticeService;
import com.spring.myweb.Service.PostService.PostService;
import com.spring.myweb.Service.UserService.UserService;
import com.spring.myweb.VO.PostVO.PostVO;
import com.spring.myweb.VO.PostVO.Time;
import com.spring.myweb.VO.ReportVO.ReportVO;
import com.spring.myweb.VO.UserVO.UserVO;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);

	@Autowired
	NoticeService noticeService;
	
	@Autowired
	PostService postService;
	
	@Autowired
	UserService userService;
	
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
		
		System.out.println("msg="+msg);
		if (StringUtils.isNotEmpty(msg)) {
			logger.info("if문 들어옴?");
			String[] strs = msg.split(",");
			if(strs != null && strs.length > 1) {
				String cmd = strs[0];
				String sellerId = strs[1];
				String buyerId = strs[2];
				String seq = strs[3];
				logger.info("length 성공?"+cmd);
				WebSocketSession sellerSession = null;
				if(userSessionsMap.get(sellerId)!=null) {
					sellerSession = userSessionsMap.get(sellerId);
				}
				WebSocketSession mySession = userSessionsMap.get(currentUserName(session));
				
				
				//찜
				if ("jjim".equals(cmd)) {
			        Date now = new Date();
			        String nowTime = Time.calculateTime(now);
					logger.info("찜");
					logger.info(buyerId+"가 "+sellerId+"님의 상품번호 "+seq+"를 찜했습니다.");
					if(sellerSession != null) {
						TextMessage sellerMsg = new TextMessage(buyerId + "님이 "
								+ "<a href='/myweb/postDetail.do?post_seq="+seq+"'  style=\"color: black\"><strong>"
								+ "상품을" +"</strong> 찜했습니다.</a>  ["+nowTime+"]");
						TextMessage buyerMsg = new TextMessage(sellerId+"님의 상품을 찜했습니다.["+nowTime+"]");
						mySession.sendMessage(buyerMsg);
						sellerSession.sendMessage(sellerMsg);
					}
					String action = "찜했습니다.";
					String messageFrom = "/myweb/postDetail.do?post_seq=";
					//DB에 저장
					HashMap<String, Object> info = new HashMap<>();
					info.put("buyerId", buyerId);
					info.put("sellerId", sellerId);
					info.put("seq", Integer.parseInt(seq));
					info.put("read_notice", 0);
					info.put("messageFrom", messageFrom);
					info.put("action", action);
					int result = noticeService.addNotice(info);
					if(result == 1) {
						logger.info("알림 저장 완료(찜)");
					}
					
				}
				
				//찜 취소
				else if("jjimCancel".equals(cmd)) {
					Date now = new Date();
			        String nowTime = Time.calculateTime(now);
					logger.info("찜");
					logger.info(buyerId+"가 "+sellerId+"님의 상품번호 "+seq+"를 찜했습니다.");
					if(sellerSession != null) {
						TextMessage sellerMsg = new TextMessage(buyerId + "님이 "
								+ "<a href='/myweb/postDetail.do?post_seq="+seq+"'  style=\"color: black\"><strong>"
								+ "상품을</strong> 찜하기를 취소했습니다.</a> ["+nowTime+"]");
						TextMessage buyerMsg = new TextMessage(sellerId+"님의 상품 찜하기를 취소했습니다. ["+nowTime+"]");
						mySession.sendMessage(buyerMsg);
						sellerSession.sendMessage(sellerMsg);
					}
					String action = "찜하기를 취소했습니다.";
					String messageFrom = "/myweb/postDetail.do?post_seq=";
					//DB에 저장
					HashMap<String, Object> info = new HashMap<>();
					info.put("buyerId", buyerId);
					info.put("sellerId", sellerId);
					info.put("seq", Integer.parseInt(seq));
					info.put("read_notice", 0);
					info.put("messageFrom", messageFrom);
					info.put("action", action);
					int result = noticeService.addNotice(info);
					if(result == 1) {
						logger.info("알림 저장 완료(찜 취소)");
					}
				}
//				
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
				//페이
				else if("pay".equals(cmd)) {
					Date now = new Date();
			        String nowTime = Time.calculateTime(now);
					logger.info("파프리카 페이되나?");
					logger.info(buyerId+"가 "+sellerId+"님의 상품번호 "+seq+"를 구매예약했습니다.");
					if(sellerSession != null) {
						TextMessage sellerMsg = new TextMessage(buyerId + "님이 "
								+ "<a href='/myweb/postDetail.do?post_seq="+seq+"'  style=\"color: black\"><strong>"
								+ "상품을" +"</strong> 구매예약했습니다.</a> ["+nowTime+"]");
						TextMessage buyerMsg = new TextMessage(sellerId+"님의 상품을 예약했습니다.["+nowTime+"]");
						mySession.sendMessage(buyerMsg);
						sellerSession.sendMessage(sellerMsg);
					}
					String action = "구매 예약했습니다.";
					String messageFrom = "/myweb/postDetail.do?post_seq=";
					//DB에 저장
					HashMap<String, Object> info = new HashMap<>();
					info.put("buyerId", buyerId);
					info.put("sellerId", sellerId);
					info.put("seq", Integer.parseInt(seq));
					info.put("read_notice", 0);
					info.put("messageFrom", messageFrom);
					info.put("action", action);
					int result = noticeService.addNotice(info);
					if(result == 1) {
						logger.info("알림 저장 완료(구매예약대기)");
					}
				}
				
				//페이취소
				else if("payCancel".equals(cmd)) {
					Date now = new Date();
			        String nowTime = Time.calculateTime(now);
					logger.info("파프리카 페이 취소");
					logger.info(buyerId+"가 "+sellerId+"님의 상품번호 "+seq+"를 구매를 취소했습니다.");
					if(sellerSession != null) {
						TextMessage sellerMsg = new TextMessage(buyerId + "님이 "
								+ "<a href='/myweb/postDetail.do?post_seq="+seq+"'  style=\"color: black\"><strong>"
								+ "상품을" +"</strong> 구매를 취소했습니다.</a> ["+nowTime+"]");
						TextMessage buyerMsg = new TextMessage(sellerId+"님의 상품을 예약 취소했습니다. ["+nowTime+"]");
						mySession.sendMessage(buyerMsg);
						sellerSession.sendMessage(sellerMsg);
					}
					String action = "구매 예약을 취소했습니다.";
					String messageFrom = "/myweb/postDetail.do?post_seq=";
					//DB에 저장
					HashMap<String, Object> info = new HashMap<>();
					info.put("buyerId", buyerId);
					info.put("sellerId", sellerId);
					info.put("seq", Integer.parseInt(seq));
					info.put("read_notice", 0);
					info.put("messageFrom", messageFrom);
					info.put("action", action);
					int result = noticeService.addNotice(info);
					if(result == 1) {
						logger.info("알림 저장 완료(구매예약대기 취소)");
					}
				}
				
				//신고당함
				else if("report".equals(cmd)) {
					Date now = new Date();
			        String nowTime = Time.calculateTime(now);
					logger.info("신고");
					logger.info(sellerId+"님의 상품번호 "+seq+" 신고당했습니다.");
					PostVO vo = (PostVO)postService.postDetail(Integer.parseInt(seq));
					
					HashMap<String,Object> reportInfo = new HashMap<>();
					
					UserVO uvo2 = (UserVO)userService.selectByNickname(buyerId);
					int reporter = uvo2.getUser_seq();
					int reported = vo.getUser_seq();
					System.out.println(reporter);
					System.out.println(reported);
					reportInfo.put("user_seq", reporter);
					reportInfo.put("user_singo_seq", reported);
					
					ReportVO rvo = postService.reportReason(reportInfo);
					System.out.println("신고내용 "+rvo.getReport_content());
					
					
					if(sellerSession != null) {
						logger.info("HIHI");
						TextMessage sellerMsg = new TextMessage(sellerId + "님의 "
								+ "<a href='/myweb/postDetail.do?post_seq="+seq+"'  style=\"color: black\"><strong>"
								+ "상품이" +"</strong> 신고되었습니다.</a> ["+nowTime+"]");
						TextMessage buyerMsg = new TextMessage(sellerId+"님의 상품을 신고했습니다. ["+nowTime+"]");
						mySession.sendMessage(buyerMsg);
						sellerSession.sendMessage(sellerMsg);
					}
					String action = "신고했습니다.";
					String messageFrom = rvo.getReport_content();
					//DB에 저장
					HashMap<String, Object> info = new HashMap<>();
					info.put("buyerId", buyerId);
					info.put("sellerId", sellerId);
					info.put("seq", Integer.parseInt(seq));
					info.put("read_notice", 0);
					info.put("messageFrom", messageFrom);
					info.put("action", action);
					int result = noticeService.addNotice(info);
					if(result == 1) {
						logger.info("알림 저장 완료(신고)");
					}
				}
				
				// 신고 채팅 찜한상품이 구매완료가 됨 
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