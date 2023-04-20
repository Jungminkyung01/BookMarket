<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1"> <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="assets/css/join.css">
<title>회원정보 수정</title>
</head>
<body>
<%
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
    if (userID == null)
    {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 하세요')");
        script.println("location.href = 'login.jsp'");
        script.println("</script>");
    }
    
    User user = new UserDAO().getUser(userID);
%>
	<div class="container">
		<div class="move" onclick="return confirm('정말로 탈퇴하시겠습니까?')">
			<div class="p-button normal signin animated pulse" 
			onclick="location.href='delete_userAction.jsp?userID=<%=userID %>'">
			회원탈퇴</div>
		</div>
		<div class="welcome">
			<h4 class="bold welcome-text">Delete User Inform!</h4>
			<p class="normal text">계정을 삭제하고 싶다면 회원정보 삭제버튼을 이용하여 삭제가 가능합니다.</p>
		</div>
		<div class="hello">
			<h4 class="bold welcome-text">Hello Friend</h4>
			<p class="normal text">Enter your personal details and start
				journey with us</p>
		</div>
		<div class="form">
			<h4 class="bold title">Create Account</h4>
			<p class="korean light">환영합니다! 회원가입 페이지 입니다.</p>
			<form method="post" action="update_userAction.jsp?userID=<%=userID%>">		
			<input type="text" class="normal" placeholder="ID" name="userID" maxlength="20" value="<%=user.getUserID() %>">
			<input type="password" class="normal" placeholder="Password" name="userPass" maxlength="20" value="<%=user.getUserPass() %>">
			<input type="text" class="normal name" placeholder="Name" name="userName" maxlength="20" value="<%=user.getUserName() %>">
			<input type="text" class="normal" placeholder="Email" name="userEmail" maxlength="50" value="<%=user.getUserEmail() %>">
			<p class="normal forgot">Forgot your password?</p>
			<input type="submit" class="b-button korean" value="수정하기">
			</form>
		</div>
	</div>
</body>
</html>