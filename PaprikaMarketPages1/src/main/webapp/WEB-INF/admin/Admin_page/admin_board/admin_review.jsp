<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 목록</title>
</head>
<body>
<section class="content-header">
     <div class="container-fluid">
       <div class="row mb-2">
         <div class="col-sm-6">
           <h1>상품후기 목록</h1>
         </div>
         <div class="col-sm-6">
           <ol class="breadcrumb float-sm-right">
             <li class="breadcrumb-item"><a href="main.mdo">paprika</a></li>
             <li class="breadcrumb-item">상품후기 리스트</li>
           </ol>
         </div>
       </div>
     </div>
</section>

<!-- Main content -->
<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-body">
          	<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>후기 준 회원</th>
							<th>후기 제품</th>
							<th>후기 내용</th>
							<th>후기 받은 날짜</th>
							<th>후기관리</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${review }" var="review">
						<tr>
							<td>${ review.nickname}</td>
							<td>${review.post_title }</td>
							<td>${review.manner_review }</td>
							<td> <fmt:formatDate value="${review.upload_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td><button>삭제</button></td>
							
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