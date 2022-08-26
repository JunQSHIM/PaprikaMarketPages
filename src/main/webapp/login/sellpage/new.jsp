<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new</title>
<script src="/myweb/login/sellpage/new.js"></script>
<link href="/myweb/login/sellpage/news.css" rel="stylesheet"
	type="text/css">
<script src="/myweb/login/sellpage/new.js"></script>
<link href="/myweb/login/sellpage/news.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.3.0/bootbox.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
	integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
	crossorigin="anonymous"></script>
<script type="text/javascript">
        jQuery(document).ready(function() {        
           
            var storedFiles = [];      
            //$('.cvf_order').hide();
           
            // Apply sort function 
            function cvf_reload_order() {
                var order = $('.cvf_uploaded_files').sortable('toArray', {attribute: 'item'});
                $('.cvf_hidden_field').val(order);
            }
           
            function cvf_add_order() {
                $('.cvf_uploaded_files li').each(function(n) {
                    $(this).attr('item', n);
                });
                console.log('test');
            }
           
           
            $(function() {
                $('.cvf_uploaded_files').sortable({
                    cursor: 'move',
                    placeholder: 'highlight',
                    start: function (event, ui) {
                        ui.item.toggleClass('highlight');
                    },
                    stop: function (event, ui) {
                        ui.item.toggleClass('highlight');
                    },
                    update: function () {
                        //cvf_reload_order();
                    },
                    create:function(){
                        var list = this;
                        resize = function(){
                            $(list).css('height','auto');
                            $(list).height($(list).height());
                        };
                        $(list).height($(list).height());
                        $(list).find('img').load(resize).error(resize);
                    }
                });
                $('.cvf_uploaded_files').disableSelection();
            });
                   
            $('body').on('change', '.user_picked_files', function() {
               
                var files = this.files;
                var i = 0;
                           
                for (i = 0; i < files.length; i++) {
                    var readImg = new FileReader();
                    var file = files[i];
                   
                    if (file.type.match('image.*')){
                        storedFiles.push(file);
                        readImg.onload = (function(file) {
                            return function(e) {
                                $('.cvf_uploaded_files').append(
                                "<li file = '" + file.name + "'>" +                                
                                    "<img class = 'img-thumb' src = '" + e.target.result + "' />" +
                                    "<a href = '#' class = 'cvf_delete_image' title = 'Cancel'><img class = 'delete-btn' src = '/myweb/login/images/delete-btn.png' /></a>" +
                                "</li>"
                                );     
                            };
                        })(file);
                        readImg.readAsDataURL(file);
                       
                    } else {
                        alert('the file '+ file.name + ' is not an image<br/>');
                    }
                   
                    if(files.length === (i+1)){
                        setTimeout(function(){
                            cvf_add_order();
                        }, 1000);
                    }
                }
            });
           
            // Delete Image from Queue
            $('body').on('click','a.cvf_delete_image',function(e){
                e.preventDefault();
                $(this).parent().remove('');       
               
                var file = $(this).parent().attr('file');
                for(var i = 0; i < storedFiles.length; i++) {
                    if(storedFiles[i].name == file) {
                        storedFiles.splice(i, 1);
                        break;
                    }
                }
               
                //cvf_reload_order();
               
            });
                   
            // AJAX Upload
            $('body').on('click', '.cvf_upload_btn', function(e){
               
                e.preventDefault();
                cvf_reload_order();
               
                //$(".cvf_uploaded_files").html('<p><img src = "loading.gif" class = "loader" /></p>');
                var data = new FormData();
               
                var items_array = $('.cvf_hidden_field').val();
                var items = items_array.split(',');
                for (var i in items){
                    var item_number = items[i];
                    data.append('files' + i, storedFiles[item_number]);
                }
                   
                $.ajax({
                    url: 'upload.php',
                    type: 'POST',
                    contentType: false,
                    data: data,
                    processData: false,
                    cache: false,
                    success: function(response, textStatus, jqXHR) {
                        //$(".cvf_uploaded_files").html('');                                               
                        //bootbox.alert('<br /><p class = "bg-success">File(s) uploaded successfully.</p>');
                        alert(jqXHR.responseText);
                    }
                });
               
            });        
        });
      
    </script>
