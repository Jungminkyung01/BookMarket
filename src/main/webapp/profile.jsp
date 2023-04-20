<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>프로필</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<style>
.banner {
	background-image:
		url("https://images.unsplash.com/photo-1635492491273-455af7728453?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=960&q=80");
	background-position: center center;
	background-size: cover;
	min-height: 250px;
	border-radius: 23px;
	padding: 80px 60px;
}

.banner h6 {
	font-size: 20px;
	color: #111;
	font-weight: 400;
	margin-bottom: 25px;
}

.banner h4 {
	font-size: 45px;
	color: #fff;
	text-transform: uppercase;
	margin-bottom: 25px;
}

.banner h4 em {
	font-style: normal;
	color: #ec6090;
}
</style>
  </head>

<body>
<%
	String userID = null;
	if (session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
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

          <!-- ***** Banner Start ***** -->
          <div class="row">
            <div class="col-lg-12">
              <div class="main-profile ">
                <div class="row">
                  <div class="col-lg-4">
                    <img src="https://images.unsplash.com/photo-1680266179692-a21c915b0b53?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80 alt="" style="border-radius: 23px;">
                  </div>
                 
                  <div class="col-lg-4 align-self-center">
                    <div class="main-info header-text">
                      <span>Profile</span>
                      <h4><%out.println(userID); %>님, 어서오세요!</h4>
                      <p>Hello. My Page</p>
                      <div class="main-border-button">
                        <a href="update_user.jsp?userID=<%=userID %>">회원정보 수정</a>
                      </div>
                    </div>
                  </div>
                  
                  <div class="col-lg-4 align-self-center">
                    <ul>
                      <li>Games Downloaded <span>3</span></li>
                      <li>Friends Online <span>16</span></li>
                      <li>Live Streams <span>None</span></li>
                      <li>Clips <span>29</span></li>
                    </ul>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
          <!-- ***** Banner End ***** -->
          <br><br>
			<!-- ***** Banner Start ***** -->
					<div class="banner">
						<div class="row">
							<div class="col-lg-7">
								<div class="header-text">
									<h6>Welcome! My Page</h6>
									<h4>
										<em>나만의 독후감</em>을 작성해보자!
									</h4>
									<div class="main-button">
										<a href="list.jsp">Browse Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ***** Banner End ***** -->
          <!-- ***** Gaming Library Start ***** -->
          <div class="gaming-library profile-library">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4><em>Setting</em> BOOK _ 관리 기능</h4>
              </div>
              <div class="item">
                <ul>
                	<li><h4> </h4><span> </span></li>
                  <li><img src="assets/images/game-01.jpg" alt="" class="templatemo-item"></li>
                  <li><h4>도서 추가하기</h4><span>Add Book</span></li>
                  
                  <li><h4> </h4><span> </span></li>
                  <li><div class="main-border-button border-no-active"><a href="addProduct.jsp">ADD Book</a></div></li>
                </ul>
              </div>
              <div class="item">
                <ul>
                <li><h4> </h4><span> </span></li>
                  <li><img src="assets/images/game-02.jpg" alt="" class="templatemo-item"></li>
                  <li><h4>도서 편집하기</h4><span>Edit Book</span></li>
                  
                  <li><h4> </h4><span> </span></li>
                  <li><div class="main-border-button border-no-active"><a href="./editBook.jsp?edit=update">수정하기</a></div></li>
                </ul>
              </div>
              <div class="item last-item">
                <ul>
                <li><h4> </h4><span> </span></li>
                  <li><img src="assets/images/game-03.jpg" alt="" class="templatemo-item"></li>
                  <li><h4>도서 삭제하기</h4><span>Delete Book</span></li>
                  
                  <li><h4> </h4><span> </span></li>
                  <li><div class="main-border-button border-no-active"><a href="./editBook.jsp?edit=delete">삭세하기</a></div></li>
                </ul>
              </div>
            </div>
          </div>
          <!-- ***** Gaming Library End ***** -->
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
