<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String testId = "aaa";
String name = "";
String num = "";
String password = "";
String email = "";
String phone = "";
String birth = "";
String nickname = "";
String[] info = new String[8];
if (id.equals(testId)) {
	name = "유신";
	num = "00006";
	password = "111111";
	email = "uusssin@gmail.com";
	phone = "010-1234-1234";
	birth = "1999-09-09";
	nickname = "BusanMan";
	info[0] = name;
	info[1] = num;
	info[2] = id;
	info[3] = password;
	info[4] = email;
	info[5] = phone;
	info[6] = birth;
	info[7] = nickname;
%>
	<tr>
		<td><%=name%></td>
		<td><%=num%></td>
		<td><%=id%></td>
		<td><%=password%></td>
		<td><%=email%></td>
		<td><%=phone%></td>
		<td><%=birth%></td>
		<td><%=nickname%></td>
		<td><select name="role">
				<option value="Super Admin">SuperAdmin</option>
				<option value="Administrator">Administrator</option>
				<option value="Editor">Editor</option></select></td>
	</tr>	
<% }else{%>
	<tr>
		<td colspan="9">가입된 아이디가 없습니다.</td>
	</tr>
<%} %>

