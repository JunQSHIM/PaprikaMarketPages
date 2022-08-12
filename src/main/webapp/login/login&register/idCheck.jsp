<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
String id = request.getParameter("id");
String[] testIds = {"aaa","bbb","ccc"};
int cnt = 0;
for(int i=0; i<testIds.length; i++){
	if(id.equals(testIds[i])){
		cnt = 1;
	}
}
out.println(cnt);
%>