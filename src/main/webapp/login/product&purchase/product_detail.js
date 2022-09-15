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
		$('.slider').bxSlider({
		        auto: true, 
		        mode:'horizontal',
		        minSlides: 1,
		        maxSlides: 5,
		        slideWidth: 155,
		        slideMargin: 0,
		        captions:true
	    });
		$('.slider2').bxSlider({
	        auto: true, 
	        mode:'horizontal',
	        minSlides: 1,
	        maxSlides: 2,
	        slideWidth: 130,
	        slideMargin: 5,
	        captions:true
    });
    });
	function login()  {
		 window.location.href ='/login.do';
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
		$("#picture").style.width = "800px";
	}
	function zoom(url){
		var image = document.getElementById("image");
		var source = image.src;
	    window.open(source,'new','width=800, height=600, scrollbars=yes');
	} 
	
	/*	
	$(function () {
		let num = 0;
		let imageName = ["check.png", "uncheck.png"];
		$("#jjim").click(function() {
			if(num == 1){
				$("#status").attr("src","/myweb/login/images/"+ imageName[num]);
				$("#status").fadeIn(1200);
				$("#status").fadeOut(2000);
				$("#jjim").html('찜');
				num=0;
			}else{
				$("#status").attr("src","/myweb/login/images/"+ imageName[num]);
				$("#status").fadeIn(1200);
				$("#status").fadeOut(2000);
				$("#jjim").html('♥찜');
				num++;	
			}
		});
	}); 
	
	$(document).on("click", "#jjim", function() {
		   console.log($("#user_seq").val());
		   $.ajax({
		      url: "/likeupdate.do",
		      method: "get",
		      data: {
		         user_seq: Number($("#user_seq").val())
		      },
		      dataType: "json",
		      success: function(re) {
		         console.log(re + "suc")
		      },
		      error: function(re) {
		      
		         if (re.responseText.trim() == "fail") {
		            alert("로그인 후 진행해주세요");
		         } else {
		            if (re.responseText.trim() == "no") {
		               alert("이미 추가되었습니다.");
		            }
		         }
		      }
		   })
		})*/
$('#jjim').click(function(){
		likeupdate();
		console.log($("#user_seq").val());
		console.log($("#post_seq").val());
		
	});
	
	function likeupdate(){
		var root = getContextPath(),
		likeurl = "/likeupdate.do",
		user_seq = $('#user_seq').val(),
		post_seq = $('#post_seq').val(),
		likeCnt = $('#likecheck').val(),
		data = {"user_seq" : user_seq,
				"post_seq" : post_seq,
				"likeCnt" : likeCnt};
		console.log($("#likecheck").val());
	$.ajax({
		url : root + likeurl,
		type : 'PUT',
		contentType: 'application/json',
		data : JSON.stringify(data),
		success : function(result){
			console.log("수정" + result.result);
			if(likeCnt == 1){
				console.log("좋아요 취소");
				 $('#likecheck').val(0);
				 $('#jjim').attr('class','btn btn-light');
			}else if(likeCnt == 0){
				console.log("좋아요!");
				$('#likecheck').val(1);
				$('#jjim').attr('class','btn btn-danger');
			}
		}, error : function(result){
			console.log("에러" + result.result)
		}
		
		});
	};
	
	function getContextPath() {
	    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	} 
	/** 결제 * */
    // 결제 금액, 구매자의 이름, 이메일
    const priceAmount = "100000";
    const buyerMemberEmail = "uusin@gmail.com";
    const buyerMemberName = "김유신(부산)";
    // const form = document.getElementById("payment");

    console.log(priceAmount);
    console.log(buyerMemberName);
    console.log(buyerMemberEmail);
    const IMP = window.IMP;
    IMP.init('imp62063820');

    function requestPay() {
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: 'cart_' + new Date().getTime(),
            name: "자석펫",
            amount: priceAmount,
            buyer_email: buyerMemberEmail,
            buyer_name: buyerMemberName,

        }, function (rsp) { // callback

            /** 결제 검증 * */
            $.ajax({
                type: 'POST',
                url: '/verifyIamport/'+rsp.imp_uid,
                beforeSend: function(xhr){
                    xhr.setRequestHeader(header, token);
                }
            }).done(function(result){
                // rsp.paid_amount와 result.response.amount(서버 검증) 비교 후 로직 실행
                if(rsp.paid_amount === result.response.amount){
                    alert("결제가 완료되었습니다.");
                    $.ajax({
                        type:'POST',
                        url:'/lecture/payment',
                        beforeSend: function(xhr){
                            xhr.setRequestHeader(header, token);
                        }
                    }).done(function() {
                        window.location.reload();
                    }).fail(function(error){
                            alert(JSON.stringify(error));
                })
                } else{
                    alert("결제에 실패했습니다."+"에러코드 : "+rsp.error_code+"에러 메시지 : "+rsp.error_message);

                }
            })
        });
    };
    $(document).ready(function(){
        $('.lgWppt').bxSlider({
        	auto:false,
            infiniteLoop:false,
            controls:false     
        });
      });
    
    
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
      