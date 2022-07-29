<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:requestEncoding value="utf-8" />
<c:set value="${param.id }" var="id" />
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery-3.6.0.min.js"></script>

<script>
 $(document).ready(function(){
 	$(".c").click(function(){
		var id = $(this).find(".chatid").text();
 		$("#chatcontent").load("/testWeb/chat/chatcontent.jsp?id="+ id);
 	})
 })
</script>
<title>My Chat</title>
<link rel="stylesheet" type="text/css" href="mychat.css">
</head>
<body>
	<div id="chat">
		<div id="chatlist">
			<table>
				<tr class="c">
					<td>
						<div>
							<div class=chatid>임승택</div>
							<div>
								<div class=content>안녕하세요</div>
								<div class=chatcount>123</div>
							</div>
						</div>
					</td>
				</tr>
				<tr class="c">
					<td>
						<div>
							<div class=chatid>손오공</div>
							<div>
								<div class=content>안녕하세요</div>
								<div class=chatcount>13</div>
							</div>
						</div>
					</td>
				</tr>
					
			</table>
		</div>

		<div id="chatcontent"></div>
	</div>
	
</body>
</html>