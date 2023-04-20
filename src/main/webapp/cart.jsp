<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="book.Product" %>
<%@ page import="book.ProductDAO" %>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title>장바구니</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="assets/css/fontawesome.css">
<link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
<link rel="stylesheet" href="assets/css/owl.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<%
	String cartId = session.getId();
%>
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
										<!-- Content Start -->
										<div class="jumbotron" style="padding-top: 50px; padding-bottom: 50px">
		<div class="container">
			<h2>장바구니</h2>
		</div>
	</div>
	<div class="container">
		<div class="row" style="background-color: #f7f7f7; border-radius: 20px; height: 75px;">
			<table width="100%" style="margin: 10px;">
				<tr>
					<td style="padding-left: 10px;"><input type="checkbox" id="allChk" checked>&nbsp;<b>전체</b></td>
					<td></td>
					<td align="right" style="padding-right: 35px;">
					<a href="./deleteCart.jsp?cartId=<%=cartId%>" 
					class="btn btn-danger">삭제하기</a>
					<a href="./shippingInfo.jsp?cartId=<%=
					cartId%>" class="btn btn-success">주문하기	</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table" style="color: white;">
				<tr>
					<th></th>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%				
					int sum = 0;
					ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
					if (cartList == null)
						cartList = new ArrayList<Product>();

					for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
						Product book = cartList.get(i);
						int total = book.getUnitPrice() * book.getQuantity();
						sum = sum + total;
				%>
				<tr>
					<td><input type="checkbox" class="chk" checked></td>
					<td><%=book.getBookID() %> - <%=book.getBookName() %></td>
					<td><%=book.getUnitPrice()%></td>
					<td><%=book.getQuantity()%></td>
					<td><%=total%></td>
					<td>
					<a href="./removeCart.jsp?id=<%=book.getBookID()%>"
					 class="bi bi-backspace-fill">&nbsp;삭제</a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum%></th>
					<th></th>
					<th></th>
				</tr>
			</table>
			<a href="./products01.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>
										<!-- Content End -->
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
	<jsp:include page="footer.jsp"></jsp:include>
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