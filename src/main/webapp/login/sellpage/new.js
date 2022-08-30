

//글자수가 넘어서면 메시지를 뿌리고 최대 문자수만큼 글자를 자른다


function chkMsgLength(intMax,objMsg,st) {
 var length = lengthMsg(objMsg.value);
 st.innerHTML = length;//현재 byte수를 넣는다
 if (length > intMax) {
  alert("최대 " + intMax + "byte이므로 초과된 글자수는 자동으로 삭제됩니다.\n");
  objMsg.value = objMsg.value.replace(/\r\n$/, "");
  objMsg.value = assertMsg(intMax,objMsg.value,st );
 }
}

function lengthMsg(objMsg) {
 var nbytes = 0;
 for (i=0; i<objMsg.length; i++) {
  var ch = objMsg.charAt(i);
  if(escape(ch).length > 4) {
  nbytes += 2;
  } else if (ch == '\n') {
   if (objMsg.charAt(i-1) != '\r') {
    nbytes += 1;
   }
  } else if (ch == '<' || ch == '>') {
   nbytes += 4;
  } else {
   nbytes += 1;
  }
 }
 return nbytes;
}

function assertMsg(intMax,objMsg,st ) {
 var inc = 0;
 var nbytes = 0;
 var msg = "";

 var msglen = objMsg.length;
 for (i=0; i<msglen; i++) {
  var ch = objMsg.charAt(i);
  if (escape(ch).length > 4) {
  inc = 2;
  } else if (ch == '\n') {
   if (objMsg.charAt(i-1) != '\r') {
   inc = 1;
   }
  } else if (ch == '<' || ch == '>') {
   inc = 4;
  } else {
   inc = 1;
  }
  if ((nbytes + inc) > intMax) {
   break;
  }
  nbytes += inc;
  msg += ch;
 }
 st.innerHTML = nbytes; //현재 byte수를 넣는다
 return msg;
}





//사진 업로드
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

// 폼 유효성 검사
function Checkform() {

    if(sellBoard.title.value == "" ) {
        alert("제목을 입력하세요");
        sellBoard.title.focus();
        return false;
    }
    if(sellBoard.price.value == "" ) {
    	sellBoard.price.focus();
        alert("가격을 입력하세요");
        return false;
    }
    
    if(sellBoard.feat.value == "" ) {
    	sellBoard.feat.focus();
        alert("내용을 입력하세요");
        return false;
    }
}
// 숫자만 입력되게 하기
function titleChk(){
	var obj = document.sellBoard;
	if(obj.title.value.length < 2 || obj.title.value.length > 40){
		document.getElementById("titleChk").innerHTML=('<span style="color: red;">제목은 2~40자 사이로 입력하세요.</span>');
		return;
	} else {
		document.getElementById("titleChk").innerHTML=('<span></span>');
	}
}

function chkNum(){
	if(!((event.keyCode>=48 && event.keyCode<=57)||(event.keyCode >= 96 && event.keyCode <= 105)||event.keyCode==8)){
		alert("숫자만 입력하세요.")
		event.returnValue=false;
	}
}

