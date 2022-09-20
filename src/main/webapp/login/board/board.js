function write(){
	location.href='insertboard.do';
	}
function myBoard(){
	var user_seq= '<%=(String)session.getAttribute("user.user_seq")%>'
	location.href="myboard.do?user_seq="+user_seq;
}