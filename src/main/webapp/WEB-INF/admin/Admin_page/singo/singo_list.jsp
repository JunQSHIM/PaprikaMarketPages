<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table id="example1" class="table table-bordered table-hover">
	<thead>
		<tr>
			<th>신고일</th>
			<th>신고 위치?</th>
			<th>신고자</th>
			<th>피신고자</th>
			<th>진행상태</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="singo" items="${review }">
			<c:choose>
				<c:when test="${singo.state == 0 }">
					<c:set var="state" value="처리완료"></c:set>
				</c:when>
				<c:when test="${singo.state == 1 }">
					<c:set var="state" value="처리중"></c:set>
				</c:when>
			</c:choose>
			<tr class="singo_btn">
				<td>${singo.report_date }</td>
				<td>${singo.type }</td>
				<td class="singo_id">${singo.user_id }</td>
				<td class="suspect_id">${singo.user_singo_id }</td>
				<td>${state }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>