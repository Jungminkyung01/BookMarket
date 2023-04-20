<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!--

TemplateMo 579 Cyborg Gaming

https://templatemo.com/tm-579-cyborg-gaming

-->
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
	margin:10px;
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
					<fmt:setLocale value='<%=request.getParameter("language")%>' />
					<fmt:bundle basename="resourceBundle.message">
						<div class="banner">
							<div class="row">
								<div class="col-lg-7">
									<div class="header-text">
										<h6>새로운 도서를 등록해주세요!</h6>
										<h4>
											<em>[New]</em>
											<fmt:message key="title" />
										</h4>
									</div>
								</div>
							</div>
						</div>
						<div class="gaming-library">
							<!-- 언어변경 추가 -->
							<div class="text-right"
								style="text-align: right; padding: 0px 15px;">
								<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
							</div>
							<br>
							<!-- form -->
							<form name="newProduct" action="./addProduct_action.jsp"
								class="form-horizontal" method="post"
								enctype="multipart/form-data">
								<div class="border-group">
									<div class="form-group row">
										<label class="col-sm-2"><fmt:message key="bookID" /></label>
										<div class="col-sm-3">
											<input type="text" id="bookID" name="bookID"
												class="form-control">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2"><fmt:message key="bookName" /></label>
										<div class="col-sm-3">
											<input type="text" id="bookName" name="bookName"
												class="form-control">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2"><fmt:message key="unitPrice" /></label>
										<div class="col-sm-3">
											<input type="text" id="unitPrice" name="unitPrice"
												class="form-control">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2"><fmt:message key="author" /></label>
										<div class="col-sm-3">
											<input type="text" name="author" class="form-control">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2"><fmt:message key="description" /></label>
										<div class="col-sm-5">
											<textarea name="description" cols="60" rows="2"
												class="form-control"></textarea>
										</div>
									</div>
									
									<div class="form-group row">
										<label class="col-sm-2"><fmt:message key="publisher" /></label>
										<div class="col-sm-3">
											<input type="text" name="publisher" class="form-control">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2"><fmt:message key="category" /></label>
										<div class="col-sm-5" style="color: white;">
											<input type="radio" name="category" value="초등 ">
											<fmt:message key="category_c" />
											<input type="radio" name="category" value="중등">
											<fmt:message key="category_m" />
											<input type="radio" name="category" value="고등">
											<fmt:message key="category_h" />
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2"><fmt:message
												key="unitsInStock" /></label>
										<div class="col-sm-3">
											<input type="text" id="unitsInStock" name="unitsInStock"
												class="form-control">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2"><fmt:message key="totalpages" /></label>
										<div class="col-sm-3">
											<input type="text" id="totalpages" name="totalpages"
												class="form-control">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2"><fmt:message key="releaseDate" /></label>
										<div class="col-sm-3">
											<input type="text" id="releaseDate" name="releaseDate"
												class="form-control">
												<span style="color: gray;">(yyyy.mm.dd)</span>
										</div>
									</div>
									<!-- 국내 / 해외 -->
									<div class="form-group row">
									<label class="col-sm-2"><fmt:message key="country" /></label>
										<div class="col-sm-5" style="color: white;">
											<input type="radio" name="country" value="국내 ">
											<fmt:message key="country_ko" />
											<input type="radio" name="country" value="해외">
											<fmt:message key="country_en" />
											
										</div>
									</div>
									<div class="form-group row">
									<label class="col-sm-2"><fmt:message key="condition" /></label>
										<div class="col-sm-5" style="color: white;">
											<input type="radio" name="b_condition" value="New ">
											<fmt:message key="condition_NEW" />
											<input type="radio" name="b_condition" value="Old">
											<fmt:message key="condition_OLD" />
											<input type="radio" name="b_condition" value="E-Book">
											<fmt:message key="condition_EBOOK" />
										</div>
									</div>
									<!-- 이미지 등록 -->
									<div class="form-group row">
										<label class="col-sm-2"><fmt:message key="bookImage" /></label>
										<div class="col-sm-5">
											<input type="file" name="b_filename" class="form-control">
										</div>
									</div>
								</div>
								<!-- 등록하기 -->
								<div class="col-lg-12">
									<div class="main-button">
										<input type="button" class="btn btn-danger" style="background-color: #ec6090"
											value="<fmt:message key="button"/>"
											onclick="CheckAddProduct()">
									</div>
								</div>
							</form>
						</div>
					</fmt:bundle>
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
	<!-- Validation_유효성 체크 -->
	<script src="assets/js/validation.js"></script>
</body>

</html>
