<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/a75c39dc66.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<script>	
  $( function() {
	    $( "#datepicker" ).datepicker({
	    	 showButtonPanel: true,
	    });
	    $( "#datepicker" ).datepicker( "option", "showAnim", "slide" );
	  } );
  
  function reserve(){
	  var datepicker = document.getElementById('datepicker').value;
	  var post_seq = document.getElementById('post_seq').value;
	  $.ajax({ // ajax 기본형태
			url : "/myweb/sellStatus.cdo",
			type : "post",
			data : {
				post_seq : post_seq,
				datepicker : datepicker
			}, //위와동일
			success : function(data){ // status, xhr 생략가능 
				$("#reserveDate").append("약속날짜 : "+data);
			},
			error : function() { // (파라미터 생략가능)
				alert("error");
			}
		});	
  }
  function compDeal(){
	  alert("거래가 확정되었습니다.");
  }
 </script>
</head>
<body>
	<div class="chat-header clearfix">
		<img class="cimg"
			src="${room.postPic }"
			alt="avatar" />

		<div class="chat-about">
		<c:choose>
			<c:when test="${room.masterNickname eq user.nickname }">
				<div class="chat-with">${room.userNickname}</div>
			</c:when>		
			<c:otherwise>
				<div class="chat-with">${room.masterNickname}</div>
			</c:otherwise>
		</c:choose>
			<div class="chat-num-messages">${room.post_seq }</div>
		</div>
			<input type="text" id="datepicker">
			<input type="hidden" id="post_seq" name="post_seq" value="${room.post_seq }">
			<button type="button" onclick="reserve()" id="reserve" value="예약">예약</button>
		<div id="reserveDate">
		</div>
		<form action="compDeal.do">
			<input type="hidden" name="post_seq" value="${room.post_seq }">
			<input type="hidden" name="seller" value="${room.masterNickname }">
			<input type="hidden" name="buyer" value="${room.userNickname }">
			<button onclick="compDeal()">거래 확정하기</button>
		</form>
	</div>
	<!-- end chat-header -->

	<div class="chat-history">
		<ul  id="history">
	<c:forEach items="${chat }" var="chat">
		<c:choose>
			<c:when test="${chat.name eq user.nickname }">
				<li>
					<div class="message-data">
						<span class="message-data-name"><i class="fa fa-circle online"></i>${chat.name }</span>
							<span class="message-data-time"><fmt:formatDate value="${chat.time}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</div>
					<div class="message my-message">${chat.message }</div>
				</li>
			</c:when>
			<c:otherwise>
				<li class="clearfix" >
					<div class="message-data align-right">
						<span class="message-data-time"><fmt:formatDate value="${chat.time}" pattern="yyyy-MM-dd HH:mm:ss"/></span> &nbsp;
						&nbsp; <span class="message-data-name">${chat.name }</span> <i
							class="fa fa-circle me"></i>
					</div>
					<div class="message other-message float-right">${chat.message }</div>
				</li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
		</ul>
		<ul id="realtime">
			
		</ul>

	</div>
	<!-- end chat-history -->

	<div class="chat-message clearfix">
		<textarea name="message-to-send" id="message-to-send"
			placeholder="Type your message" rows="3"></textarea>

	</div>
	<ul>
		<li class="tempRight display-none">
			<div class="message-data">
				<span class="message-data-name"><i
					class="fa fa-circle online"></i></span> <span
					class="message-data-time"></span>
			</div>
			<div class="message my-message"></div>
		</li>
	</ul>
	<ul>
		<li class="tempLeft clearfix display-none" >
			<div class="message-data align-right">
				<span class="message-data-time"></span> &nbsp;
				&nbsp; <span class="message-data-name"></span> <i
					class="fa fa-circle me"></i>

			</div>
			<div class="message other-message float-right"></div>
		</li>
	</ul>
	
	<!-- end chat-message -->
<script>

</script>
</body>
</html>