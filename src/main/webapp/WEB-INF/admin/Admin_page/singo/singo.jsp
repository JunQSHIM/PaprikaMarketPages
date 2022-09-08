<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>신고 관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item" id="home">신고 리스트</li>
						<li class="breadcrumb-item active" id="tree">신고 내용</li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">

					<div class="card" id="singo_list">
						<div class="card-header">
							<h3 class="card-title">신고 리스트</h3>
						</div>
						<div class="card-body">
							<table id="example1" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>신고일</th>
										<th>신고 위치?</th>
										<th>신고자</th>
										<th>피신고자</th>
										<th>진행상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="singo" items="${review }">
										<c:choose>
											<c:when test="${singo.state == 0 }">
												<c:set var="state" value="처리완료"></c:set>
											</c:when>
											<c:when test="${singo.state == 1 }">
												<c:set var="state" value="처리중"></c:set>
											</c:when>
										</c:choose>
										<tr class="singo_btn">
											<td>${singo.report_date }</td>
											<td>${singo.type }</td>
											<td class="singo_id">${singo.user_id }</td>
											<td class="suspect_id">${singo.user_singo_id }</td>
											<td>${state }
												<c:choose>
													<c:when test="${singo.review_seq == 0 }">
														<c:set var="pagenum" value="삭제된 페이지 입니다."/>
														<c:set var="pageContent" value="삭제된 페이지 입니다."/>
													</c:when>
													<c:when test="${singo.review_seq != 0 }">
														<c:set var="pagenum" value="${singo.review_seq }"/>
														<c:set var="pageContent" value="${singo.review_content }"/>
													</c:when>
												</c:choose>
												<p class="page_seq hide">${pagenum }</p>
												<p class="page_content hide">${pageContent }</p>
												<p class="content hide">${singo.report_content }</p>
												
											</td>
										</tr>
									</c:forEach>
									<c:forEach var="singo" items="${board }">
										<c:choose>
											<c:when test="${singo.state == 0 }">
												<c:set var="state" value="처리완료"></c:set>
											</c:when>
											<c:when test="${singo.state == 1 }">
												<c:set var="state" value="처리중"></c:set>
											</c:when>
										</c:choose>
										<tr class="singo_btn">
											<td>${singo.report_date }</td>
											<td>${singo.type }</td>
											<td class="singo_id">${singo.user_id }</td>
											<td class="suspect_id">${singo.user_singo_id }</td>
											<td>${state }
												<c:choose>
													<c:when test="${singo.board_seq == 0 }">
														<c:set var="pagenum" value="삭제된 페이지 입니다."/>
														<c:set var="pageContent" value="삭제된 페이지 입니다."/>
													</c:when>
													<c:when test="${singo.board_seq != 0 }">
														<c:set var="pagenum" value="${singo.board_seq }"/>
														<c:set var="pageContent" value="${singo.board_content }"/>
													</c:when>
												</c:choose>
												<p class="page_seq hide">${pagenum }</p>
												<p class="page_content hide">${pageContent }</p>
												<p class="content hide">${singo.report_content }</p>
												
											</td>
										</tr>
									</c:forEach>
									<c:forEach var="singo" items="${post }">
										<c:choose>
											<c:when test="${singo.state == 0 }">
												<c:set var="state" value="처리완료"></c:set>
											</c:when>
											<c:when test="${singo.state == 1 }">
												<c:set var="state" value="처리중"></c:set>
											</c:when>
										</c:choose>
										<tr class="singo_btn">
											<td>${singo.report_date }</td>
											<td>${singo.type }</td>
											<td class="singo_id">${singo.user_id }</td>
											<td class="suspect_id">${singo.user_singo_id }</td>
											<td>${state }
												<c:choose>
													<c:when test="${singo.post_seq == 0 }">
														<c:set var="pagenum" value="삭제된 페이지 입니다."/>
														<c:set var="pageContent" value="삭제된 페이지 입니다."/>
													</c:when>
													<c:when test="${singo.post_seq != 0 }">
														<c:set var="pagenum" value="${singo.post_seq }"/>
														<c:set var="pageContent" value="${singo.post_content }"/>
													</c:when>
												</c:choose>
												<p class="page_seq hide">${pagenum }</p>
												<p class="page_content hide">${pageContent }</p>
												<p class="content hide">${singo.report_content }</p>
												
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>


					<div id="singo_card">
						<div class="card" id="singo_control">
							<div class="card-header">
								<h3 class="card-title">신고된 페이지</h3>
							</div>
							<div class="card-body">
								<div class="con">
									<p id="suspect_id">피신고자</p>
									<p id="singo_page"></p>
									<p id="singo_seq" class="hide"></p>
									</div>
								<div class="btns">
									<button>블라인드</button>
									<button id="deleteBtn">삭제</button>
								</div>
							</div>
						</div>


						<div class="card" id="singo_control">
							<div class="card-header">
								<h3 class="card-title">신고 내용</h3>
							</div>
							<div class="card-body">
								<p id="singo_id">신고자</p>
								<p id="singo_content">신고내용</p>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
<script>

$("#deleteBtn").click(function(){
	location.replace('deleteSingoPage.mdo?singo_page='+ page);
});
</script>