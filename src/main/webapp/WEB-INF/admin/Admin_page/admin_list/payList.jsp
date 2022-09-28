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
function payForm(){
	location.href = "/myweb/payForm.mdo";
}
</script>
</head>
<body>
<!-- Content Wrapper. Contains page content -->
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>파프리카페이</h1>
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
							<div class="card-header">
								<b>구매예약 대기 -> 구매예약확인 후 구매예약으로 변경</b><br>
								<b>구매예약 -> 구매자가 송금완료한 상태</b><br>
								<b>직거래 대기 -> 구매예약은 했으나 아직 직거래 약속을 잡지 않은 단계</b><br>
								<b>직거래 완료 -> 구매예약 후 직거래에서 판매자와 구매자 모두 동의한 상태</b><br>
								<b>거래 실패 -> 구매예약 후 직거래에서 거래가 성립되지 않음.</b>
							</div>
							<div class="card-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>판매자(카카오톡이름)</th>
											<th>구매자(카카오톡이름)</th>
											<th>판매물품 링크</th>
											<th>현황</th>
											<th>판매자 qr</th>
											<th>구매자 qr</th>
											<th>처리</th>
										</tr>
									</thead>
									<tbody id="infoData">
										<c:forEach var="payList" items="${payList }">
										<tr>
											<td>${payList.sellerId }(${payList.sellerKID })</td>
											<td>${payList.buyerId }(${payList.buyerKID })</td>
											<td><a href="adminPostDetail.mdo?post_seq=${payList.post_seq }" target="_blank">상품으로 이동</a></td>
											<td>
											<c:choose>
												<c:when test="${payList.process eq 0}">
													구매예약 대기
												</c:when>
												<c:when test="${payList.process eq 1}">
													구매예약
												</c:when>
												<c:when test="${payList.process eq 2}">
													직거래 대기
												</c:when>
												<c:when test="${payList.process eq 3}">
													직거래 완료
												</c:when>
												<c:when test="${payList.process eq 4}">
													거래 실패
												</c:when>
											</c:choose>
											</td>
											<td>${payList.sellerQr }</td>
											<td>${payList.buyerQr }</td>
											<td><c:choose>
												<c:when test="${payList.status eq 1 }">
													처리중
												</c:when>
												<c:otherwise>
													처리완료
												</c:otherwise>
											</c:choose></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
								<button onclick="payForm()">수정</button>
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







