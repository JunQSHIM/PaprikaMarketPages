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
            <h1>이메일 발송</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">paprika</a></li>
              <li class="breadcrumb-item active">메일 보내기</li>
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
                <h3 class="card-title">단체 메일 발송</h3>
                	<input id="msgText" type="text" name="msgText">
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              <button type="submit" id="deleteBtn" disabled="disabled" >전송</button>
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                  	<th><input type="checkbox" id="adminAllBtn"></th>
                    <th>회원번호</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="user" items="${list }">
					  <tr>
						  <td><input type="checkbox" name="checkMsg" class="adminArticleBtn"></td>
						  <td>${user.user_seq }</td>
						  <td>${user.id }</td>
						  <td>${user.name }</td>
						  <td>${user.phone }</td>
						  <td>${user.email }</td>
				 	  </tr>
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
$("#deleteBtn").click(function(){
	        var checkbox = $("input[name='checkMsg']:checked");
	        var jarr = [];
	        var msgText = document.getElementById("msgText").value;
	        $(checkbox).each(function(i){
	            var tr = checkbox.parent().parent().eq(i);
	            var td = tr.children();
	            
	            
	            var email = td.eq(5).text(); //0번째부터 시작이므로 마지막 줄의 td의 값
	            
	            jarr.push(email); //배열에 email을 담는다.
	        });
	        
	        if(jarr.length >= 1){//json형태 data를 컨트롤러로 넘긴다.
	            $.ajax({
	                url: "/myweb/sendEmail.mdo",
	                type: "post",
	                data: {
	                    "jarr": jarr,
						"msgText":msgText
	                },
	                success: function(val){
	                    if(val>=1){
	                        alert("메일 발송이 완료되었습니다.");
	                        location.href="/adminEmail.mdo";
	                    }
	                }
	            })
	        }
	    }); //tchProveBtn
</script>
</body>
</html>