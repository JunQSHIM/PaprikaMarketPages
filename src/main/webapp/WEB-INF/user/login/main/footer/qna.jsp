<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
<head> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>QnA</title>
<link rel="stylesheet" href="/myweb/Admin_page/admin_list/qna_list.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/WEB-INF/user/login/main/main.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/main/grid.css">
<link href="/myweb/login/main/prods.css" rel="stylesheet"
	type="text/css">
<title>Main Page</title>
<script>
$(document).ready(function(){

	$(".flip").click(function() {
		$(".panel").slideToggle("slow");
	});
	  $('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab'); 
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
	});
});
</script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/user/login/main/header/header.jsp"></jsp:include>
	</header>

	<article class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/category.jsp"></jsp:include>
	</article>
	<article class="container_12">
	<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>QnA</h1>
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
							<div class="card-body">
								<ul class="tabs">
								<c:forEach var="qCt" items="${qnaList }" varStatus="status">
									<li class="tab-link" data-tab="tab-${qCt.qna_seq }"><b>${qCt.qna_title }</b></li>
								</c:forEach>
								</ul>

							<c:forEach var="qna" items="${qnaList }">
								<div id="tab-${qna.qna_seq }" class="tab-content">
									<div>
										<c:forEach var="q" items="${qList }">
											<c:if test="${qna.qna_title eq q.qna_title}">
												<div class="flip">Q.${q.question }</div>
												<div class="panel" style="display: none;">
													<div>
													<c:forEach var="a" items="${aList }">
														<c:if test="${q.question eq a.question }">
															<div>${a.answer}</div>
														</c:if>
													</c:forEach>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</c:forEach>
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
	
	</article>
	<footer class="container_12">
		<jsp:include page="/WEB-INF/user/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>
</html></html>