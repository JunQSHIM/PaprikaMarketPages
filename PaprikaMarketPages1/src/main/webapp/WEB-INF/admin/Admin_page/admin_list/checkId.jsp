<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:choose>
	<c:when test="${newAdmin ne null}">
	<tr>
		<td>${newAdmin.name }</td>
		<td>${newAdmin.id }</td>
		<td>${newAdmin.email }</td>
		<td>${newAdmin.phone }</td>
		<td><fmt:formatDate value="${newAdmin.birth}" pattern="yyyy-MM-dd" /></td>
		<td>${newAdmin.nickname }</td>
		<td><select name="role">
				<option value="Super Admin">SuperAdmin</option>
				<option value="Administrator">Administrator</option>
				<option value="Editor">Editor</option>
		</select></td>
	</tr>
	</c:when>
	<c:otherwise>
	<tr>
		<td colspan="7">일치하는 회원이 없습니다.</td>
	</tr>
	</c:otherwise>
</c:choose>

