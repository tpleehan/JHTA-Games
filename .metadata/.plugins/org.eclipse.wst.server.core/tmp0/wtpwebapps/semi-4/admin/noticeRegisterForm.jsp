<%@page import="com.semi4.dao.GameDao"%>
<%@page import="com.semi4.vo.Publisher"%>
<%@page import="com.semi4.dao.PublisherDao"%>
<%@page import="com.semi4.vo.Genre"%>
<%@page import="java.util.List"%>
<%@page import="com.semi4.dao.GenreDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>관리자 페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript"> $(window).scroll(function(event){ if(jQuery(window).scrollTop() > 
  	jQuery(".banner").offset().top) { jQuery("#chase").css("position", "fixed"); } else if((jQuery(window).scrollTop() 
	< jQuery(".banner").offset().top)) { jQuery("#chase").css("position", "static"); } }); </script>
	<style>
		#admin-list.admin-off {display:none;}
		#game-list.game-off {display:none;}
		.link {color:black; font-weight: bold; }
	</style>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<%@ include file="isLogin.jsp" %>

<div class="container">
	<!-- 관리자 페이지 상단 글씨 -->
	<div class="row">
		<div class="col-sm-12" style="border-bottom:2px solid grey;">
			<h1><a class="link" href="adminMain.jsp" style="text-decoration:none;"><strong>관리자 페이지</strong></a></h1>
			
		</div>
	</div>
	<!-- 관리자 페이지 좌측 tab 선택 부분 -->

	<div class="banner col-sm-3">
		<div id="chase" style="top:0px;">
			<div class="col-sm-12">
				<h4><a class="link" href="adminNotice.jsp" style="text-decoration:none;">공지사항</a></h4>
			</div>
			<div class="col-sm-12">
				<h4><a class="link" href="adminQna.jsp" style="text-decoration:none">QNA 게시판 관리</a></h4>
			</div>
			<div class="col-sm-12">
				<h4><a class="link" href="adminProfits.jsp" style="text-decoration:none">수익 조회</a></h4>
			</div>
			<div class="col-sm-12">
				<h4><a class="link" href="" style="text-decoration:none" onclick="gamelist(event)">게임 관리
				<span class="caret"></span>
				</a></h4>
				<ul id="game-list" class="game-off" style="list-style-type: none;">
					<li style="padding-bottom:5px;"><a class="link" href="adminGameRegisterForm.jsp" style="text-decoration:none">새로운 게임 등록</a></li>
					<li><a class="link" href="adminEditGameForm1.jsp" style="text-decoration:none">게임정보 수정/삭제</a></li>
				</ul>
			</div>
			<div class="col-sm-12">
				<h4><a class="link" href="" style="text-decoration:none" onclick="adminList(event)">관리자 계정 관리
				<span class="caret"></span>
				</a></h4>
				<ul id="admin-list" class="admin-off" style="list-style-type: none;">
					<li style="padding-bottom:5px;"><a class="link" href="adminClientRegisterForm.jsp" style="text-decoration:none">관리자 생성</a></li>
					<li style="padding-bottom:5px;"><a class="link" href="adminClientEditForm.jsp" style="text-decoration:none">관리자 수정</a></li>
					<li ><a class="link" href="adminClientDeleteForm.jsp" style="text-decoration:none">관리자 삭제</a></li>
				</ul>
			</div>
		</div>
	</div>
		
	<!-- 구분선 -->
		
			<!-- 관리자 페이지 우측 메인컨텐츠 부분 -->
			<div class="col-sm-9" style="border-left: 2px solid grey;">

			<div class="row" >
				<div class="col-sm-12">
					<h3 class="text-center" style="font-weight: bold;">새로운 공지사항 작성</h3><br><br>
				</div>
			</div>
			<!-- 공지사항 작성 입력폼 부분 -->
			<div class="row">
				<div class="col-sm-offset-1 col-sm-10">
					<form class="well" method="post" id="register-form" action="noticeRegister.jsp"
						style="font-weight: bold; background-color: #e8ffff;">
						<div class="form-group">
							<label>공지사항 제목</label>
							<input type="text" class="form-control" name="title" id="notice-title" />
						</div>
						<div class="form-group">
							<label>작성자</label>
							<input type="text" class="form-control hidden" name="admin" id="notice-admin" value="<%=loginedAdmin.getId() %>"/>
							<input type="text" class="form-control" name="writer" id="notice-writer" value="<%=loginedAdmin.getName() %>" readonly/>
						</div>
						<div class="form-group">
							<label>본문</label>
							<textarea class="form-control" style="width: 100%; min-height:300px; resize: none; border: 1;" name="content" id="notice-content"></textarea>
						</div>
						<div class="text-right">
							<button onclick="checkFormField()" type="button" class="btn btn-primary" >공지사항 등록</button>
						</div>
					</form>
					
				</div>
			</div>
		</div>
		
	</div>
<%@ include file="../common/footer.jsp" %>
</body>
<script type="text/javascript">
	
	// 입력 폼 값 비어있는지 확인하기
	function checkFormField() {
		//공지사항 제목 공란 확인
		var title = document.querySelector("#notice-title").value;
		if(title == "") {
			alert("제목을 입력하세요");
			return;
		}
		//본문 공란 확인
		var content = document.querySelector("#notice-content").value;
		if(content == "") {
			alert("본문의 내용을 입력하세요");
			return;
		}
		
		document.querySelector("#register-form").submit();
		
	}
	
	function adminList(event) {
		event.preventDefault();
		var value = document.getElementById("admin-list").getAttribute("class");
		if (value == "admin-off"){
			document.getElementById("admin-list").setAttribute("class", "admin-on");
		} else {
			document.getElementById("admin-list").setAttribute("class", "admin-off");
		}
	}


	function gamelist(event) {
		event.preventDefault();
		var value = document.getElementById("game-list").getAttribute("class");
		if (value == "game-off"){
			document.getElementById("game-list").setAttribute("class", "game-on");
		} else {
			document.getElementById("game-list").setAttribute("class", "game-off");
		}
	}
	
</script>
</html>