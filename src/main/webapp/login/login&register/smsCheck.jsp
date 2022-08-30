<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
String sms = request.getParameter("sms");
String[] testSms = {"aaa","bbb","ccc"};
int cnt = 0;
for(int i=0; i<testSms.length; i++){
	if(sms.equals(testSms[i])){
		cnt = 1;
	}
}
out.println(cnt);
%>