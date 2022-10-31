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
<section class="content-header">
     <div class="container-fluid">
       <div class="row mb-2">
         <div class="col-sm-6">
           <h1>상품 상세</h1>
         </div>
         <div class="col-sm-6">
           <ol class="breadcrumb float-sm-right">
             <li class="breadcrumb-item"><a href="main.mdo">paprika</a></li>
             <li class="breadcrumb-item">상품 목록</li>
             <li class="breadcrumb-item active">상품 상세</li>
           </ol>
         </div>
       </div>
     </div>
</section>

   <article class="container_12">

         <div class="detailContent">
         <input type="hidden" id="user_seq" name="user_seq" value="${user.user_seq }">
         <input type="hidden" id="post_seq" name="post_seq" value="${post.post_seq }">

            <div class="grid_4 item" id="picture">
            <div class="cTZOqF" style="margin-left: 400px;">
               <div class="kjooeF">
                  <div class="lgWppt">
                     <c:forEach items="${name }" var="photo" varStatus="status">
                        <img src="${status.current}" id="image" class="cGrdGT">
                     </c:forEach>
                  </div>   
               </div>
            </div>
            </div>
               <div class="prod_info" style="margin-right: 400px;">
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
                <button type="submit" id="cancel" onclick="">삭제</button>
               </div>
            </div>
            </div>
	</article>
   <div style="margin-bottom:40px;"></div>

</body>
<script type="text/javascript" src="/myweb/login/product&purchase/product_detail.js"></script>
<script type="text/javascript">

$('#cancel').on('click', function() { 
	var chk = confirm('삭제하시겠습니까?');
	var post_seq = $('#post_seq').val();
	if(chk == true){
		location.href=('adminPostDelete.mdo?post_seq=' + post_seq);
		alert('삭제되었습니다.')
	} else {
		alert('취소되었습니다.')
		return false;
	}
	
});

</script>
</html>