<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>AdminLTE 3 | DataTables</title>
	<link rel="stylesheet" type="text/css" href="adminBoardContent.css">
	<script type="text/javascript">
	function boardDelete() {
		window.location.href='boarddel.mdo?board_seq=${board.board_seq}';
	}
	</script>
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
            	<!-- DB에서 불러올 게시글 내용 -->
             	<div id="content_mainForm">
					<div id="content_img">
						<img id="image" src="https://dnvefa72aowie.cloudfront.net/origin/article/202208/89E071DCFCDF8FD4E621F5027C9A82603FBF15DE3E9F7D644038831E5B750413.jpg?q=82&amp;s=300x300&amp;t=crop">
					</div>
					<div id="writer_info">
						<div id="writer">
							<div id="writer_profile_img">
								<img src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-0443429487fdc2277fc8f9dd1eca6fb8b678862f593e21222ba9f6592b99ad14.png">
							</div>
							<div id="writer_name">
								글 제목 : ${board.title }
								<div id="nickname">l</div>
								<div id="region_name">구로구 오류동</div>
							</div>
						</div>
					</div>
					<div id="content_detail">
						<p>
							 ${board.content }
						</p>
					</div>
					<div id="buttonWrap">
						<button class="deleteButton" onclick="boardDelete()">게시물 삭제</button>
					</div>
				</div>
				<!-- /.content_mainForm -->
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
    	
    </script>
</body>
</html>