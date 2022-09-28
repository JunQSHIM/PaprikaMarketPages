<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:requestEncoding value="utf-8" />
<c:set value="${param.id }" var="id" />
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/chatting/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/chatting/mychat.css">
<script src="https://kit.fontawesome.com/a75c39dc66.js" crossorigin="anonymous"></script>
<script>
 $(document).ready(function(){
	 
	 $("#mystore").click(function(){
		
		$('.listbuy').removeClass('display-none');
		$('.store').addClass('display-none');    
		$('#back').removeClass('display-none');
	});
	 
	 $("#sellstore").click(function(){
		$('.listsell').removeClass('display-none');
		$('.store').addClass('display-none');    
		$('#back').removeClass('display-none');
	});
	 
	 $("#back").click(function(){                
		   $(".chat").empty();
	       $('.listsell').addClass('display-none');       
	       $('.listbuy').addClass('display-none');       
	       $('.store').removeClass('display-none');    
		   $('#back').addClass('display-none');
		   websocket.close();
	});
	 
})


</script>
<meta charset="UTF-8">
<link rel="stylesheet" href="mychat.css">

<title>Insert title here</title>
</head>
<script>
$(window).on("beforeunload", function(){
	 websocket.close();   
});

</script>
<body>

	<div class="container clearfix">
		<div class="people-list" id="people-list">
			<div class="back">
				<a onclick="location.href='main.do'"><img id="main" src="/myweb/login/images/dklogo.png"></a>
			</div>
			<button id="back" class="display-none">뒤로가기</button>
			<ul class="store">
				<li id="mystore">
					<img class="cimg" src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/2c24394e-60a1-4c03-965d-c0b8e7a966de.jpg" alt="Mystroe">
					<div class="about">
						<div class="name" id="user_name">${user.nickname }</div>
					</div>
				</li>
				<li id="sellstore">
					<img class="cimg" src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/019f6cf9-d9d2-43d8-beb1-570e5267f0a3.jpg" alt="Mystroe">
					<div class="about">
						<div class="name">구매하기</div>
					</div>
				</li>
			</ul>
			
			<ul class="listbuy display-none">
				<c:forEach items="${buy }" var="room">
				<li class="post">
					<img class="cimg" src="${room.postPic }" alt="avt">
				<div class="about">
					<div class="name" id="user_name">${room.userNickname }</div>
				</div>
				<input type="hidden" value="${room.roomId }">
				<input type="hidden" value="${room.post_seq }">
				</li>
			</c:forEach>
			</ul>
			<ul class="listsell display-none">
			<c:forEach items="${sell }" var="room">
				<li class="post">
					<img class="cimg" src="${room.postPic }" alt="avt">
				<div class="about">
					<div class="name" id="user_name">${room.masterNickname }</div>
					<div class="unRead">${room.unReadCount }</div>
				</div>
				<input type="hidden" value="${room.roomId }"> 
				</li>
			</c:forEach>
			</ul>
		</div>
		<div class="chat">
			
		</div>
		<!-- end chat -->
		
	</div>
<script type="text/javascript">
	$(".post").click(function(){
		var chatname = $(this).find('.post').text();
		var chatimg = $(this).find('.cimg').attr("src");
 		var check = document.getElementById('chat-header');
 		var roomId = $(this).children('input').val();
 		console.log(roomId);
 		var name = $(this).children('#user_name').val();
 		if(document.querySelector('.chat-header div') == null){
			$(".chat").load(roomId + ".cdo");
			enterRoom(roomId);
 		}
 		else{
 			$(".chat").empty();
 			 websocket.close();
 		}
	});
	
	let roomId;
    // enter 키 이벤트
    $(document).on('keydown', 'div.chat-message textarea', function(e){
         if(e.keyCode == 13 && !e.shiftKey) {
             e.preventDefault(); // 엔터키가 입력되는 것을 막아준다.
             const message = $(this).val();  // 현재 입력된 메세지를 담는다.
               
             let search3 = $('div.chat-message textarea').val();
              
             if(search3.replace(/\s|  /gi, "").length == 0){
                   return false;
                   $('div.chat-message textarea').focus();
                }
             sendMessage(message);
             // textarea 비우기
             clearTextarea();
         }
    });

    // 채팅 방 클릭 시 방번호 배정 후 웹소켓 연결
    function enterRoom(obj){
    	roomId=obj;
         // 웹소켓 연결
         connect();
         console.log("enterRoom");
    }
    
    // 웹소켓
     let websocket;
 
     //입장 버튼을 눌렀을 때 호출되는 함수
     function connect() {
         // 웹소켓 주소
         var wsUri = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/websocket/echo.cdo";
         // 소켓 객체 생성
         websocket = new WebSocket(wsUri);
         //웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
         websocket.onopen = onOpen;
         websocket.onmessage = onMessage;
     }
     
     //웹 소켓에 연결되었을 때 호출될 함수
     function onOpen() {
         // ENTER-CHAT 이라는 메세지를 보내어, Java Map에 session 추가
         const data = {
                "roomId" : roomId,
                "name" : "${ user.nickname }",
       		   "message" : "ENTER-CHAT"
        };
        let jsonData = JSON.stringify(data);
         websocket.send(jsonData);
     }
     
     const today = new Date().toISOString();

    // * 1 메시지 전송
    function sendMessage(message){
        
        const data = {
            "roomId" : roomId,
            "name" : "${ user.nickname }",
            "message"   : message ,
            "time" : today
        };
          
        CheckLR(data);
         
        let jsonData = JSON.stringify(data);
         
         websocket.send(jsonData);
     }
    
     // * 2 메세지 수신
     function onMessage(evt) {
        let receive = evt.data.split(",");
         
        const data = {
             "name" : receive[0],
             "message" : receive[1],
             "time" : today
        };
         if(data.name != "${ user.nickname }"){
            CheckLR(data);
         }
    }
     
    // * 2-1 추가 된 것이 내가 보낸 것인지, 상대방이 보낸 것인지 확인하기
    function CheckLR(data) {
        // email이 loginSession의 email과 다르면 왼쪽, 같으면 오른쪽
        const LR = (data.name != "${ user.nickname }") ? "you" : "me";
         // 메세지 추가
         
        appendMessageTag(LR, data.message, data.name, data.time);
    }
     
    // * 3 메세지 태그 append
    function appendMessageTag(LR_className, message, name, time) {
    	
        const chatLi = createMessageTag(LR_className, message, name, time);
        $('#realtime').append(chatLi);
     
        // 스크롤바 아래 고정
        $('div.chat-history').scrollTop($('div.chat-history').prop('scrollHeight'));
    }
     
    // * 4 메세지 태그 생성
    function createMessageTag(LR_className, message, name, time) {
    	 
    	let chatLi;
         // 형식 가져오기 (나:상대방)
         if(LR_className =='me'){
         	chatLi = $('.tempRight').clone();
         	chatLi.addClass("right");
         	chatLi.removeClass("tempRight");
         	
         }else{
         	chatLi = $('.tempLeft').clone();
         	chatLi.addClass('left');
	     	chatLi.removeClass("tempLeft");
         }
     	chatLi.removeClass("display-none");

         
         // find() : chatLi의 하위 요소 찾기
         chatLi.find('.message-data-name').text(name);      // 이름 추가
         chatLi.find('.message').text(message); // 메세지 추가
         chatLi.find('.message-data-time').text(time.replace('T', ' ').substring(0, 19)); // 메세지 추가
         return chatLi;
    };
     
    // * 5 - 채팅창 비우기
    function clearTextarea() {
         $('div.chat-message textarea').val('');
         return false;
    };
</script>
</body>
</html>