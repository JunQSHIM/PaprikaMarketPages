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
				<div id="control-main">
					<div id="title">
						<div class="img">사진</div>
						<div class="state">판매상태</div>
						<div class="product-name">상품명</div>
						<div class="price">가격</div>
						<div class="date">최근 수정일</div>
						<div class="control">관리</div>
					</div>
				<input type="hidden" id="post_seq" name="post_seq" value="${post.post_seq }">
				<c:forEach items="${ plist}" var="plist" varStatus="status">
					<div class="sell-products">
						<div class="img">
							<img src="${photo[status.index] }" alt="img" name="post_seq">
						</div>
						<div class="state"><div id="show-state">
						
						<select name="sell_status" id="select_value">
							<c:choose>
								<c:when test="${plist.status eq 0 }">
									<option value="0">판매중</option>
								</c:when>
								<c:otherwise>
									<option value="2">판매완료</option>
								</c:otherwise>
							</c:choose>
						</select>
						
						
					</div></div>
						<div class="product-name" name="post_title">${plist.post_title }</div>
						<div class="price" name="price"><fmt:formatNumber value="${plist.price }" pattern="###,###,###"/></div>
						<div class="jjim">
						
						</div>
						<div class="date" name="upload_date">${plist.upload_date } </div>
						<div class="control">
							<button id="up" onclick="location.href='upPost.do?post_seq=${plist.post_seq }'">UP</button>
							<button onclick="location.href='updatePost.do?post_seq=${plist.post_seq }'">수정</button>
							<button id="delete">삭제</button>
						</div>
					</div>
						</c:forEach>
						
				</div>
				
				
				<div class="pagingBody">
	 		<div class= "paging">
		<c:if test="${page.prev}">
			<a href="create.do?user_seq=${user.user_seq }&num=${page.startPageNum - 1}"><img alt="페이징 화살표" src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/next.svg" width="12" height="12" class="prev"></a>
			
		</c:if>
	
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			<c:if test="${select != num}">
					<a href="create.do?user_seq=${user.user_seq }&num=${num}" class="present_page">${num}</a>
				</c:if>
			<c:if test="${select == num}"><b>${num}</b>
				</c:if>
			
		</c:forEach>

		<c:if test="${page.next}">
			<a href="create.do?user_seq=${user.user_seq }&num=${page.endPageNum + 1}"><img alt="페이징 화살표" src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/next.svg" width="12" height="12"></a>
			
		</c:if>
		</div>
	</div>
				
				
			</div>
				<div id="control-main">
					<div id="title">
						<div class="img">사진</div>
						<div class="state">상태</div>
						<div class="product-name">상품명</div>
						<div class="price">가격</div>
						<div class="date">날짜</div>
					</div>

					<c:forEach var="deal" items="${doneDeal }" varStatus="status">
					<div class="sell-products">
						<div class="img">
							<img src="${dealPhoto[status.index] }" alt="img">
						</div>
						<div class="state">구매완료</div>
						<div class="product-name">${deal.post_title }</div>
						<div class="price">${deal.price }원</div>
						<div class="date"><fmt:formatDate value="${deal.deal_time }" pattern = "yyyy-MM-dd"/></div>
					</div>
					</c:forEach>
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
	
	<script type="text/javascript">
	$('#delete').on('click', function() { 
		var chk = confirm('삭제하시겠습니까?');
		var post_seq = $('#post_seq').val();
		console.log(post_seq);
		if(chk == true){
			location.href=('postDelete.do?post_seq=' +  post_seq);
			location.replave=('main.do')
			alert('삭제되었습니다.')
		} else {
			alert('취소되었습니다.')
			return false;
		}
		
	});
	$('#up').on('click', function() { 
		alert("상품을 맨 위로 올렸습니다.");
	});
	</script>
</body>
</html>