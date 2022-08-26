<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | DataTables</title>
 <link rel="stylesheet" type="text/css" href="comment_manage.css">
<script type="text/javascript" src="admin_board.js"></script>

</head>
<body class="hold-transition sidebar-mini">

 
  <!-- Content Wrapper. Contains page content -->
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>게시물 관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">paprika</a></li>
              <li class="breadcrumb-item"><a href="#">컨텐츠 관리</a></li>
              <li class="breadcrumb-item"><a href="#">게시판</a></li>
              <li class="breadcrumb-item active">게시물 관리</li>
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
                <h3 class="card-title">전체 게시물 <div id="total_comment">18</div></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              
              <button type="submit" id="deleteBtn" disabled="disabled">삭제</button>
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
					<tr>
						<th><input type="checkbox" id="adminAllBtn"></th>
						<th>글 번호</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>지역</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				 </thead>
				 <tbody>
					<tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>1</td>
						<td>동네 정보</td>
						<td><a href="adminBoardContent.jsp">안녕하세요</a></td>
						<td>심준규</td>
						<td>마계 인천</td>
						<td>2022.08.24</td>
						<td>4</td>
					</tr>
					<tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>2</td>
						<td>QnA</td>
						<td>인간뽀삐 권범준이라고 합니다</td>
						<td>권범준</td>
						<td>구미</td>
						<td>2022.08.24</td>
						<td>12</td>
					</tr>
					<tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>3</td>
						<td>동네정보</td>
						<td>유신아 생일 축하한다</td>
						<td>강승현</td>
						<td>서울</td>
						<td>2022.08.15</td>
						<td>15</td>
					</tr>
					<tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>1</td>
						<td>동네 정보</td>
						<td>안녕하세요</td>
						<td>심준규</td>
						<td>마계 인천</td>
						<td>2022.08.24</td>
						<td>4</td>
					</tr>
					<tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>2</td>
						<td>QnA</td>
						<td>인간뽀삐 권범준이라고 합니다</td>
						<td>권범준</td>
						<td>구미</td>
						<td>2022.08.24</td>
						<td>12</td>
					</tr>
					<tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>3</td>
						<td>동네정보</td>
						<td>유신아 생일 축하한다</td>
						<td>강승현</td>
						<td>서울</td>
						<td>2022.08.15</td>
						<td>15</td>
					</tr><tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>1</td>
						<td>동네 정보</td>
						<td>안녕하세요</td>
						<td>심준규</td>
						<td>마계 인천</td>
						<td>2022.08.24</td>
						<td>4</td>
					</tr>
					<tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>2</td>
						<td>QnA</td>
						<td>인간뽀삐 권범준이라고 합니다</td>
						<td>권범준</td>
						<td>구미</td>
						<td>2022.08.24</td>
						<td>12</td>
					</tr>
					<tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>3</td>
						<td>동네정보</td>
						<td>유신아 생일 축하한다</td>
						<td>강승현</td>
						<td>서울</td>
						<td>2022.08.15</td>
						<td>15</td>
					</tr><tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>1</td>
						<td>동네 정보</td>
						<td>안녕하세요</td>
						<td>심준규</td>
						<td>마계 인천</td>
						<td>2022.08.24</td>
						<td>4</td>
					</tr>
					<tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>2</td>
						<td>QnA</td>
						<td>인간뽀삐 권범준이라고 합니다</td>
						<td>권범준</td>
						<td>구미</td>
						<td>2022.08.24</td>
						<td>12</td>
					</tr>
					<tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>3</td>
						<td>동네정보</td>
						<td>유신아 생일 축하한다</td>
						<td>강승현</td>
						<td>서울</td>
						<td>2022.08.15</td>
						<td>15</td>
					</tr><tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>1</td>
						<td>동네 정보</td>
						<td>안녕하세요</td>
						<td>심준규</td>
						<td>마계 인천</td>
						<td>2022.08.24</td>
						<td>4</td>
					</tr>
					<tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>2</td>
						<td>QnA</td>
						<td>인간뽀삐 권범준이라고 합니다</td>
						<td>권범준</td>
						<td>구미</td>
						<td>2022.08.24</td>
						<td>12</td>
					</tr>
					<tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>3</td>
						<td>동네정보</td>
						<td>유신아 생일 축하한다</td>
						<td>강승현</td>
						<td>서울</td>
						<td>2022.08.15</td>
						<td>15</td>
					</tr><tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>1</td>
						<td>동네 정보</td>
						<td>안녕하세요</td>
						<td>심준규</td>
						<td>마계 인천</td>
						<td>2022.08.24</td>
						<td>4</td>
					</tr>
					<tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>2</td>
						<td>QnA</td>
						<td>인간뽀삐 권범준이라고 합니다</td>
						<td>권범준</td>
						<td>구미</td>
						<td>2022.08.24</td>
						<td>12</td>
					</tr>
					<tr>
						<th><input type="checkbox" class="adminArticleBtn"></th>
						<td>3</td>
						<td>동네정보</td>
						<td>유신아 생일 축하한다</td>
						<td>강승현</td>
						<td>서울</td>
						<td>2022.08.15</td>
						<td>15</td>
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
						"buttons" : [ "print", "colvis" ]
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