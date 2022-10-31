<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<script>
function request(){
	var qna_title = $("#qnaList").val();
	$.ajax({
		url: "/myweb/qList.mdo",
		type: "POST", 
		data: {
			qna_title : qna_title
		},
		success : function(data){
			$(data).each(function(){
				console.log(this.q_seq + " " + this.question + " ");
                $('#qList').append("<option value='"+this.question+"'>"+this.question+"</option>")
				});
			},
			error:function(request, status, error){

				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			}

	}); 
}
function requestA(){
	var question = $("#qList").val();
	$.ajax({
		url: "/myweb/aList.mdo",
		type: "POST", 
		data: {
			question : question
		},
		success : function(data){
			$(data).each(function(){
				console.log(this.a_seq + " " + this.answer + " ");
                $('#aList').append("<option value='"+this.answer+"'>"+this.answer+"</option>")
				});
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}

	}); 
}
</script>
</head>
<body>
<form action="updateQPopUpConfirm.mdo" method="post">
	<select id="qnaList" name="qna_title" onchange="request()">
	<c:forEach var="qnaList" items="${qnaList }">
		<option value="${qnaList.qna_title }">${qnaList.qna_title }</option>
	</c:forEach>
	</select>
	<select id="qList" name="question" onchange="requestA()">
		<option value="질문을 선택해주세요">질문을 선택해주세요</option>
	</select>
	<select id="aList" name="answer">
		<option value="답변을 선택해주세요">답변을 선택해주세요</option>
	</select>
	<input type="submit" value="전송">
</form>
</body>
</html>