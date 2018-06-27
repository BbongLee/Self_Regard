<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head><style>
body{
	font-style:'맑은 고딕';
}
body:before{
  content:'';
  height:100%;
  display:inline-block;
  vertical-align:middle;
}
input{
  background:#000000;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
input:hover{
  background:#fff;
  color:#1AAB8A;
}
input:before,input:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #fff;
  transition:400ms ease all;
}
input:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
input:hover:before,input:hover:after{
  width:100%;
  transition:800ms ease all;
}
#in{
	border-radius:10px;
	margin-left:500px;	
}

</style>
<body>
<center>
	<div class="joinForm_div">
		<form method="post" action="joinProc.jsp">
			<br><br><br><div>
				<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
			</div><br>
			<div>
				<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
			</div><br>
			<div>
				<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
			</div><br>
			<div>
				<input type="text" class="form-control" placeholder="닉네임" name="userNickname" maxlength="20">
			</div><br>
			<div>
				<input type="hidden" class="form-control" value="여자" name="userGender" maxlength="20">
			</div><br>
			<div>
				<input type="date" placeholder="생년월일" name="userBirth" maxlength="30">
			</div><br><br>
			<input type="submit" value="회원가입" id="in"><br><br>
			</center>
			<br><br>
		</form>
	</div>
</html>