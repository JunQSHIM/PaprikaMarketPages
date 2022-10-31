<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | DataTables</title>
  <!-- DataTables -->
<link rel="stylesheet"
	href="/myweb/Admin_page/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="/myweb/Admin_page/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
 <link rel="stylesheet" type="text/css" href="/myweb/Admin_page/admin_board/admin_board.css">
<script type="text/javascript" src="/myweb/Admin_page/admin_board/admin_board.js"></script>
</head>
<body class="hold-transition sidebar-mini">

  <!-- Content Wrapper. Contains page content -->
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>회원가입 SMS/카카오톡</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">paprika</a></li>
              <li class="breadcrumb-item active">회원가입 SMS</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
        	
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">회원가입 SMS</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              <select id="textMsg" name="textMsg">
               <option disabled selected>전송문자선택</option>
              	<option value="1">회원가입 문자</option>
              	<option value="2">이용정지 문자</option>
              	<option value="3">경고 문자</option>
              </select>
              <button type="submit" id="msgBtn">전송</button>
               <button type="submit" id="deleteBtn" disabled="disabled">삭제</button>
               <button type="submit" id="registerBtn">등록</button>
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                  	<th><input type="checkbox" id="adminAllBtn"></th>
                    <th>회원번호</th>
                    <th>회원가입유형</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                    <th>수신동의</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="user" items="${sms }">
                  <c:set var="join_type" value="${user.join_type }"/>
                  	<c:choose>
                  		<c:when test="${user.join_type == 1 }">
                  			 <c:set var="join_type" value="카카오톡 가입"></c:set>
                  		</c:when>
                  		<c:when test="${user.join_type == 0 }">
                  			 <c:set var="join_type" value="일반 가입"></c:set>
                  		</c:when>
                 	</c:choose>
                 	<c:choose>
                  		<c:when test="${user.msg_agree == 1 }">
                  			 <c:set var="msg_agree" value="O"></c:set>
                  		</c:when>
                  		<c:when test="${user.msg_agree == 0 }">
                  			 <c:set var="msg_agree" value="X"></c:set>
                  		</c:when>
                 	</c:choose>
         	      <c:if test="${user.user_type eq 0 }">
         	      <c:if test="${user.msg_agree eq 1 }">
					  <tr>
						  <td><input type="checkbox" name="checkMsg" class="adminArticleBtn"></td>
						  <td>${user.user_seq }</td>
						  <td>${join_type }</td>
						  <td>${user.id }</td>
						  <td>${user.name }</td>
						  <td>${user.phone }</td>
						  <td>${user.email }</td>
					   	  <td>${msg_agree }</td>
				 	  </tr>
				  </c:if>
				  </c:if>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
<script>
	$("#msgBtn").click(function(){ 
		var textMsg = document.getElementById("textMsg").options.selectedIndex;
		var rowData = new Array();
		var info = new Array();
		var checkbox = $("input[name=checkMsg]:checked");
		// 체크된 체크박스 값을 가져온다
		checkbox.each(function(i) {
			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			// 체크된 row의 모든 값을 배열에 담는다.
			rowData.push(tr.text());
			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var user_seq = td.eq(1).text();
			var join_type = td.eq(2).text();
			var id = td.eq(3).text();
			var name = td.eq(4).text();
			var phone = td.eq(5).text();
			var email = td.eq(6).text();
			var msg_agree = td.eq(7).text();
			
			// 가져온 값을 배열에 담는다.
			info.push(user_seq);
			info.push(join_type);
			info.push(id);
			info.push(name);
			info.push(phone);
			info.push(email);
			info.push(msg_agree);
			info.push(textMsg);
			
			$.ajax({
				url : "/myweb/sendMsg.mdo",
				type : "post",
				data : {
					info:info
				},
				success : function(data){ 
					console.log(info);
					if(data==1){
						alert("문자 전송이 완료되었습니다.");
						location.reload();
					}
				},
				error : function() { 
					alert("error");
				}
			});
		});
	});
</script>
</body>
</html>