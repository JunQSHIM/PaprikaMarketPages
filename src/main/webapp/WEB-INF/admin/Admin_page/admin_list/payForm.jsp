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
								<b>구매예약 대기 -> 구매예약확인 후 구매예약으로 변경</b>
								<b>구매예약 -> 구매자가 송금완료한 상태</b>
								<b>직거래 대기 -> 구매예약은 했으나 아직 직거래 약속을 잡지 않은 단계<br>
								<b>직거래 완료 -> 구매예약 후 직거래에서 판매자와 구매자 모두 동의한 상태<br>
								<b>거래 실패 -> 구매예약 후 직거래에서 거래가 성립되지 않음.
							</div>
							<div class="card-body">
							<form action="pay.mdo" method="post">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>판매자</th>
											<th>구매자</th>
											<th>판매물품 링크</th>
											<th>현황</th>
											<th>판매자 qr</th>
											<th>구매자 qr</th>
											<th>처리</th>
										</tr>
									</thead>
									<tbody id="infoData">
										<c:forEach var="payList" items="${payList }">
										<input type="hidden" name="pay_seq" value="${payList.pay_seq }">
										<tr>
											<td>
												${payList.sellerId }
												<input type="hidden" name="sellerId" value="${payList.sellerId }">
											</td>
											<td>
												${payList.buyerId }
												<input type="hidden" name="buyerId" value="${payList.buyerId }">
											</td>
											<td>
												<a href="/myweb/postDetail.do?post_seq=${payList.post_seq }">상품으로 이동</a>	
												<input type="hidden" name="post_seq" value="${payList.post_seq }">
											</td>
											<td>
											<select name="process">
												<option value="0" <c:if test="${payList.process eq 0 }"> selected="selected"</c:if>>
													구매예약 대기
												</option>
												<option value="1" <c:if test="${payList.process eq 1 }"> selected="selected"</c:if>>
													구매예약
												</option>
												<option value="2" <c:if test="${payList.process eq 2 }"> selected="selected"</c:if>>
													직거래 대기
												</option>
												<option value="3" <c:if test="${payList.process eq 3 }"> selected="selected"</c:if>>
													직거래 완료
												</option>
												<option value="4" <c:if test="${payList.process eq 4 }"> selected="selected"</c:if>>
													거래 실패
												</option>
											</select>
											</td>
											<td>
												${payList.sellerQr }
												<input type="hidden" name="selllerQr" value="${payList.sellerQr }">
											</td>
											<td>
												${payList.buyerQr }
												<input type="hidden" name="buyerQr" value="${payList.buyerQr }">
											</td>
											<td>
											<select name="status">
												<option value="1" <c:if test="${payList.status eq 1 }"> selected="selected"</c:if>>
													처리 중 
												</option> 
												<option value="2" <c:if test="${payList.status eq 2 }"> selected="selected"</c:if>>
													처리완료
												</option>
											</select>
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
								<input type="submit" value="완료">
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







