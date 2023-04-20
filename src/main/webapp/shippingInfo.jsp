<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title>도서 등록페이지</title>

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
.banner {
	background-image:
		url("https://i.pinimg.com/564x/d0/96/2b/d0962be3d8ebfd9153c03b81f59783a9.jpg");
	background-position: center center;
	background-size: cover;
	min-height: 200px;
	border-radius: 23px;
	padding: 80px 60px;
}

.banner h6 {
	font-size: 20px;
	color: #fff;
	font-weight: 400;
	margin-bottom: 25px;
}

.banner h4 {
	font-size: 45px;
	text-transform: uppercase;
	margin-bottom: 25px;
}

.banner h4 em {
	font-style: normal;
	color: #ec6090;
}

label {
	color: white;
}

.border-group {
	padding: 15px;
}

.form-group {
	margin: 10px;
}
</style>
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

					<!-- ***** Banner Start ***** -->

					<!-- ***** Banner End ***** -->

					<!-- ***** Add Book Start ***** -->
						<div class="banner">
							<div class="row">
								<div class="col-lg-7">
									<div class="header-text">
										<h6>배송정보를 입력해주세요!</h6>
										<h4>
											<em>배송</em> 정보
										</h4>
									</div>
								</div>
							</div>
						</div>
						<div class="gaming-library">
							<!-- form -->
							<form name="newProduct" action="./shippingInfo_action.jsp"
								class="form-horizontal" method="post">
								<div class="row g-0 overflow-hidden">
									<div class="d-flex flex-column justify-content-center">
										<div class="p-4" style="line-height: 3em">
											<input type="hidden" name="cartId"
												value="<%=request.getParameter("cartId")%>" />
											<div class="form-group row">
												<label class="col-sm-2">성명</label>
												<div class="col-sm-3">
													<input name="name" type="text" class="form-control" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-2">배송일</label>
												<div class="col-sm-3">
													<input name="shippingDate" type="text" class="form-control" />
													<p>(yyyy/mm/dd)</p>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-2">국가</label>
												<div class="col-sm-3">
													<input name="country" type="text" class="form-control" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-2">우편번호</label>
												<div class="col-sm-3">
													<input name="zipCode" type="text" class="form-control" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-2">주소</label>
												<div class="col-sm-5">
													<input name="addressName" type="text" class="form-control" />
												</div>
											</div>
											<div class="form-group row">
												<div class="col-sm-offset-2 col-sm-10 ">
													<a
														href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>"
														class="btn btn-secondary" role="button"> 이전 </a> <input
														type="submit" class="btn btn-primary" value="등록" /> <a
														href="./checkOutCancelled.jsp" class="btn btn-primary"
														role="button">취소</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					<!-- ***** Add Book End ***** -->
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