<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type='BUTTON' value=" 창닫기" onclick="reload()">
<script type="text/javascript">
function reload(){
	window.opener.location.reload();
	self.close();
}
</script>
</body>
</html>