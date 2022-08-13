<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/myweb/login/js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('.trigger').click(function() {
			$('.modal-wrapper').toggleClass('open');
			$('.page-wrapper').toggleClass('blur');
			return false;
		});
	});
</script>

<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
}

.page-wrapper {
	width: 100%;
	height: 100%;
	background-size: cover;
}

.blur {
	-webkit-filter: blur(5px);
	-moz-filter: blur(5px);
	-o-filter: blur(5px);
	-ms-filter: blur(5px);
	filter: blur(5px);
}

a.btn {
	width: 150px;
	display: block;
	margin: -25px 0 0 -75px;
	padding: 1em 0;
	position: absolute;
	top: 50%;
	left: 50%;
	font: 1.125em 'Arial', sans-serif;
	font-weight: 700;
	text-align: center;
	text-decoration: none;
	color: #fff;
	border-radius: 5px;
	background: rgba(217, 67, 86, 1);
}

.modal-wrapper {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	background: #666666;
	visibility: hidden;
	opacity: 0;
	-webkit-transition: all 0.25s ease-in-out;
	-moz-transition: all 0.25s ease-in-out;
	-o-transition: all 0.25s ease-in-out;
	transition: all 0.25s ease-in-out;
}

.modal-wrapper.open {
	opacity: 1;
	visibility: visible;
}

.modal {
	width: 600px;
	height: 400px;
	display: block;
	margin: 50% 0 0 -300px;
	position: relative;
	top: 50%;
	left: 50%;
	background: #fff;
	opacity: 0;
	-webkit-transition: all 0.5s ease-in-out;
	-moz-transition: all 0.5s ease-in-out;
	-o-transition: all 0.5s ease-in-out;
	transition: all 0.5s ease-in-out;
}

.modal-wrapper.open .modal {
	margin-top: -200px;
	opacity: 1;
}

.head {
	width: 90%;
	height: 32px;
	padding: 1.5em 5%;
	overflow: hidden;
	background: #01bce5;
}

.btn-close {
	width: 32px;
	height: 32px;
	display: block;
	float: right;
}

.btn-close::before, .btn-close::after {
	content: '';
	width: 32px;
	height: 6px;
	display: block;
	background: #fff;
}

.btn-close::before {
	margin-top: 12px;
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	transform: rotate(45deg);
}

.btn-close::after {
	margin-top: -6px;
	-webkit-transform: rotate(-45deg);
	-moz-transform: rotate(-45deg);
	-o-transform: rotate(-45deg);
	transform: rotate(-45deg);
}

.content {
	padding: 5%;
}
</style>
</head>
<body>
	<div class="page-wrapper">
		<a class="btn trigger" href="javascript:;">Click Me!</a>
	</div>
	<div class="modal-wrapper">
		<div class="modal">
			<div class="head">
				<a class="btn-close trigger" href="javascript:;"></a>
			</div>
			<div class="content">안녕하세요!</div>
		</div>
	</div>
</body>
</html>