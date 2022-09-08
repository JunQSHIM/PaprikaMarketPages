<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/header/css/category.css">
<script src="/myweb/login/main/header/js/category.js"></script>
<head>
<meta charset="UTF-8">
<title>category</title>
</head>
<body>
	<div id="categories">
		<form action="main.do" name="category">
			<ul id="result1">
				<li><button onclick="ctProduct()" name="category_seq" 
						value="1">
						<img src="/myweb/login/images/ct_icon/digital.png" />디지털기기/가전
					</button>
				<li><button onclick="ctProduct()" name="category_seq"
						value="2">
						<img src="/myweb/login/images/ct_icon/interior.png" />가구/인테리어
					</button>
				<li><button onclick="ctProduct()" name="category_seq"
						value="3">
						<img src="/myweb/login/images/ct_icon/baby.png" />유아동/유아도서
					</button>
				<li><button onclick="ctProduct()" name="category_seq"
						value="4">
						<img src="/myweb/login/images/ct_icon/life.png" />생활/가공식품
					</button>
				<li><button onclick="ctProduct()" name="category_seq"
						value="5">
						<img src="/myweb/login/images/ct_icon/sport.png" />스포츠/레저
					</button>
				<li><button onclick="ctProduct()" name="category_seq"
						value="6">
						<img src="/myweb/login/images/ct_icon/waccessories.png" />여성잡화
					</button>
				<li><button onclick="ctProduct()" name="category_seq"
						value="7">
						<img src="/myweb/login/images/ct_icon/wclothes.png" />여성의류
					</button>
				<li><button onclick="ctProduct()" name="category_seq"
						value="8">
						<img src="/myweb/login/images/ct_icon/mclothes.png" />남성패션/잡화
					</button>
				<li><button onclick="ctProduct()" name="category_seq"
						value="9">
						<img src="/myweb/login/images/ct_icon/game.png" />게임/취미
					</button>
				<li><button onclick="ctProduct()" name="category_seq"
						value="10">
						<img src="/myweb/login/images/ct_icon/beauty.png" />뷰티/미용
					</button>
				<li><button onclick="ctProduct()" name="category_seq"
						value="11">
						<img src="/myweb/login/images/ct_icon/pet.png" />반려동물용품
					</button>
				<li><button onclick="ctProduct()" name="category_seq"
						value="12">
						<img src="/myweb/login/images/ct_icon/ticket.png" />도서/티켓/음반
					</button>
				<li><button onclick="ctProduct()" name="category_seq"
						value="13">
						<img src="/myweb/login/images/ct_icon/etc.png" />기타 중고물품
					</button>
				<li><button onclick="ctProduct()" name="category_seq"
						value="14">
						<img src="/myweb/login/images/ct_icon/buyproduct.png" />삽니다
					</button>
					
			</ul>
		</form>
	</div>
</body>
</html>