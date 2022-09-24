	function ctProduct(){
		theForm.submit();
	}
	$(document).ready(function(){
		$("#showCategory").mouseenter(function(){
			$("#result1").show();
		});
		$("#category").mouseleave(function(){
			$("#result1").hide();
		});
		
		$("#top").click(function() {
			// $('html, body').animate({scrollTop:0}, '1000');
			$('html, body').scrollTop(0);
		});
		
	});
	
	 $(document).ready(function(){
	        $('.lgWppt').bxSlider({
	        	auto:false,
	            infiniteLoop:false,
	            controls:false     
	        });
	      });
	
	$(document).ready(function(){
		$('.slider').bxSlider({
				auto:false,
				pager:false,
		        mode:'horizontal',
		        infiniteLoop:false,
		        minSlides: 1,
		        maxSlides: 5,
		        slideWidth:270,
		        slideMargin: 0,
		        controls:false 
	    });
		$('.slider2').bxSlider({
			auto:false,
			pager:false,
	        mode:'horizontal',
	        infiniteLoop:false,
	        minSlides: 1,
	        maxSlides: 2,
	        slideWidth:155,
	        slideMargin: 0,
	        controls:false 
    });
    });
	function login()  {
		 window.location.href ='/login.do';
	}
	function quit()  {
		 alert("탈퇴한 회원입니다.")
	}	
	function register()  {
		 window.location.href ='/register.do';
	}
	function main(){
		window.location.href = '/main.do';
	}
	function mypage(){
		window.location.href = '/mypage.do';
	}
	function zoom(){
		$("#image").style.width = "800px";
	}
	function zoom(url){
		var image = document.getElementById("image");
		var source = image.src;
	    window.open(source,'new','width=800, height=600, scrollbars=yes');
	} 
	
	
	var post_seq = document.getElementById("post_seq").value;

	$('#likebtn').click(function(){
		likeupdate();
	});
	
	function likeupdate(){
	$.ajax({
		url : "/myweb/likeupdate.do",
		type : 'post',
		data : {user_seq : Number($('#user_seq').val()),
			post_seq : Number($('#post_seq').val()),
			count : Number($('#likecheck').val())},
		success : function(result){
			console.log("수정" + result.result);
			if(Number($('#likecheck').val()) == 1){
				console.log("좋아요 취소");
				 $('#likecheck').val(0);
				 $('#likebtn').html('찜');
				 jjimNoticeCancel();
			}else if(Number($('#likecheck').val()) == 0){
				console.log("좋아요!");
				$('#likecheck').val(1);
				$('#likebtn').html('♥찜');
				jjimNotice();
			}
		}, error : function(result){
			console.log("에러" + result.result)
		}
		
		});
	};
	
	function jjimNotice(){
				console.log("찜");
		   		var cmd = 'jjim';
				$.ajax({
					url: '/myweb/addJjimNotice.do',
					type: 'post',
					data: {
						'cmd': cmd
					},
					success: function(data) {
						alert(data);
						if(sock){
							sock.send(data);
						}
					},
					error: function (e) {
				      	console.log(e.responseText);
					}
				});
	}
	
	function jjimNoticeCancel(){
				console.log("찜");
		   		var cmd = 'jjimCancel';
				$.ajax({
					url: '/myweb/cancelJjimNotice.do',
					type: 'post',
					data: {
						'cmd': cmd
					},
					success: function(data) {
						alert(data);
						if(sock){
							sock.send(data);
						}
					},
					error: function (e) {
				      	console.log(e.responseText);
					}
				});
	}
	/** 결제 * */
    // 결제 금액, 구매자의 이름, 이메일
    const priceAmount = "10";
    const buyerMemberEmail = "uusin@gmail.com";
    const buyerMemberName = "김유신(부산)";
    // const form = document.getElementById("payment");
	
    $(document).ready(function(){
        $('.lgWppt').bxSlider({
        	auto:false,
            infiniteLoop:false,
            controls:false     
        });
      });
    
    function kakaopay(){
      var url = 'http://kko.to/CYKsMtTl9';
      var title = '카카오 송금';
      var status = "width=370, height=600, top=100, left=600";
      	window.open(url,title,status);
     }
     
   	function add_pay_notice(){
   		console.log("fj");
   		var cmd = 'pay';
		$.ajax({
			url: '/myweb/addPayNotice.do',
			type: 'post',
			data: { 
				'cmd': cmd
			},
			success: function(data) {
				alert(data);
				if(sock){
					sock.send(data);
				}
			},
			error: function (e) {
		      	console.log(e.responseText);
			}
		});
   	}
   	
   	function cancel_pay_notice(){
   		console.log("fj");
   		var cmd = 'payCancel';
		$.ajax({
			url: '/myweb/cancelPayNotice.do',
			type: 'post',
			data: { 
				'cmd': cmd
			},
			success: function(data) {
				alert(data);
				if(sock){
					sock.send(data);
				}
			},
			error: function (e) {
		      	console.log(e.responseText);
			}
		});
   	}
   	
   	
    function showPopUp() {
    	//창 크기 지정
    	var width = 500;
    	var height = 500;
    	
    	//pc화면기준 가운데 정렬
    	var left = (window.screen.width / 2) - (width/2);
    	var top = (window.screen.height / 4);
    	
        	//윈도우 속성 지정
    	var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
        	//연결하고싶은url
        	const url = "/myweb/ppkPayPopUp.do";

    	//등록된 url 및 window 속성 기준으로 팝업창을 연다.
    	window.open(url, "hello popup", windowStatus);
    }    
    // 모달창
    const open = () => {
        document.querySelector(".modal").classList.remove("hidden");
      }

      const close = () => {
        document.querySelector(".modal").classList.add("hidden");
      }

      document.querySelector(".openBtn").addEventListener("click", open);
      document.querySelector(".closeBtn").addEventListener("click", close);
      document.querySelector(".bg").addEventListener("click", close);
      
      
      