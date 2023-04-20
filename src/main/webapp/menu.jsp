<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>menu page</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<header class="header-area header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->
						<a href="index.jsp" class="logo"> <img
							src="assets/images/books.png" alt=""
							style="width: 50px; height: 50px; margin: 0px 30px;"> Book
							Market
						</a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Search End ***** -->
						<div class="search-input">
							<form id="search" action="#">
								<input type="text" placeholder="Type Something" id='searchText'
									name="searchKeyword" onkeypress="handle" /> <i
									class="fa fa-search"></i>
							</form>
						</div>
						<!-- ***** Search End ***** -->
						<!-- ***** Menu Start ***** -->
						<div>
							<ul class="nav">
								<li><a href="index.jsp" class="active">Home</a></li>
								<li><a href="products01.jsp?country=국내">국내도서</a></li>
								<li><a href="products02.jsp?country=해외">해외도서</a></li>
								<%
								if (userID == null) {
								%>

								<li><a href="login.jsp">SIGN IN</a></li>
								<li><a href="join.jsp">SIGN UP</a></li>

								<%
								} else {
								%>

								<li><a href="profile.jsp">profile</a></li>
								<li><a href="logout_action.jsp">Log-out</a></li>
							</ul>
							<%
							}
							%>
							<a class='menu-trigger'> <span>Menu</span>
							</a>
						</div>
						<!-- ***** Menu End ***** -->
					</nav>
				</div>
			</div>
		</div>
	</header>
</body>
</html>
