<%@page import="com.semi4.dao.GameDao"%>
<%@page import="com.semi4.vo.Game"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.semi4.utils.StringUtils"%>
<%@page import="com.semi4.vo.Admin"%>
<%@page import="com.semi4.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // 세션 객체에서 LOGINED_USER로 저장된 사용자객체를 조회
   request.setCharacterEncoding("utf-8");
   User loginedUser = (User) session.getAttribute("LOGINED_USER");
   Admin loginedAdmin = (Admin) session.getAttribute("LOGINED_ADMIN");
%>     
<nav style="background-color: #000000;">
     <div class="container" style="padding-bottom: 10px;">
       <div class="navbar-header" style="padding-top: 20px;">
          <a class="navbar-brand" href="/semi-4/home.jsp" style="font-size:30px; color: #ffffff;">JHTA Games</a>
          
          <% 	
          	String bigKeyword = StringUtils.nullToBlank(request.getParameter("bigkeyword"));
          	       	
          %> 
          <form class="navbar-form navbar-left" id="bigkeyword-form" method="get" action="/semi-4/purchase/searchform.jsp">
             <div class="form-group">
                <input type="text" name="bigkeyword" id="keyword-search" class="form-control" placeholder="Search" style="width: 475px;" value="<%=bigKeyword %>">
                <button class="btn btn-default" type="button" onclick="bigSearch()">
                    <i class="glyphicon glyphicon-search"></i>
                </button>
             </div>
          </form>
      
       </div>

       
       <%
         if(loginedUser != null) {
            if(loginedAdmin != null) {
       %>
           <ul class="nav navbar-nav navbar-right" style="padding-top:20px;">
                <li style="font-size: 18px;"><a href="/semi-4/logout.jsp" style="color: #ffffff; background-color: #000000;"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
                <li style="font-size: 18px;"><a href="/semi-4/admin/adminMain.jsp" style="color: #ffffff; background-color: #000000;"><span class="glyphicon glyphicon-eye-open"></span> 관리자페이지</a></li>
             </ul> 
       <%
            } else {
       %>
	       <ul class="nav navbar-nav navbar-right" style="padding-top:20px;">
	          <li style="font-size: 18px;"><a href="/semi-4/logout.jsp" style="color: #ffffff; background-color: #000000;"><span class="glyphicon glyphicon-log-out" style="color: #ffffff;"></span> 로그아웃</a></li>
	          <li style="font-size: 18px;"><a href="/semi-4/user/userinfoform.jsp" style="color: #ffffff; background-color: #000000;"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
	          <li>
		          <a href="/semi-4/purchase/cart.jsp" style="padding:0px; margin-top:10px; background-color: #000000;">
		          <button type="button" class="btn btn-default btn-sm glyphicon glyphicon-shopping-cart default" style="font-size: 14px;">
		          </button>
		          </a>
	          </li>
	       </ul>

      <%
      
            }
        }
      %>
       
       <%
         if(loginedUser == null) {
      %>
       <div class="nav navbar-nav navbar-right" style="padding-top:30px;">
          <a href="/semi-4/loginform.jsp" style="padding:0px;"><button type="button" class="btn btn-default btn" style="font-size: 16px;" >로그인</button></a>
          <a href="/semi-4/user/registerform.jsp" style="padding:0px;"><button type="button" class="btn btn-default btn" style="font-size: 16px;">회원가입</button></a>
          <a href="/semi-4/loginform.jsp" style="padding:0px; margin-top:10px">
	          <button type="button" class="btn btn-default btn-sm glyphicon glyphicon-shopping-cart default" 
	          			onclick="clickcart()" style="font-size: 16px; margin-bottom: 2px;">
	          </button>
          </a>
       </div>
       
      <%
         }
      %>    
     </div>
     <div class="row" style="background-color: #ffffff;">
     
        <div class="container" style="padding: 10px;">
             <ul class="nav navbar-nav">
                <li class="active" style="font-size: 20px;"><a href="/semi-4/home.jsp" style="background-color: #ffffff" >홈</a></li>
                <li style="font-size: 20px;"><a href="/semi-4/purchase/gamemenu.jsp" style="background-color: #ffffff">게임</a></li>
                <li class="dropdown">
                   <a class="dropdown-toggle" data-toggle="dropdown" href="" style="background-color: #ffffff; font-size: 20px;">고객지원
                       <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                       <li style="font-size: 16px;"><a href="/semi-4/board/noticeboard/noticeboard.jsp">공지사항</a></li>
                       <li style="font-size: 16px;"><a href="/semi-4/board/qnaboard/qnaboard.jsp">QnA 게시판</a></li>
                       <li style="font-size: 16px;"><a href="/semi-4/board/reviewboard/reviewboard.jsp">리뷰 게시판</a></li>
                    </ul>
                </li>
                <li style="font-size: 20px;"><a href="/semi-4/event/eventmain.jsp" style="background-color: #ffffff">이벤트</a></li>
             </ul>
             
             <ul class="nav navbar-nav navbar-right" >
                <li style="border:none;box-shadow:none"><button type="button" class="btn btn-default glyphicon glyphicon-thumbs-up" onclick="clickFacebook()" style="background:#4e69a2;color:#ffffff;border:none;margin-top:10px;margin-right:10px; font-size: 15px;"><i class="fab fa-facebook" style="background:#4e69a2;color:#ffffff;"></i> 페이스북</button></li>
                <li style="border:none;box-shadow:none"><button type="button" class="btn btn-default glyphicon glyphicon-expand" onclick="clickYoutube()" style="background:#ff0000;color:#ffffff;border:none;margin-top:10px; font-size: 15px;"><i class="fab fa-youtube-play" style="background:#ff0000;color:#ffffff"></i> 유튜브</button></li>
             </ul>
         </div>
      </div>
</nav>

<script type="text/javascript">
   function clickFacebook() {
      window.open("http://www.facebook.com/");
   }
   function clickYoutube() {
      window.open("http://www.youtube.com/");
   }
   function clickcart() {
      alert("로그인 후 이용하세요.")
      return;
   }
   
   function bigSearch() {
	 
	   var bigkeyword = document.getElementById("keyword-search").value;
	  
	   if (bigkeyword == "") {
		   alert("검색어를 입력하세요.")
		   return;
	   }
	
	   document.getElementById("bigkeyword-form").submit();
   }
</script>