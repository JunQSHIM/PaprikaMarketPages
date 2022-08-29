<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<% request.setCharacterEncoding("UTF-8");%>
<%
	String password = request.getParameter("password");
	String repassword = request.getParameter("repassword");
	String message = "";
	if(!password.equals(repassword)){
		message="비밀번호가 같지 않습니다.";
	}
	out.println(message);
%>