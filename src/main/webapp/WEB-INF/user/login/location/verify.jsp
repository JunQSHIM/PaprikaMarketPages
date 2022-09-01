<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<script src="/myweb/login/main/main.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=167f49bd1993ff6f8e2356ea7658392c&libraries=services""></script>
<link rel="stylesheet" type="text/css" href="/myweb/login/main/main.css">
<link href="/myweb/login/location/verify.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Main Page</title>
<%
	String p = request.getParameter("product");
%>
</head>
<body>
	<header>
		<jsp:include page="/login/main/header/header.jsp"></jsp:include>
	</header>
	
	<article class="container_12">
		<jsp:include page="/login/main/category.jsp"></jsp:include>
	</article>
	<article class="container_12">
		<h3>내 동네 설정</h3>
		<hr style="border:1px solid orange;">
		<div id="map" style="width:500px;height:400px;float: left;">
		<script>
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			function locationLoadSuccess(pos){
			    // 현재 위치 받아오기
			    var currentPos = new kakao.maps.LatLng(pos.coords.latitude,pos.coords.longitude);
			    // 지도 이동(기존 위치와 가깝다면 부드럽게 이동)
			    map.panTo(currentPos);
			    // 마커 생성
			    var marker = new kakao.maps.Marker({
			        position: currentPos
			    });
			    // 기존에 마커가 있다면 제거
			    marker.setMap(null);
			    marker.setMap(map);
			    
				lat = pos.coords.latitude;
				lng = pos.coords.longitude;
				getAddr(lat,lng);
			};
			function locationLoadError(pos){
			    alert('위치 정보를 가져오는데 실패했습니다.');
			};
			var lat = 37.5566803113882;
			var lng = 126.904501286522;
			// 위치 가져오기 버튼 클릭시
			function getCurrentPosBtn(){
			    navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
			};
			var geocoder = new kakao.maps.services.Geocoder();

			function getAddr(lat,lng){
			    var coord = new kakao.maps.LatLng(lat, lng);
			    var callback = function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			            console.log(result[0].address.address_name);
			            var location = result[0].address.address_name;
			            const loc = location.split(" ");
			            $("#loc1").append("<label for='myHome'><input type='checkbox' id='myHome' name='location1' value='"+loc[2]+"'/>"+loc[2]+"</label>");
			        }
			    }
			    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			    document.getElementById("nearLoc").innerHTML = "";
			    $("#loc1").listView("refresh"); 
			}
			
			function nearAddr(){
				var std = 0.03;
				for(var i=0; i<6; i++){
					var lat1 = lat;
					var lng1 = lng;
					if(i<2){
						lat1 = lat+std;
					}else if(i<4){
						lng1 = lng+std;
					}else{
						lat1 = lat+std;
						lng1 = lng+std;
					}	
					getAddr2(lat1,lng1);
					std = std*(-1);
				}
			}

			function getAddr2(lat,lng){
			    var coord = new kakao.maps.LatLng(lat, lng);
			    var callback = function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			            console.log(result);
			            var location = result[0].address.address_name;
			            const loc = location.split(" ");
			            $("#loc2").append("<input type='radio' name='location2' value='"+loc[2]+"'>"+loc[2]+"<br>");
			        }
			    }
			    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			}
		</script>
		</div>
		<div id="locations">
			<form action="location.do" method="post">
			<c:choose>
				<c:when test="${kakaoUser.id ne null}">
					<input type="hidden" name="id" value="${kakaoUser.id }">
					<input type="hidden" name="join_type" value="1">
				</c:when>
				<c:otherwise>
					<input type="hidden" name="id" value="${user.id }">
					<input type="hidden" name="join_type" value="0">
				</c:otherwise>
			</c:choose>
			<div id="loc1">
					<button type="button" class="btn btn-lg btn-primary" id="getMyPositionBtn" onclick="getCurrentPosBtn()">우리동네보기(현재위치가 선택됩니다.)</button>
					<div id="loc">
						
					</div>
				</div>
				<div id="loc2">
					<button type="button" class="btn btn-lg btn-primary" id="getNearLocationBtn" onclick="nearAddr()">주변동네보기(1개만 선택해 주십시오.)</button>
					<div id="nearLoc"></div>
				</div>
				<button>sub</button>
			</form>
		</div>
		</article>
	<footer class="container_12">
		<jsp:include page="/login/main/footer/footer1.jsp"></jsp:include>
	</footer>
</body>
</html>