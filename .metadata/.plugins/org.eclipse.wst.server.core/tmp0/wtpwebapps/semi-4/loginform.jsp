<%@page import="com.semi4.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
     <title>JHTA Games</title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<%@ include file="common/navbar.jsp" %>
<body>
<div class="container" style="height: 640px;">
   <div id="loginmainbody" class="col-sm-12">
      <div class="row"> 
         <div class="head-right col-sm-6 col-sm-offset-3" style="padding-top: 10px;">
            <h3>로그인</h3>
            <%
               String fail = request.getParameter("fail");
            %>
            
            <%
               if ("invalid".equals(fail)) {
            %>
               <div class="row">
                  <div class="col-sm-12">
                     <div class="alert alert-danger">
                        <strong>아이디 혹은 비밀번호가 일치하지 않습니다.</strong> 
                     </div>
                  </div>
               </div>
            <%
               }
            %>
            
            <%
               if ("exituser".equals(fail)) {
            %>
               <div class="row">
                  <div class="col-sm-12">
                     <div class="alert alert-danger">
                        <strong>탈퇴된 고객은 이용불가능합니다. 회원가입 후 이용하시기 바랍니다.</strong> 
                     </div>
                  </div>
               </div>
            <%
               }
            %>   
            
            <form class="well" action="" method="post" id="login-form">
               <div class="form-group">
                  <label>아이디</label>
                  <input type="text" class="form-control" name="userid" id="user-id"/>
               </div>
               <div class="form-group">
                  <label>비밀번호</label>
                  <input type="password" class="form-control" name="userpwd" id="user-pwd"/>
               </div>
                <div class="form-group has-error">
               <div class="checkbox">
                   <label><input type="checkbox" name="admincheck" id="admincheck">관리자 체크 </label>
                   <span class="help-block"><small>관리자만 체크하세요</small></span>
                 </div>
            </div>
               <div class="text-right">
                  <button onclick="loginFormfield()" type="button" class="btn btn-primary" style="margin-top: 20px;">로그인</button>
               </div>
               <div class="form-group">
                  <label style="margin-top: 15px;">
                     <a href="/semi-4/user/pwdsearchform.jsp"  style="margin-right: 5px;">비밀번호 찾기</a>
                     <a href="/semi-4/user/registerform.jsp"  style="margin-left: 10px;">회원가입</a>
                  </label>
               </div>
            </form>
         </div>
      </div>
    </div>
</div>

<script type="text/javascript">
   function loginFormfield() {
        // 관리자 체크박스의 체크여부를 반환
      var checkedStatus = document.querySelector("#admincheck").checked;
        // 관리자 체크박스가 체크되어 있지 않으면 수행
      if(!checkedStatus) {
         // id가 login 인 엘리먼트를 반환하고 그 action 값에 "login.jsp"를 넣는다.
         document.getElementById("login-form").action = "login.jsp"
            
            var id = document.querySelector("#user-id").value;
            if (id == "") {
                alert("아이디를 입력하세요.");
                return;
            }
            var pwd = document.querySelector("#user-pwd").value;
            if (pwd == "") {
                alert("비밀번호를 입력하세요.");
                return;
            }
            
      // 관리자 체크박스가 체크되어 있으면 수행
      }else {
         // id가 login 인 엘리먼트를 반환하고 그 action 값에 "adminlogin.jsp"를 넣는다.
         document.getElementById("login-form").action = "admin/adminlogin.jsp"
      }
        
        document.querySelector("#login-form").submit();
    }
</script>
</body>
<%@ include file="../common/footer.jsp" %>
</html>