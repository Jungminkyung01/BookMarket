<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> <!-- 반응형 웹에 사용하는 메타태그 -->

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    
    <title>게시판</title>

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
	min-height: 200px;
	border-radius: 23px;
	padding: 60px 40px;
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
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
    int pageNumber = 1; // 기본페이지 기본적으로 페이지 1부터 시작하므로
    if (request.getParameter("pageNumber") != null)
    {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
        <!-- Banner -->
					<div class="banner">
						<div class="row">
							<div class="col-lg-7">
								<div class="header-text">
									<h6 style="font-family: 'Sunflower', sans-serif;">도서들을 읽고 많은사람들과 공유해보세요!</h6>
									<h4 style="font-family: 'Sunflower', sans-serif;">
										<em>[Write]</em> 독후감 페이지
									</h4>
								</div>
							</div>
						</div>
					</div>
					<br>
					<!-- Banner End -->
        <div class="container">
        <div class="row">
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th style="background-color:#eeeeee; text-align:center;">번호</th>
                        <th style="background-color:#eeeeee; text-align:center;">제목</th>
                        <th style="background-color:#eeeeee; text-align:center;">작성자</th>
                        <th style="background-color:#eeeeee; text-align:center;">작성일</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    BoardDAO bbsDAO = new BoardDAO();
                    ArrayList<BoardDTO> list = bbsDAO.getList(pageNumber);
                    for(int i = 0; i < list.size(); i++)
                    {
                %>
                
                    <tr>
                         <td style="color: #eeeeee;"><%=list.get(i).getNum() %></td>
                        <td style="color: #eeeeee;"><a href="view.jsp?num=<%=list.get(i).getNum()%>"><%=list.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></a></td>
                        <td style="color: #eeeeee;"><%=list.get(i).getUserID() %></td>
                        <td style="color: #eeeeee;"><%=list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11, 13) + "시" 
                        + list.get(i).getBbsDate().substring(14,16) + "분" %></td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <br>
            <%
                if(pageNumber != 1) {
            %>
                <a href="list.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arrow-left">이전</a>
            <%
                } if (bbsDAO.nextPage(pageNumber + 1)) {
            %>
                <a href="list.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left">다음</a>
            
            <%
                }
            %>
            <a href="write.jsp" class="btn pull-right" style="color: #eeeeee;"><b>글쓰기&raquo;</b></a>           
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
