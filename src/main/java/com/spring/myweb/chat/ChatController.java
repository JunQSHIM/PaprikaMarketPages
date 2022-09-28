package com.spring.myweb.chat;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonIOException;
import com.spring.myweb.Service.BoardService.UserBoardService;
import com.spring.myweb.Service.ChatService.ChatService;
import com.spring.myweb.Service.ChatService.ProductService;
import com.spring.myweb.Service.PostService.PostService;
import com.spring.myweb.VO.ChatVO.ChatMessage;
import com.spring.myweb.VO.ChatVO.ChatRoom;
import com.spring.myweb.VO.PostVO.PostVO;
import com.spring.myweb.VO.UserVO.UserVO;
 
@Controller
public class ChatController {
    
    @Autowired
    ChatService cService;
    
    @Autowired
    ProductService pService;
    
    @Autowired
    UserBoardService uService;
    
    @Autowired
    PostService postService;
    
//    @Autowired
//    private ChatSession cSession;
    
    
    @RequestMapping("/createChat.cdo")
    public String createChat(ChatRoom room, String userNickName,int post_user_seq, int post_seq, PostVO pvo, Model model){
        room.setMasterNickname(uService.findNickname(post_user_seq));
        room.setUserNickname(userNickName);
        room.setPost_seq(post_seq);
        
        String random = UUID.randomUUID().toString() + userNickName;
        String randomRoom = random.replaceAll("[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9,. ]", "");

       
        room.setRoomId(randomRoom);
        room.setPostPic(postService.photoOne(pvo.getPost_seq()));
        
        ChatRoom exist  = cService.searchChatRoom(room);
        // DB에 방이 없을 때
        if(exist == null) {
            int result = cService.createChat(room);
            if(result == 1) {
            }
        }else {
        }
        model.addAttribute("room", room);
        return "redirect:chat.cdo";
    }
    
    
    /**
     * 해당 채팅방의 채팅 메세지 불러오기
     */
    @RequestMapping(value="{roomId}.cdo")
    public String messageList(HttpSession session, UserVO uvo ,ChatRoom room,Model model, HttpServletResponse response, @PathVariable("roomId") String roomId, String type, PostVO pvo) throws JsonIOException, IOException {
    	ChatRoom temp = cService.searchChatRoomId(roomId);
    	List<ChatMessage> mList = cService.messageList(roomId);

//        response.setContentType("application/json; charset=utf-8");
// 
//        // 안읽은 메세지의 숫자 0으로 바뀌기
//        ChatMessage message = new ChatMessage();
//        message.setName(userNickname);
//        message.setRoomId(roomId);
//        message.setPost_seq(pvo.getPost_seq());
//        cService.updateCount(message);
    	model.addAttribute("chat", mList);
    	model.addAttribute("room",temp);
        return "chatcontent";
    }

    @RequestMapping("/chat.cdo")
    public String openChat(HttpSession session, ChatRoom room,  UserVO uvo, HttpServletResponse response, Model model, PostVO pvo) {
    	uvo = (UserVO)session.getAttribute("user");
    	String userNickname = uvo.getNickname();
    	
    	List<ChatRoom> bList = cService.chatRoomList(userNickname);
    	List<ChatRoom> sList = cService.chatRoomListSell(userNickname);
    	
	//	ArrayList<String> chatSessionList = cSession.getLoginUser();
    	
    	model.addAttribute("buy", bList);
    	model.addAttribute("sell", sList);
    	//model.addAttribute("chatuser", chatSessionList);
    	return "chatting";
    }
    
    @RequestMapping("/sellStatus.cdo")
    public @ResponseBody String updateStatus(PostVO pvo, @RequestParam(value="post_seq")int post_seq, @RequestParam(value="datepicker")String datepicker) {
    	pvo.setPost_seq(post_seq);
    	pvo.setSell_status(3);
    	cService.updateSellStatus(pvo);
    	System.out.println(post_seq);
    	System.out.println(datepicker);
    	return datepicker;
    }
    
    
}