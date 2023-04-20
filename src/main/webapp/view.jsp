<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.BoardDTO"%>
<%@ page import="board.BoardDAO"%>
<!DOCTYPE html>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> <!-- 반응형 웹에 사용하는 메타태그 -->

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title>게시판</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="assets/css/fontawesome.css">
<link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
<link rel="stylesheet" href="assets/css/owl.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

</head>

<body>
	<%
	String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int num = 0;
	if (request.getParameter("num") != null) {
		num = Integer.parseInt(request.getParameter("num"));
	}
	if (num == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다')");
		script.println("location.href = 'list.jsp'");
		script.println("</script>");
	}
	BoardDTO board = new BoardDAO().getBoardDTO(num);
	%>
	<!-- ***** Preloader Start ***** -->
	<div id="js-preloader" class="js-preloader">
		<div class="preloader-inner">
			<span class="dot"></span>
			<div class="dots">
				<span></span> <span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->

	<!-- ***** Header Area Start ***** -->
	<jsp:include page="menu.jsp"></jsp:include>
	<!-- ***** Header Area End ***** -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<!-- ***** Content Start *****  -->
					<div class="container">
						<div class="row">
							<table class="table table-striped"
								style="text-align: center; border: 1px solid #dddddd">
								<thead>
									<tr>
										<th colspan="3"
											style="background-color: #eeeeee; text-align: center;">게시판
											글 보기</th>

									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="width: 20%;color: #eeeeee;">글 제목</td>
										<td colspan="2" style="color: #eeeeee; text-align: left;"><%=board.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n",
		"<br>")%></td>
									</tr>
									<tr>
										<td style="color: #eeeeee;">작성자</td>
										<td colspan="2" style="color: #eeeeee; text-align: left;"><%=board.getUserID().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n",
		"<br>")%></td>
									</tr>
									<tr>
										<td style="color: #eeeeee;">내용</td>
										<td colspan="2" style="min-height: 200px; text-align: left; color: #eeeeee;">
											<!-- 특수문자를 제대로 출력하기위해 & 악성스크립트를 방지하기위해 --> <%=board.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
		.replaceAll("\n", "<br>")%></td>
									</tr>
									<tr>
										<td style="color: #eeeeee;">작성일자</td>
										<td colspan="2" style="color: #eeeeee;text-align: left;"><%=board.getBbsDate().substring(0, 11) + board.getBbsDate().substring(11, 13) + "시"
		+ board.getBbsDate().substring(14, 16) + "분"%></td>
									</tr>
								</tbody>
							</table>
							<div style="text-align: right;">
							<a href="list.jsp" class="btn" style="background-color: #e75e8d;color: #eeeeee;margin-top: 10px;">목록</a>
							<%
							if (userID != null && userID.equals(board.getUserID())) {
							%>
							<a href="update_write.jsp?num=<%=num%>" class="btn" style="background-color: #eeeeee; color: #333333;margin-top: 10px;">수정</a>
							<a href="delete_writeAction.jsp?num=<%=num%>"
								class="btn"
								onclick="return confirm('정말로 삭제하시겠습니까?')"
								style="background-color: #eeeeee; color: #333333;margin-top: 10px;">삭제</a>

							<%
							}
							%>
							</div>>
						</div>
					</div>
					<!-- ***** Content END *****  -->
				</div>
			</div>
		</div>
	</div>

	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>


	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<script src="assets/js/isotope.min.js"></script>
	<script src="assets/js/owl-carousel.js"></script>
	<script src="assets/js/tabs.js"></script>
	<script src="assets/js/popup.js"></script>
	<script src="assets/js/custom.js"></script>


</body>

</html>
