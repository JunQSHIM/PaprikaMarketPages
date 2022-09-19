<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/sellpage/sellpage.js"></script>
<link rel="stylesheet" type="text/css"
	href="/myweb/login/sellpage/sellpage.css">
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
			<div id="sell-submit">
			<jsp:include page="new.jsp"></jsp:include>
			</div>

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

				<c:forEach items="${ plist}" var="plist" varStatus="status">
					<div class="sell-products">
						<div class="img">
							<img src="${photo[status.index] }" alt="img" name="post_seq">
						</div>
						<div class="state"><div id="show-state">
						<select name="sell_status" id="select_value">
							<option value="0">판매중</option>
							<option value="1">예약중</option>
							<option value="2">판매완료</option>
						</select>
					</div></div>
						<div class="product-name" name="post_title">${plist.post_title }</div>
						<div class="price" name="price"><fmt:formatNumber value="${plist.price }" pattern="###,###,###"/></div>
						<div class="jjim">♥</div>
						<div class="date" name="create_date"><fmt:formatDate value="${plist.create_date }" pattern="yyyy-MM-dd HH:mm:ss"/> </div>
						<div class="control">
							<button onclick="location.href='updatePost.do?post_seq=${plist.post_seq }'">수정</button>
							<button onclick="location.href='postDelete.do?post_seq=${plist.post_seq }',removeCheck()" >삭제</button>
							<button>중지</button>
						</div>
					</div>
						</c:forEach>
						
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
						<div class="select">
							<input type="checkbox">
						</div>
						<div class="img">
							<img src="images/jjim_icon/santiago.png" alt="img">
						</div>
						<div class="state">판매</div>
						<div class="product-name">레고</div>
						<div class="price">700,000원</div>
						<div class="date">22-08-02</div>
					</div>

					<div class="sell-products">
						<div class="select">
							<input type="checkbox">
						</div>
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
	<script type="text/javascript">
	$(document).ready(function(){
		var value_str = document.getElementById("select_value")
		if(value_str.options[value_str.selectedIndex].text == "판매완료"){
		alert("상품 상태가 변경되었습니다.")
		}
	    });
	// 거래 상태 자바스트립트
function checkboxArr() {   
	var sellArr = [];     // 배열 초기화   
	$("input[name='sell_status']:checked").each(function(i)) {     
		sellArr.push($(this).val());  
		// 체크된 것만 값을 뽑아서 배열에 push   
		 }  
		 $.ajax({    
			url: '/payCheck.do',
			type: 'post',
			dataType: 'json',
			data: {
				valueArrTest: sellArr
				}
		});
		}
	</script>
</body>
</html>