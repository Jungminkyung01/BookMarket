<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="assets/css/login.css">
<title>login page</title>
</head>
<body>
	<div class="container">
		<div class="move">
			<div class="p-button normal signin animated pulse" onclick="location.href='join.jsp'">
			SIGN UP</div>
		</div>
		<div class="welcome">
			<h4 class="bold welcome-text">Hello Friend</h4>
			<p class="normal text">Enter your personal details and start
				journey with us</p>
		</div>
		<div class="form">
			<h4 class="bold title">Sign-in</h4>
			<form method="post" action="login_action.jsp">	
			<p class="normal light">로그인 페이지 입니다.</p>
			<input type="text" class="normal" placeholder="ID" name="userID" maxlength="20">
			<input type="password" class="normal" placeholder="Password" name="userPass" maxlength="20">
			<input type="submit" class="b-button normal" value="로그인">
			</form>
			<div>
			<p class="normal forgot" onclick="location.href='#'">Forgot your password?</p>
			</div>
		</div>
	</div>
</body>
</html>
