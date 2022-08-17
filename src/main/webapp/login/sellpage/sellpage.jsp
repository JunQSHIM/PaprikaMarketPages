<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/sellpage/sellpage.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/sellpage/sellpage.css">
<meta charset="UTF-8">
<title>Sell page</title>
</head>
<body>
			<div id="sell">
				<div id="sell-menu">
					<button id="submit">상품 등록</button>
					<button id="control">상품 관리</button>
					<button id="list">구매/판매 내역</button>
				</div>

				<div id="sell-main">
					<div id="sell-control">
						<div id="control-head">
							<div id="sell-search">
								<input type="text" placeholder="search" /> <i
									class="fa fa-search"></i>
							</div>
	
							<div id="show-count">
								<select name="count" id="count">
									<option value="5">5개씩</option>
									<option value="10">10개씩</option>
								</select>
							</div>
	
							<div id="show-state">
								<select name="count" id="count">
									<option value="#">전체</option>
									<option value="#">판매중</option>
									<option value="#">예약중</option>
									<option value="#">판매완료</option>
									<option value="#">판매대기</option>
								</select>
							</div>
						</div>
						<div id="control-main">
							<div id="title">
								<div class="img">사진</div>
								<div class="state">판매상태</div>
								<div class="product-name">상품명</div>
								<div class="price">가격</div>
								<div class="jjim">찜</div>
								<div class="date">최근 수정일</div>
								<div class="control">관리</div>
							</div>
	
							<div class="sell-products">
								<div class="img">
									<img src="images/jjim_icon/santiago.png" alt="img">
								</div>
								<div class="state">판매 완료</div>
								<div class="product-name">레고</div>
								<div class="price">700,000원</div>
								<div class="jjim">♥</div>
								<div class="date">22-08-02</div>
								<div class="control">
									<button>수정</button>
									<button>삭제</button>
									<button>중지</button>
								</div>
							</div>
	
							<div class="sell-products">
								<div class="img">
									<img src="images/jjim_icon/travis.png" alt="img">
								</div>
								<div class="state">판매 중</div>
								<div class="product-name">신발</div>
								<div class="price">1700,000원</div>
								<div class="jjim">♥</div>
								<div class="date">22-08-02</div>
								<div class="control">
									<button>수정</button>
									<button>삭제</button>
									<button>중지</button>
								</div>
							</div>
						</div>
					</div>
					<div id="sell-list">
						<div id="control-head">
							<div id="sell-search">
								<input type="text" placeholder="search" /> <i
									class="fa fa-search"></i>
							</div>
	
							<div id="show-count">
								<select name="count" id="count">
									<option value="5">5개씩</option>
									<option value="10">10개씩</option>
								</select>
							</div>
	
							<div id="show-state">
								<select name="count" id="count">
									<option value="#">전체</option>
									<option value="#">판매</option>
									<option value="#">구매</option>
								</select>
							</div>
						</div>
						<div id="control-main">
							<div id="title">
								<div class="select">선택</div>
								<div class="img">사진</div>
								<div class="state">상태</div>
								<div class="product-name">상품명</div>
								<div class="price">가격</div>
								<div class="date">날짜</div>
							</div>
	
							<div class="sell-products">
								<div class="select"><input type="checkbox"></div>
								<div class="img">
									<img src="images/jjim_icon/santiago.png" alt="img">
								</div>
								<div class="state">판매</div>
								<div class="product-name">레고</div>
								<div class="price">700,000원</div>
								<div class="date">22-08-02</div>
							</div>
	
							<div class="sell-products">
								<div class="select"><input type="checkbox"></div>
								<div class="img">
									<img src="images/jjim_icon/travis.png" alt="img">
								</div>
								<div class="state">구매</div>
								<div class="product-name">신발</div>
								<div class="price">1700,000원</div>
								<div class="date">22-08-02</div>
							</div>
						</div>
					</div>
					
					</div>
				</div>
</body>
</html>