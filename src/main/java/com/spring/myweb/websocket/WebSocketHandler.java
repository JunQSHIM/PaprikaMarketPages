package com.spring.myweb.websocket;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.spring.myweb.Admin.Controller.AdminController;

@Repository
public class WebSocketHandler extends TextWebSocketHandler {

   @Autowired
   SqlSession sqlsession;
   private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

   private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();

   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception{
      logger.debug(session.getId() + " 연결 됨");
      users.put(session.getId(), session);
   }
   
   @Override
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      String msg = message.getPayload();
  	  // js에서 보낸 세션 아이디 값 
      if(StringUtils.isNotEmpty(msg)) {
         String sendId = msg;
         // 현재 session에 담겨있는 모든 사용자를 체크하기 위함.
         for (WebSocketSession responseIdSession : users.values()) {
            if (responseIdSession != null) {
               TextMessage tmpMsg = new TextMessage(sendId);
               responseIdSession.sendMessage(tmpMsg);
            }
         }
      }
   }
   
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
      logger.debug(session.getId() + " 연결 종료됨");
      users.remove(session.getId());
   }
}