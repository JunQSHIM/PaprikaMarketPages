<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | DataTables</title>
</head>
<body>
		<!-- Main content -->
		<section class="content">
		<h1>관리자 목록</h1>
			<div class="container-fluid">
				<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>이름</th>
											<th>사번</th>
											<th>아이디</th>
											<th>이메일</th>
											<th>전화번호</th>
											<th>생년월일</th>
											<th>닉네임</th>
											<th>직급</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="admin" items="${adminList }" varStatus="status">
										<tr>
											<td>${admin.name }</td>
											<td><fmt:formatNumber minIntegerDigits="3" type="number" value="${status.index +1 }"/></td>
											<td>${admin.id }</td>
											<td>${admin.email }</td>
											<td>${admin.phone }</td>
											<td><fmt:formatDate value="${admin.birth}" pattern="yyyy-MM-dd"/></td>
											<td>${admin.nickname }</td>
											<td>ADMIN</td>
										</tr>
										</c:forEach>	
									</tbody>
								</table>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
</body>
</html>







