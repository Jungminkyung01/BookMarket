<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title>도서 아이디 오류</title>

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
										<div class="container-fluid bg-exception my-2 py-2">
											<div class="jumbotron" style="">
												<div class="container">
													<h2 class="alert alert-primary">해당 도서가 존재하지 않습니다.</h2>
												</div>
											</div>
										</div>
										<div class="container" style="padding-top: 30px">
											<p>
												<b><%=request.getRequestURL()%>?<%=request.getQueryString()%></b>
											<p>
												<br><b><a href="index.jsp" class="btn btn-primary">메인으로 &raquo;</a></b>
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