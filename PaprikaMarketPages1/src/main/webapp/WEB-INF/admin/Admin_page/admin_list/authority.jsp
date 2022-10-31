<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 수정</title>
<script>
function goToEdit(){
	 window.location.href ='/myweb/editAdmin.mdo';
}
function goToAdd(){
	 window.location.href ='/myweb/giveAdmin.mdo';
}
</script>
</head>
<body>
<section class="content-header">
     <div class="container-fluid">
       <div class="row mb-2">
         <div class="col-sm-6">
           <h1>관리자 수정</h1>
         </div>
         <div class="col-sm-6">
           <ol class="breadcrumb float-sm-right">
             <li class="breadcrumb-item"><a href="main.mdo">paprika</a></li>
             <li class="breadcrumb-item"><a href="adminList.mdo"></a>관리자 목록</li>
             <li class="breadcrumb-item active">관리자 수정</li>
           </ol>
         </div>
       </div>
     </div>
</section>

<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <div class="card">
			<div class="card-header">
				<b>Super Admin(수퍼 관리자, 최고 관리자)</b>–사이트 네트워크관리 기능과 모든 기능에 접근 가능<br>
				<b>Administrator(관리자)</b>–단일 사이트 내의 모든 관리 기능에 접근가능<br>
				<b>Editor(편집자)</b>–글(다른 사용자 글 포함)을 게시/관리할 수 있는 사용자
				<div style="float:right;">
					<button onclick="goToEdit()">수정</button>
					<button onclick="goToAdd()">신규등록</button>
				</div>
			</div>			        
        
        
			<div class="card-body">
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
							<td><fmt:formatNumber minIntegerDigits="3" type="number" value="${status.index +1 }"/>a</td>
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
        </div>
      </div>
    </div>
  </div>
</section>				
</body>
</html>