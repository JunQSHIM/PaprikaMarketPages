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
<title>AdminLTE 3 | DataTables</title>
<script>
function editComp(){
	document.getElementById('edit').submit();
}
function goToAdd(){
	 window.location.href ='/myweb/giveAdmin.mdo';
}
var name1 = "";
$(document).ready(function(){
	$('#submit').click(function(){   //submit 버튼을 클릭하였을 때
		let sendData = "id="+$('input[name=id]').val();
		$.ajax({
			type:'post',   //post 방식으로 전송
			url:'checkId.mdo',   //데이터를 주고받을 파일 주소
			data:sendData,   //위의 변수에 담긴 데이터를 전송해준다.
			success : function(data){ 
				if(data!=null){
					console.log(data.name);
					if(data.name == null){
						$('#infoData').append("<tr><td colspan='6'>일치하는 회원이없습니다.</td></tr>");
					}else{
						$('#infoData').append('<tr>');
						$('#infoData').append('<td>'+data.name+'</td>');
						$('#infoData').append('<td>'+data.id+'</td>')
						$('#infoData').append('<td>'+data.email+'</td>')
						$('#infoData').append('<td>'+data.phone+'</td>')
						$('#infoData').append('<td>'+data.nickname+'</td></tr>')
						$('#infoData').append("<td><select name='role'><option value='Super Admin'>SuperAdmin</option><option value='Administrator'>Administrator</option><option value='Editor'>Editor</option></select></td></tr>")	
					}
				}
			}
		});
	});
});
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) { xhr.setRequestHeader(header, token); });
</script>
</head>
<body>
<!-- Content Wrapper. Contains page content -->
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>관리자목록</h1>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<!-- /.card-header -->
							<div class="card-body">
							<form action="giveAdmin.mdo" method="post">
			    			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>아이디 입력 후 확인을 눌러주십시오.</th>
										</tr>
										<tr>
											<td>
												<input type="text" id="id" name="id">
												<input type="button" id="submit" value="입력">
											</td>
										</tr>
										<tr>
											<th>이름</th>
											<th>아이디</th>
											<th>이메일</th>
											<th>전화번호</th>
											<th>닉네임</th>
											<th>직급</th>
										</tr>
									</thead>
									<tbody id="infoData">
									</tbody>
								</table>
								<input type="submit" value="등록">
								</form>
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
</body>
</html>