</head>
<body>
	<div class="grid_12 newinfo">
		<div class="newinfo_1">
			<div class="grid_2 newinfo_1_1">기본정보</div>
			<div class="grid_2 newinfo_1_2">*필수항목</div>
		</div>
		<div class="grid_12 proimg">
			<div class="grid_2 explain">
				상품이미지 <span>*</span>
			</div>
			<div class="grid_10 newdata">
				<div class="grid_10 pics">
					<div class="grid_2 regpic">
						<div class="file_0">
							<div class="file_1">

								<input type="file" name="upload" multiple="multiple"
									class="form-control user_picked_files" />

							</div>

						</div>
					</div>
					<div class="file_2">
						<img src="images/regpic.png" alt="이미지등록" onclick="#">

					</div>
					<ul class="cvf_uploaded_files"></ul>

				</div>
				<div class="clear grid_9 warn">
					* 상품 이미지는 640x640에 최적화 되어 있습니다. <br> - 상품 이미지는 PC에서는 1:1,
					모바일에서는 1:1.23 비율로 보여집니다. <br>- 이미지는 상품 등록 시 정사각형으로 잘려서 등록됩니다.
					<br>- 이미지를 클릭할 경우 원본 이미지를 확인할 수 있습니다. <br>- 이미지를 클릭 후
					이동하여 등록순서를 변경할 수 있습니다. <br>- 큰 이미지일 경우 이미지가 깨지는 경우가 발생할 수
					있습니다. <br>최대 지원 사이즈인 640 X 640으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M)
				</div>
			</div>

		</div>
		<div class="grid_12 title">
			<div class="grid_2 explain">
				제목 <span>*</span>
			</div>
			<div class="grid_10 newdata">
				<div class="titlebox">
					<input type="text" name="title" placeholder="상품 제목을 입력해주세요.">
					<a href="#">거래금지 품목</a>
				</div>

			</div>
		</div>
		<div class="grid_12 categ">

			<div class="grid_2 explain">
				카테고리 <span>*</span>
			</div>
			<div class="grid_10 newdata">
				<select id="cate">

					<option value="digital">디지털/가전</option>
					<option value="interior">가구/인테리어</option>
					<option value="kids">유아동/유아도서</option>
					<option value="food">생활/가공식품</option>
					<option value="sports">스포츠/레저</option>
					<option value="fe_acc">여성잡화</option>
					<option value="fe_dress">여성의류</option>
					<option value="ma_dress">남성패션/잡화</option>
					<option value="hobby">게임/취미</option>
					<option value="beauty">뷰티/미용</option>
					<option value="pet">반려동물용품</option>
					<option value="books">도서/티켓/음반</option>
					<option value="etc">기타 중고물품</option>
					<option value="sayo">삽니다</option>

				</select>



			</div>
		</div>
		<div class="grid_12 location">
			<div class="grid_2 explain">
				거래지역 <span>*</span>
			</div>
			<div class="grid_10 newdata">
				<button type="button" onclick="#">내위치</button>
				<button type="button" onclick="#">최근 지역</button>
				<button type="button" onclick="#">주소 검색</button>
				<button type="button" onclick="#">지역설정안함</button>
				<input readonly value=" &nbsp;지역설정안함">
			</div>
		</div>
		<div class="grid_12 new_state">
			<div class="grid_2 explain">
				상태<span>*</span>

			</div>
			<div class="grid_10 newdata">
				<label><input name="schd" id="중고상품" type="radio" value="0"
					checked> 중고상품 </label> <label> <input name="schd" id="새상품"
					type="radio" value="0"> 새상품
				</label>
			</div>
		</div>
		<div class="grid_12 refund">
			<div class="grid_2 explain">
				교환 <span>*</span>
			</div>
			<div class="grid_10 newdata">
				<label><input name="refund" id="교환불가" type="radio" value="0"
					checked> 교환불가 </label> <label> <input name="refund"
					id="교환가능" type="radio" value="0"> 교환가능
				</label>
			</div>
		</div>
		<div class="grid_12 new_price">
			<div class="grid_2 explain">
				가격 <span>*</span>
			</div>
			<div class="grid_10 newdata">
				<div class="pri">
					<input type="text" placeholder=" 숫자만 입력해주세요."> 원
				</div>
				<p>
					<label> <input type="checkbox" name="shipfee"> 배송비
						포함
					</label>
				</p>
			</div>
		</div>
		<div class="grid_12 feat">
			<div class="grid_2 explain">
				설명 <span>*</span>
			</div>
			<div class="grid_10 newdata">
				<div class="textbox">
					<form action="" name="gForm">
						<textarea class="text_area" rows="6"
							placeholder="여러 장의 상품 사진과 구입 연도, 브랜드, 사용감, 하자 유무 등 구매자에게 필요한 정보를 꼭 포함해 주세요. (10자 이상)&#13;안전하고 건전한 거래 환경을 위해 과학기술정보통신부, 한국인터넷진흥원과 번개장터(주)가 함께 합니다."
							name="feat" onkeyup="chkMsgLength(1000,feat,currentMsgLen);"></textarea>
						<br>
						<div class="hoxy">
							혹시 <a href="https://help.bunjang.co.kr/notice/607"
								target="_blank">카카오톡 ID</a> 를 적으셨나요?
						</div>
						<div class="counter">
							<span id="currentMsgLen" style="padding-left: 60;">0</span>/1000자
						</div>

					</form>
				</div>


			</div>
		</div>
		<div class="grid_12 tag">
			<div class="grid_2 explain">연관태그</div>
			<div class="grid_10 newdata">
				<div class="tags">
					<input type="text" placeholder="연관태그를 입력해주세요. (최대 5개)" name="tags">
				</div>
				<ul class="tagrule">
					<li><p>- 태그는 띄어쓰기로 구분되며 최대 9자까지 입력할 수 있습니다.</p></li>
					<li><p>- 태그는 검색의 부가정보로 사용 되지만, 검색 결과 노출을 보장하지는 않습니다.</p></li>
					<li><p>- 검색 광고는 태그정보를 기준으로 노출됩니다.</p></li>
					<li><p>- 상품과 직접 관련이 없는 다른 상품명, 브랜드, 스팸성 키워드 등을 입력하면 노출이
							중단되거나 상품이 삭제될 수 있습니다.</p></li>
				</ul>
			</div>
		</div>

		<div class="grid_12 fastsell">
			<div class="grid_2 fastsell_1">빠른 판매</div>
			<div class="grid_10 fastsell_2">
				내 상품에 안전결제 배지가 표시돼요 <a href="#">자세히</a>
			</div>
			<div class="clear"></div>
		</div>

		<div class="grid_2 explain">옵션</div>
		<div class="grid_10 newdata">

			<div class="option">
				<label><input id="bunPayFilter" type="checkbox">안전결제
					환영</label>
			</div>
			<ul class="opt">
				<li>
					<p>안전결제(번개페이) 요청을 거절하지 않는 대신 혜택을 받을 수 있어요.</p>
					<p>
						<small>거절 시, <a
							href="https://help.bunjang.co.kr/faq/3/415" target="_blank">이용
								제재</a>가 있을 수 있으니 주의해 주세요.
						</small>
					</p>
				</li>
				<li>
					<p>내 상품을 먼저 보여주는 전용 필터로 더 빠르게 판매할 수 있어요.</p>
				</li>
				<li>
					<p>번개페이 배지로 더 많은 관심을 받을 수 있어요.</p>
				</li>
			</ul>
			<div>* 번개페이 배지와 전용 필터 기능은 앱 또는 모바일 웹에서만 볼 수 있어요.</div>
		</div>

	</div>







</body>
</html>