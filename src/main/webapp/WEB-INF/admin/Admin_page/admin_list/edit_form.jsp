<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<title>관리자 추가</title>
</head>
<body>
<section class="content-header">
     <div class="container-fluid">
       <div class="row mb-2">
         <div class="col-sm-6">
           <h1>관리자 목록</h1>
         </div>
         <div class="col-sm-6">
           <ol class="breadcrumb float-sm-right">
             <li class="breadcrumb-item"><a href="#">paprika</a></li>
             <li class="breadcrumb-item"><a href="#">관리자 업무</a></li>
             <li class="breadcrumb-item active">관리자 수정</li>
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
          	<form action="editAdmin.mdo" method="post">
	   			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
								<td>${admin.id }<input type="hidden" name="id" value="${admin.id}"></td>
								<td>${admin.email }</td>
								<td>${admin.phone }</td>
								<td><fmt:formatDate value="${admin.birth}" pattern="yyyy-MM-dd"/></td>
								<td>${admin.nickname }</td>
								<td>
									<c:choose>
										<c:when test="${admin.user_type == 3 }">
											SUPER_ADMIN
										</c:when>
										<c:when test="${admin.user_type == 2 }">
											<select name="stat">
												<option >Super Admin</option>
												<option selected>Admin</option>
												<option>Editor</option>
												<option value="delete">해제</option>
											</select>
										</c:when>
										<c:when test="${admin.user_type == 1 }">
											<select name="stat">
												<option>Super Admin</option>
												<option>Admin</option>
												<option selected>Editor</option>
												<option value="delete">해제</option>
											</select>
										</c:when>
									</c:choose>
								</td>
							</tr>
							</c:forEach>	
						</tbody>
					</table>
				<input type="submit" value="확인">
			</form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
		
</body>
</html>