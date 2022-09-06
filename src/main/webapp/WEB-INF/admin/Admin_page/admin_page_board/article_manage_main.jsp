<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body class="hold-transition sidebar-mini">

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
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				 </thead>
				 <tbody>
                   <c:forEach var="board" items="${board }">
						<tr>
							<th><input type="checkbox" class="adminArticleBtn"></th>
							<td>${board.board_seq}</td>
							<td><a href="adminBoardContent.jsp">${board.title }</a></td>
							<td>${board.user_id }</td>
							<td>${board.upload_date }</td>
							<td>${board.cnt }</td>
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
