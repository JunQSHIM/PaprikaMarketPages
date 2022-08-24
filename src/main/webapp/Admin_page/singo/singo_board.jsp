<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DataTable</title>
<!-- DataTables -->
<link rel="stylesheet" href="/myweb/Admin_page/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="/myweb/Admin_page/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="singo.js"></script>




<script type="text/javascript" src="singo.js"></script>
<script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
</head>
<body>

	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>게시판 신고 내역</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">DataTables</li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<section class="content">
		<div class="container-fluid">
			<div class="card">
			<div class="buttons"><button>블라인드</button><button>삭제</button></div>
				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th><input type="checkbox" id="adminAllBtn"></th>
							<th>카테고리?</th>
							<th>제목</th>
							<th>아이디</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>신고내역</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th><input type="checkbox" class="adminArticleBtn"></th>
							<td>자유게시판</td>
							<td>안녕하세요</td>
							<td>yesol_vvv</td>
							<td>박예솔</td>
							<td>22-08-24</td>
							<td><button>신고내용</button></td>
						</tr>

						<tr>
							<th><input type="checkbox" class="adminArticleBtn"></th>
							<td>자유게시판</td>
							<td>안녕</td>
							<td>simjunq</td>
							<td>심준규</td>
							<td>22-08-24</td>
							<td><button>신고내용</button></td>
						</tr>
						<tr>
							<th><input type="checkbox" class="adminArticleBtn"></th>
							<td>자유게시판</td>
							<td>안녕하세요</td>
							<td>yesol_vvv</td>
							<td>박예솔</td>
							<td>22-08-24</td>
							<td><button>신고내용</button></td>
						</tr>

						<tr>
							<th><input type="checkbox" class="adminArticleBtn"></th>
							<td>자유게시판</td>
							<td>안녕</td>
							<td>simjunq</td>
							<td>심준규</td>
							<td>22-08-24</td>
							<td><button>신고내용</button></td>
						</tr>
						<tr>
							<th><input type="checkbox" class="adminArticleBtn"></th>
							<td>자유게시판</td>
							<td>안녕하세요</td>
							<td>yesol_vvv</td>
							<td>박예솔</td>
							<td>22-08-24</td>
							<td><button>신고내용</button></td>
						</tr>

						<tr>
							<th><input type="checkbox" class="adminArticleBtn"></th>
							<td>자유게시판</td>
							<td>안녕</td>
							<td>simjunq</td>
							<td>심준규</td>
							<td>22-08-24</td>
							<td><button>신고내용</button></td>
						</tr>
						<tr>
							<th><input type="checkbox" class="adminArticleBtn"></th>
							<td>자유게시판</td>
							<td>안녕하세요</td>
							<td>yesol_vvv</td>
							<td>박예솔</td>
							<td>22-08-24</td>
							<td><button>신고내용</button></td>
						</tr>

						<tr>
							<th><input type="checkbox" class="adminArticleBtn"></th>
							<td>자유게시판</td>
							<td>안녕</td>
							<td>simjunq</td>
							<td>심준규</td>
							<td>22-08-24</td>
							<td><button>신고내용</button></td>
						</tr>
						<tr>
							<th><input type="checkbox" class="adminArticleBtn"></th>
							<td>자유게시판</td>
							<td>안녕하세요</td>
							<td>yesol_vvv</td>
							<td>박예솔</td>
							<td>22-08-24</td>
							<td><button>신고내용</button></td>
						</tr>

						<tr>
							<th><input type="checkbox" class="adminArticleBtn"></th>
							<td>자유게시판</td>
							<td>안녕</td>
							<td>simjunq</td>
							<td>심준규</td>
							<td>22-08-24</td>
							<td><button>신고내용</button></td>
						</tr>
						<tr>
							<th><input type="checkbox" class="adminArticleBtn"></th>
							<td>자유게시판</td>
							<td>안녕하세요</td>
							<td>yesol_vvv</td>
							<td>박예솔</td>
							<td>22-08-24</td>
							<td><button>신고내용</button></td>
						</tr>

						<tr>
							<th><input type="checkbox" class="adminArticleBtn"></th>
							<td>자유게시판</td>
							<td>안녕</td>
							<td>simjunq</td>
							<td>심준규</td>
							<td>22-08-24</td>
							<td><button>신고내용</button></td>
						</tr>
						<tr>
							<th><input type="checkbox" class="adminArticleBtn"></th>
							<td>자유게시판</td>
							<td>안녕하세요</td>
							<td>yesol_vvv</td>
							<td>박예솔</td>
							<td>22-08-24</td>
							<td><button>신고내용</button></td>
						</tr>

						<tr>
							<th><input type="checkbox" class="adminArticleBtn"></th>
							<td>자유게시판</td>
							<td>안녕</td>
							<td>simjunq</td>
							<td>심준규</td>
							<td>22-08-24</td>
							<td><button>신고내용</button></td>
						</tr>
						<tr>
							<th><input type="checkbox" class="adminArticleBtn"></th>
							<td>자유게시판</td>
							<td>안녕하세요</td>
							<td>yesol_vvv</td>
							<td>박예솔</td>
							<td>22-08-24</td>
							<td><button>신고내용</button></td>
						</tr>

						<tr>
							<th><input type="checkbox" class="adminArticleBtn"></th>
							<td>자유게시판</td>
							<td>안녕</td>
							<td>simjunq</td>
							<td>심준규</td>
							<td>22-08-24</td>
							<td><button>신고내용</button></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>

</body>
<script>

		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
		});
</script>
	<!-- DataTables  & Plugins -->
	<script	src="/myweb/Admin_page/plugins/datatables/jquery.dataTables.min.js"></script>
	<script	src="/myweb/Admin_page/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script	src="/myweb/Admin_page/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script	src="/myweb/Admin_page/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script	src="/myweb/Admin_page/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script	src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script	src="/myweb/Admin_page/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
</html>

