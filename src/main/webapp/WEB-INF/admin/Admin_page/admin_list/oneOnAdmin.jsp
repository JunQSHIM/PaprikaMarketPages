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
           <h1>1:1 문의</h1>
         </div>
         <div class="col-sm-6">
           <ol class="breadcrumb float-sm-right">
             <li class="breadcrumb-item"><a href="main.mdo">paprika</a></li>
             <li class="breadcrumb-item">1:1문의</li>
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
							<th>아이디</th>
							<th>회원번호</th>
							<th>닉네임</th>
							<th>이메일</th>
							<th>문의 내용</th>
							<th>문의날짜</th>
							<th>처리상태</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${one }" var="one">
						<tr>
							<td>${one.id }</td>
						<td>${one.user_seq }</td>
						<td>${one.nickname }</td>
						<td><a href="mailto:${one.email }?subject= [파프리카마켓] [${one.nickname }]님이 문의하신 내용에 대한 답변입니다.&amp;body=[${one.nickname }]님, 저희 파프리카 마켓에 문의해주셔서 감사합니다.">${one.email }</a></td>
						<td>${one.content }</td>
						<td><fmt:formatDate value="${one.create_date }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
							<td>
							<select id="selectBox"onchange="myFunction(this.value)">
							<option value="처리중" selected="selected" >처리중</option>
							<option value="처리완료">처리완료</option>
							</select>
							 </td>
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

<script type="text/javascript">
function myFunction(str){
	alert(str);
}

</script>
</body>
</html>