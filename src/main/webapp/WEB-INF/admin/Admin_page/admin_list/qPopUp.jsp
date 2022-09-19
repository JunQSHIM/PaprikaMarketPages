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
</head>
<body>
<script>
const add_textbox = () => {
    const box = document.getElementById("a");
    const newP = document.createElement('p');
    newP.innerHTML = "<input type='text' name='answer' placeholder='답변을 입력해주세요.'> <input type='button' value='삭제' onclick='remove(this)'>";
    box.appendChild(newP);
}
const remove = (obj) => {
    document.getElementById('a').removeChild(obj.parentNode);
}
</script>
<form action="qPopUp.mdo" method="post" name="qnaAdd">
	<select id="qnaList" name="qna_title" onchange="request()">
	<c:forEach var="qnaList" items="${qnaList }">
		<option value="${qnaList.qna_title }">${qnaList.qna_title }</option>
	</c:forEach>
	</select>
	<div id="q"><input type="text" name="question" placeholder="질문을 입력해주세요."></div>
	<div id="a"><input type="text" name="answer" placeholder="답변을 입력해주세요."></div>
	<input type="button" value="추가" onclick="add_textbox()">
	<input type="submit" value="전송">
</form>
</body>
</html>