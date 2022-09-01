<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>search</title>
<link rel="stylesheet" type="text/css" href="/myweb/login/searchpage/searchpage.css">
</head>
<body>
<c:set value="code" var="${param.category_code }"></c:set>
<div class="searchPage">
	
	<div class="category_head">
		<div class="category_head_wrapper">
			<div class="category_title">카테고리</div>
		</div>
	</div>
	<div class="category_tab">
		<div class="category_btns">			
				<div>
					<a class="category_part" href="search.jsp?category_code=A">
						<div class="category_name">여성의류${param.category_code}</div>
						<div class="category_count">8만+ ${category_found }</div>
					</a>
				</div>
				<div>
					<a class="category_part" href="search.jsp?category_code=B">
						<div class="category_name">남성의류${param.category_code }</div>
						<div class="category_count">8만+ ${category_found }</div>
					</a>
				</div>
				<div>
					<a class="category_part">
						<div class="category_name">여성의류${category.list }</div>
						<div class="category_count">8만+ ${category_found }</div>
					</a>
				</div>
				<div>
					<a class="category_part">
						<div class="category_name">여성의류${category.list }</div>
						<div class="category_count">8만+ ${category_found }</div>
					</a>
				</div>
				<div>
					<a class="category_part">
						<div class="category_name">여성의류${category.list }</div>
						<div class="category_count">8만+ ${category_found }</div>
					</a>
				</div>
				<div>
					<a class="category_part">
						<div class="category_name">여성의류${category.list }</div>
						<div class="category_count">8만+ ${category_found }</div>
					</a>
				</div>
				<div>
					<a class="category_part">
						<div class="category_name">여성의류${category.list }</div>
						<div class="category_count">8만+ ${category_found }</div>
					</a>
				</div>
				<div>
					<a class="category_part">
						<div class="category_name">여성의류${category.list }</div>
						<div class="category_count">8만+ ${category_found }</div>
					</a>
				</div>
				<div>
					<a class="category_part">
						<div class="category_name">여성의류${category.list }</div>
						<div class="category_count">8만+ ${category_found }</div>
					</a>
				</div>
				
			</div>
	</div>
	
	<div class="search_head_div">
		<div class="search_head">
			<div class="search_result">
				<span class="text_search">${search_text }하하</span>의 검색 결과 <span class="search_count">${sear_result_count}123개</span>
			</div>
			<div class="array_part">
				<a class="array select"> 최신순 </a>
				<a class="array">인기순 </a>
				<a class="array"> 저가순 </a> 
				<a class="array"> 고가순 </a>
			</div>
		</div>
	</div>
	
	<div class="search_all_window">
		<div class="window_wrapper">
			<div class="search_window">
				<a class="search_part">
					<div class="sell_image">
						<img src="./images/jjim_icon/anya.jpg" width="194" height="194">
						<span class="image_span"> <img src="./images/jjim_icon/pay.svg" alt="페이 가능"></span>
					</div>
					<div class="sell_product_detail">
						<div class="sell_product_title">스파이 패밀리-아냐</div>
						<div class="sell_product_price">
							<div class="sell_product_price_1">150,000</div>
							<div class="sell_product_time">
								<span>8시간 전</span>
							</div>
						</div>
					</div>
					<div class="sell_location">
						<img src="./images/jjim_icon/location.png" width="15" height="17"
							alt="위치"> 전국
					</div>
				</a>
			</div>
			
			<div class="search_window">
				<a class="search_part">
					<div class="sell_image">
						<img src="./images/jjim_icon/anya.jpg" width="194" height="194">
						<span class="image_span"> <img src="./images/jjim_icon/pay.svg" alt="페이 가능"></span>
					</div>
					<div class="sell_product_detail">
						<div class="sell_product_title">스파이 패밀리-아냐</div>
						<div class="sell_product_price">
							<div class="sell_product_price_1">150,000</div>
							<div class="sell_product_time">
								<span>8시간 전</span>
							</div>
						</div>
					</div>
					<div class="sell_location">
						<img src="./images/jjim_icon/location.png" width="15" height="17"
							alt="위치"> 전국
					</div>
				</a>
			</div>
		</div>
	</div>
	<div class="page_space">
		<div class="page">
			<a class="page_number last"><</a>
			<a class="page_number active">1</a>
			<a class="page_number">2</a>
			<a class="page_number">3</a>
			<a class="page_number">4</a>
			<a class="page_number">5</a>
			<a class="page_number">6</a>
			<a class="page_number">7</a>
			<a class="page_number">8</a>
			<a class="page_number">9</a>
			<a class="page_number">10</a>
			<a class="page_number">></a>
		</div>
	</div>
	</div>
</body>
</html>