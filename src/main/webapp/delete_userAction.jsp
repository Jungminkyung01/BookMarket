<!-- 실제로 글쓰기를 눌러서 만들어주는 Action페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 문장사용 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 파일을 UTF-8로 -->
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP게시판 웹사이트</title>
</head>
<body>
    <%
        String userID = null;
        // 로그인 된 사람은 회원가입페이지에 들어갈수 없다
        if(session.getAttribute("userID") != null )
        {
            userID = (String) session.getAttribute("userID");
        }
        
        if(userID == null)
        {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        } 
        
        User user = new UserDAO().getUser(userID);
        
        UserDAO userDAO = new UserDAO();
            int result = userDAO.delete(userID);
                if(result == -1){ // 삭제에 실패했을 경우
                    PrintWriter script = response.getWriter(); //하나의 스크립트 문장을 넣을 수 있도록.
                    script.println("<script>");
                    script.println("alert('회원정보 삭제에 실패했습니다.')");
                    script.println("history.back()");
                    script.println("</script>");
                }
                else { // 삭제에 성공했을 경우
                	session.invalidate();
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("location.href= 'index.jsp'");
                    script.println("</script>");
                }
        
    %>
</body>
</html> 