<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.BoardDTO"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

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
					<div class="col-lg-12">
						<div class="heading-section">
							<h4>
								<em>글쓰기</em> 페이지
							</h4>
						</div>
					</div>
					<div class="container">
        <div class="row">
        <form method="post" action="writeAction.jsp">
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="2" style="background-color:#eeeeee; text-align:center;">게시판 글쓰기 양식</th>
 
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <td><input type="text" class="form-control" placeholder="글 제목"  name="bbsTitle" maxlength="50" ></td>
                    </tr>
                    <tr>
                    <td><textarea class="form-control" placeholder="글 내용"  name="bbsContent" maxlength="2048" style="height:350px" ></textarea></td>
                    </tr>
                </tbody>
            </table>
                <input type="submit"  class="btn pull-right" style="background-color:#e75e8d; text-align:center; color:#eeeeee;" value="글쓰기">
            </form>
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
