<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script src="/myweb/login/main/main.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/product&purchase/ctProduct.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/product&purchase/product_detail.css">
<link rel="stylesheet" type="text/css" href="/myweb/login/singo/modal.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Main Page</title>

</head>
<body>
   <header>
      <jsp:include page="/WEB-INF/user/login/main/header/header.jsp"></jsp:include>
   </header>
   <article class="container_12">
      <jsp:include page="/WEB-INF/user/login/main/category.jsp"></jsp:include>
      
   </article>
   <article class="container_12">

            <div id="productPage">
         <div id="productList">
            홈 > 
            <select onchange="if(this.value) location.href=(this.value);" name="category_seq">
               <option selected disabled>카테고리</option>
               <option value="category.do?category_seq=1">디지털기기</option>
               <option value="category.do?category_seq=2">가구/인테리어</option>
               <option value="category.do?category_seq=3">유아동/유아도서</option>
               <option value="category.do?category_seq=4">생활/가공식품</option>
               <option value="category.do?category_seq=5">스포츠/레저</option>
               <option value="category.do?category_seq=6">여성잡화</option>
               <option value="category.do?category_seq=7">여성의류</option>
               <option value="category.do?category_seq=8">남성패션/잡화</option>
               <option value="category.do?category_seq=9">게임/취미</option>
               <option value="category.do?category_seq=10">뷰티/미용</option>
               <option value="category.do?category_seq=11">반려동물용품</option>
               <option value="category.do?category_seq=12">도서/티켓/음반</option>
               <option value="category.do?category_seq=13">기타 중고물품</option>
               <option value="category.do?category_seq=14">삽니다</option>
            </select>
         </div>
         </div>
         <div class="detailContent">
         <input type="hidden" id="user_seq" name="user_seq" value="${user.user_seq }">
         <input type="hidden" id="post_seq" name="post_seq" value="${post.post_seq }">

            <div class="grid_4 item" id="picture">
            <div class="cTZOqF">
               <div class="kjooeF">
                  <div class="lgWppt">
                     <c:forEach items="${name }" var="photo" varStatus="status">
                        <img src="${status.current}" id="image" class="cGrdGT">
                     </c:forEach>
                  </div>   
               </div>
            </div>
            <div class="zoomBtn">
               <button type="button" onclick = "zoom()">+확대</button>
            </div>
            </div>
               <div class="prod_info">
               <div class="item" id="detail" style="border-bottom: 1px solid rgb(238, 238, 238)">
                  <div id="title">${post.post_title }</div>
                  <div class="post_price"><div class="postPrice"><fmt:formatNumber value="${post.price }" pattern="###,###,###"/><span>원</span></div>
                  <c:choose>
                           <c:when test="${post.pay_check == 1 }">
                              <img src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/kakao.png" width="100" height="50" alt="페이 가능">
                           </c:when>
                                 <c:when test="${post.pay_check == 0 }">
                                    <img src="/myweb/login/images/jjim_icon/pay.svg" style="visibility: hidden;" alt="페이 가능">
                                 </c:when>
                        </c:choose>
                  </div>
                  
               </div>
               <div class="item">
               <div class="etc"><div class="etc_items"><img alt="상품 상태 아이콘" src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/heart.png" width="16" height="16">${allLike }</div><div class="etc_items"><img alt="상품 상태 아이콘" src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/eye.png" width="21" height="13">${post.cnt}</div><div class="etc_items"><img alt="상품 상태 아이콘" src="https://paprikamarket.s3.ap-northeast-2.amazonaws.com/post/clock.png" width="16" height="16">${post.upload_date}</div>
               <c:choose>
                <c:when test="${post.user_seq ne user.user_seq}">
                   <c:if test="${report == 1 }">
                        <div class="etc_items"><button class="openBtn">신고하기</button></div>
                     </c:if>
                     <c:if test="${report == 0 }">
                        <div class="etc_items" style="color:red;">신고완료</div>
                     </c:if>
                </c:when>
                <c:when test="${post.user_seq eq user.user_seq}">
                   <div class="etc_items"><button class="openBtn" style="visibility: hidden;">신고하기</button></div>
                </c:when>
             </c:choose>
               </div>
               
               </div>
                  <div class="ipQCCP" id="info">
                  <div class="prod_status">
                     <div class="prod_status_2">
                        상품상태
                     </div>
                     <c:choose>
                     <c:when test="${post.prod_status == 0 }">
                     <div class="prod_status_3">중고</div>
                     </c:when>
                     <c:when test="${post.prod_status == 1 }">
                     <div class="prod_status_3">새상품</div>
                     </c:when>
                     </c:choose>
                  </div>
                  <div class="prod_status">
                     <div class="prod_status_2">
                        거래지역1
                     </div>
                     <div class="prod_status_3">${post.location1 }</div>
                  </div>
                  <c:choose>
                  <c:when test="${empty post.location2 }">
                  <div class="prod_status">
                 
                     <div class="prod_status_2">
                        거래지역2
                     </div>
                     <div class="prod_status_3">설정안함</div>
                  </div>    
                  </c:when>
                  <c:when test="${not empty post.location2 }">
                  <div class="prod_status" >
                 
                     <div class="prod_status_2">
                        거래지역2
                     </div>
                     <div class="prod_status_3">${post.location2 }</div>
                  </div>    
                  </c:when>
                  </c:choose>                    
                  </div>
                 
               <div class="item_btn" id="func">
               <c:choose>
                <c:when test="${post.user_seq ne user.user_seq}">
                <c:choose>
                  <c:when test="${like ==0}">
                     <button type="button" id="likebtn">찜</button>
                     <input type="hidden" id="likecheck" value="${like }">
                  </c:when>               
                  <c:when test="${like ==1}">
                     <button type="button" id="likebtn" class="">♥찜</button>
                     <input type="hidden" id="likecheck" value="${like }">
                  </c:when>
               </c:choose>         
                  <button onclick="document.getElementById('chat').submit()">연락하기</button>
	                  <form action="/myweb/createChat.cdo" id="chat" method="post">
	                  	<input type="hidden" name="post_seq" value="${post.post_seq }">
	                  	<input type="hidden" name="userNickName" value="${user.nickname }">
	                  	<input type="hidden" name="post_user_seq" value="${post.user_seq }">
	                  </form>
               <c:choose>
               <c:when test="${post.pay_check == 1}">
                  <button onclick="showPopUp(); add_pay_notice();" >바로구매</button>
               </c:when>
               <c:when test="${post.pay_check == 0 }">
                     <button onclick="" style="visibility: hidden;">바로구매</button>
               </c:when>
            </c:choose>
            </c:when>
         </c:choose>
               </div>
               <div class="item_btn" id="func">
            <c:choose>
                <c:when test="${post.user_seq eq user.user_seq}">
               <a  class="myStoreBtn" href="myProductCart.do?user_seq=${user.user_seq}">내 상품 관리</a>
               </c:when>
         </c:choose>
               </div>
            </div>
            </div>
            <div class="clear"></div>
            <div class="grid_12 item2">
               연관상품
               <div id="rt_product">
                   <div class="slider">
                   <div><img src="/myweb/login/images/1.png" title="1st"></div>
                   <div><img src="/myweb/login/images/2.png" title="2nd"></div>
                   <div><img src="/myweb/login/images/3.png" title="3rd"></div>
                   <div><img src="/myweb/login/images/4.png" title="4th"></div>
                   <div><img src="/myweb/login/images/5.png" title="5th"></div>
                   <div><img src="/myweb/login/images/5.png" title="1st"></div>
                   <div><img src="/myweb/login/images/4.png" title="1st"></div>
                   <div><img src="/myweb/login/images/3.png" title="1st"></div>
                   <div><img src="/myweb/login/images/2.png" title="1st"></div>
                   <div><img src="/myweb/login/images/1.png" title="1st"></div>
                  </div>
            </div>
            
           <div class="empty"></div>
               <div class="detail_body">
                  <div class="detail_body_2">
                     <div class="detail_body_3" id="product_info">
                     <div id= "post_content">상품정보</div>
                     <div id="product_desc">
                        ${post.post_content}
                     </div>
                  </div>
               </div>
               <div class="grid_3 market_info">
                     <div class="item">상점정보<hr style="border:1px solid gray;">
                     <div id="profile_pic">
                        <img src="/myweb/login/images/dklogo.png">
                     </div>
                     <div id="nickname">
                        ${post.nickname}
                     </div>
                     <div id="follow">
                     <c:if test="${ post.user_seq == null }">
                        <button onclick="quit()">상점가기</button>
                     </c:if>
                      <c:if test="${post.user_seq != null }">
                        <button onclick="location.href='myProductCart.do'">상점가기</button>
                     </c:if>
                     </div>
                     <div id="rt_img">
                        <div class="slider2">
                            <div><img src="/myweb/login/images/test1.png" title="1st"></div>
                            <div><img src="/myweb/login/images/test2.png" title="2nd"></div>
                            <div><img src="/myweb/login/images/test3.png" title="3rd"></div>                            
                            <div><img src="/myweb/login/images/test4.png" title="4th"></div>
                            <div><img src="/myweb/login/images/test5.png" title="5th"></div>                                                        
                        </div>
                  </div>
                  <div class="item">후기<hr style="border:1px solid gray;">
                  	<c:forEach items="${manner }" var="manner" begin="0" end="1" step="1">
                     <div class="review_container">
                     
                      <a class="review_scores" href="#">
                      	<div class="review_score">
                      	${manner.nickname} 
                      		<c:if test="${manner.manner_temp == 1 }">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
									</c:if>
									<c:if test="${manner.manner_temp == 2 }">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
									</c:if>
									<c:if test="${manner.manner_temp == 3 }">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
									</c:if>
									<c:if test="${manner.manner_temp == 4 }">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
									</c:if>
									<c:if test="${manner.manner_temp == 5 }">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
										<img src="/myweb/login/images/jjim_icon/score.png" width="15" height="14" alt="별">
									</c:if>
                      	</div>
                      </a>
                      
                        <div style="background-color: rgb(0,0,0,0.08)"> ${manner.manner_review } </div>
                     </div>
                        <hr style="border: 1px solid rgb(0,0,0,0.07);">
                  </c:forEach>
                     
                     <div id="more_reivews"><button onclick="location.href='reviewProductView.do?user_seq=${post.user_seq}'">후기더보기</button></div>
                  </div>
               </div>
            </div>
         
               </div>
               </div>
      <%@ include file="/WEB-INF/user/login/singo/singo.jsp" %>
   </article>
   <div style="margin-bottom:40px;"></div>
   <footer class="container_12">
      <jsp:include page="/WEB-INF/user/login/main/footer/footer1.jsp"></jsp:include>
   </footer>
</body>
<script type="text/javascript" src="/myweb/login/product&purchase/product_detail.js"></script>

</html></html>