<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="admin_board.js"></script>
<style>
#deleteBtn {
 border:none;
 float:right;
}
</style>
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
              
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  
                  <tr>
                  	<th><input type="checkbox" id="adminAllBtn"><button id="deleteBtn" disabled="disabled">삭제</button></th>
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
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>1</td>
                    <td>카카오톡가입</td>
                    <td>yesol_vvv</td>
                    <td>박예솔</td>
                    <td>010-1111-1111</td>
                    <td>yesol@naver.com</td>
                    <td>O</td>
                  </tr>
                  
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>2</td>
                    <td>카카오톡가입</td>
                    <td>simjunq</td>
                    <td>심준규</td>
                    <td>010-2222-2222</td>
                    <td>sim@naver.com</td>
                    <td>X</td>
                  </tr>
                  
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>3</td>
                    <td>카카오톡가입</td>
                    <td>limseangteak</td>
                    <td>임승택</td>
                    <td>010-3333-3333</td>
                    <td>lst0513@naver.com</td>
                    <td>X</td>
                  </tr>
                  
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>4</td>
                    <td>일반가입</td>
                    <td>kimyoosin</td>
                    <td>김유신</td>
                    <td>010-1234-5678</td>
                    <td>kim@naver.com</td>
                    <td>O</td>
                  </tr>
                  
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>5</td>
                    <td>일반가입</td>
                    <td>leemhong9999</td>
                    <td>임홍</td>
                    <td>010-5432-1234</td>
                    <td>leemhong@naver.com</td>
                    <td>O</td>
                  </tr>
                  
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>6</td>
                    <td>일반가입</td>
                    <td>moonki</td>
                    <td>장문기</td>
                    <td>010-9999-9999</td>
                    <td>ansrlwkd225@naver.com</td>
                    <td>O</td>
                  </tr>
                  
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>1</td>
                    <td>카카오톡가입</td>
                    <td>yesol_vvv</td>
                    <td>박예솔</td>
                    <td>010-1111-1111</td>
                    <td>yesol@naver.com</td>
                    <td>O</td>
                  </tr>
                  
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>2</td>
                    <td>카카오톡가입</td>
                    <td>simjunq</td>
                    <td>심준규</td>
                    <td>010-2222-2222</td>
                    <td>sim@naver.com</td>
                    <td>X</td>
                  </tr>
                  
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>3</td>
                    <td>카카오톡가입</td>
                    <td>limseangteak</td>
                    <td>임승택</td>
                    <td>010-3333-3333</td>
                    <td>lst0513@naver.com</td>
                    <td>X</td>
                  </tr>
                  
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>4</td>
                    <td>일반가입</td>
                    <td>kimyoosin</td>
                    <td>김유신</td>
                    <td>010-1234-5678</td>
                    <td>kim@naver.com</td>
                    <td>O</td>
                  </tr>
                  
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>5</td>
                    <td>일반가입</td>
                    <td>leemhong9999</td>
                    <td>임홍</td>
                    <td>010-5432-1234</td>
                    <td>leemhong@naver.com</td>
                    <td>O</td>
                  </tr>
                  
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>6</td>
                    <td>일반가입</td>
                    <td>moonki</td>
                    <td>장문기</td>
                    <td>010-9999-9999</td>
                    <td>ansrlwkd225@naver.com</td>
                    <td>O</td>
                  </tr>
                  
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>1</td>
                    <td>카카오톡가입</td>
                    <td>yesol_vvv</td>
                    <td>박예솔</td>
                    <td>010-1111-1111</td>
                    <td>yesol@naver.com</td>
                    <td>O</td>
                  </tr>
                  
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>2</td>
                    <td>카카오톡가입</td>
                    <td>simjunq</td>
                    <td>심준규</td>
                    <td>010-2222-2222</td>
                    <td>sim@naver.com</td>
                    <td>X</td>
                  </tr>
                  
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>3</td>
                    <td>카카오톡가입</td>
                    <td>limseangteak</td>
                    <td>임승택</td>
                    <td>010-3333-3333</td>
                    <td>lst0513@naver.com</td>
                    <td>X</td>
                  </tr>
                  
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>4</td>
                    <td>일반가입</td>
                    <td>kimyoosin</td>
                    <td>김유신</td>
                    <td>010-1234-5678</td>
                    <td>kim@naver.com</td>
                    <td>O</td>
                  </tr>
                  
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>5</td>
                    <td>일반가입</td>
                    <td>leemhong9999</td>
                    <td>임홍</td>
                    <td>010-5432-1234</td>
                    <td>leemhong@naver.com</td>
                    <td>O</td>
                  </tr>
                  
                  <tr>
                  <th><input type="checkbox" class="adminArticleBtn"></th>
                    <td>6</td>
                    <td>일반가입</td>
                    <td>moonki</td>
                    <td>장문기</td>
                    <td>010-9999-9999</td>
                    <td>ansrlwkd225@naver.com</td>
                    <td>O</td>
                  </tr>
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
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
			});
		});
	</script>
</body>
</html>