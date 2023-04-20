<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title>상세 페이지</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="assets/css/fontawesome.css">
<link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
<link rel="stylesheet" href="assets/css/owl.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<style>
b {
	color: white;
}
</style>
<script type="text/javascript">
	function addToCart(){
		if (confirm('상품을 장바구니에 추가하시겠습니까?')) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</head>

<body>
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

					<!-- ***** Featured Start ***** -->
					<div class="row">
						<div class="col-lg-12">
							<div class="feature-banner header-text">
								<div class="container">
								
									<div class="row">
									<%@ include file="dbconn.jsp"%>
								<%
									String bookID = request.getParameter("id");
								
									PreparedStatement pstmt = null;
									ResultSet rs = null;
									
									//ID값을 찾아 가져와야 함..
									String sql = "SELECT * FROM book WHERE bookID = ?";
									pstmt = conn.prepareStatement(sql);
									pstmt.setString(1, bookID);
									rs = pstmt.executeQuery();
									
									if (rs.next()) {
										
									%>
									
										<div class="col-md-5">
											<!-- 이미지 업로드: width:100%으로 설정했지만 사이즈를 확인하면서 적당하게 변경 -->
											<img src="assets/images/<%=rs.getString("b_filename")%>"
												style="width: 100% ">
										</div>

										<div class="col-md-6" style="margin: 5px;">
											<h3><%=rs.getString("bookName")%></h3>
											<br>
											
											<p><b>도서 줄거리</b><br>
											<%=rs.getString("description")%></p>
											<br>
											<p>
												<b>상품코드: </b><span class="badge badge-danger"> <%=rs.getString("bookID")%></span>
											<p>
												<b>저자</b> :
												<%=rs.getString("author")%>
											<p>
												<b>출판사</b> :
												<%=rs.getString("publisher")%>
											<p>
												<b>분류</b> :
												<%=rs.getString("category")%>
											<p>
												<b>재고 수</b> :
												<%=rs.getString("unitsInStock")%>
												<br>
											<h4><%=rs.getString("unitPrice")%>원
											</h4>
											<br>
											<p>
											<form name="addForm"
												action="./addCart.jsp?id=<%=rs.getString("bookID")%>"
												method="post">
												<a href="#" class="btn btn-info" onclick="addToCart()">상품주문&raquo;</a>
												<a href="./cart.jsp" class="btn btn-warning">장바구니&raquo;</a>
												<a href="./products01.jsp" class="btn btn-secondary">상품목록&raquo;</a>
											</form>
										</div>
										<%
									 }
									
										if (rs != null)
											rs.close();
											if (pstmt != null)
											pstmt.close();
											if (conn != null)
											conn.close();

									
									%>
									</div>
									
									<hr>
								</div>
							</div>
						</div>
					</div>
					<!-- ***** Featured End ***** -->
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
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
