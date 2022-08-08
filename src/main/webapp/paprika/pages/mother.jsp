<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mother</title>
<%
	String p = request.getParameter("product");
%>
</head>
<body>

	<%@include file="../parts/mothertop.jsp"%>

	<!-- 이 사이에 원하는 내용을 코딩하세요 -->
	<%@include file="../parts/slider.jsp"%>
	<!-- 메인페이지에서 카테고리를 고르면 카테고리 목록과 추천상품이 나옴 -->
	<!-- product값이 없다면 이목록이 안뜸 -->
	<c:choose>
		<c:when test="${param.product ne null}">
			<div id="productList">
			홈 > 
			<select onchange="if(this.value) location.href=(this.value);">
				<option selected disabled>카테고리</option>
				<option value="mother.jsp?product=디지털기기">디지털기기</option>
				<option value="mother.jsp?product=생활가전">생활가전</option>
				<option value="mother.jsp?product=가구/인테리어">가구/인테리어</option>
				<option value="mother.jsp?product=유아동">유아동</option>
				<option value="mother.jsp?product=유아도서">유아도서</option>
				<option value="mother.jsp?product=생활/가공식품">생활/가공식품</option>
				<option value="mother.jsp?product=스포츠/레저">스포츠/레저</option>
				<option value="mother.jsp?product=여성잡화">여성잡화</option>
				<option value="mother.jsp?product=여성의류">여성의류</option>
				<option value="mother.jsp?product=남성패션/잡화">남성패션/잡화</option>
				<option value="mother.jsp?product=게임/취미">게임/취미</option>
				<option value="mother.jsp?product=뷰티/미용">뷰티/미용</option>
				<option value="mother.jsp?product=반려동물용품">반려동물용품</option>
				<option value="mother.jsp?product=도서/티켓/음반">도서/티켓/음반</option>
				<option value="mother.jsp?product=식물">식물</option>
				<option value="mother.jsp?product=기타 중고물품">기타 중고물품</option>
				<option value="mother.jsp?product=삽니다">삽니다</option>
			</select>
		</div>
	<font color="red"><%=p %></font>의 추천상품
		</c:when>
	</c:choose>
	<%@include file="../parts/prods.jsp"%>
	<!-- 이 사이에 원하는 내용을 코딩하세요 -->


	<%@include file="../parts/motherbottom.jsp"%>
</body>
</html>