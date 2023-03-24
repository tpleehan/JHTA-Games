<%@page import="java.util.List" %>
<%@page import="com.semi4.dao.AdminDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>관리자 페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script type="text/javascript"> $(window).scroll(function (event) {
        if (jQuery(window).scrollTop() >
            jQuery(".banner").offset().top) {
            jQuery("#chase").css("position", "fixed");
        } else if ((jQuery(window).scrollTop()
            < jQuery(".banner").offset().top)) {
            jQuery("#chase").css("position", "static");
        }
    }); </script>
    <style>
        #admin-list.admin-off {
            display: none;
        }

        #game-list.game-off {
            display: none;
        }

        .link {
            color: black;
            font-weight: bold;
        }
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
                    <li style="padding-bottom:5px;"><a class="link" href="adminGameRegisterForm.jsp"
                                                       style="text-decoration:none">새로운 게임 등록</a></li>
                    <li><a class="link" href="adminEditGameForm1.jsp" style="text-decoration:none">게임정보 수정/삭제</a></li>
                </ul>
            </div>
            <div class="col-sm-12">
                <h4><a class="link" href="" style="text-decoration:none" onclick="adminList(event)">관리자 계정 관리
                    <span class="caret"></span>
                </a></h4>
                <ul id="admin-list" class="admin-off" style="list-style-type: none;">
                    <li style="padding-bottom:5px;"><a class="link" href="adminClientRegisterForm.jsp"
                                                       style="text-decoration:none">관리자 생성</a></li>
                    <li style="padding-bottom:5px;"><a class="link" href="adminClientEditForm.jsp"
                                                       style="text-decoration:none">관리자 수정</a></li>
                    <li><a class="link" href="adminClientDeleteForm.jsp" style="text-decoration:none">관리자 삭제</a></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- 구분선 -->

    <!-- 관리자 페이지 우측 메인컨텐츠 부분 -->
    <div class="col-sm-9" style="border-left: 2px solid grey; height:567px;">
        <%
            AdminDao adminDao = AdminDao.getInstance();
            Admin getAdmin = (Admin)session.getAttribute("LOGINED_ADMIN");
            String grade = getAdmin.getGrade();
            if ("N".equals(grade)) {
        %>
        <div class="row">
            <div class="col-sm-12">

            </div>
            <div class="row">
                <div class="col-sm-offset-1 col-sm-10">
                    <div class="row">
                        <div class="col-xs-12 text-center" style="height:500px;">
                            <div class="alert alert-danger"
                                 style="height:200px;display:table-cell;vertical-align:middle; width:800px;">
                                <p><strong>관리자 권한 제한</strong></p>
                                <p>일반등급 관리자는 관리자 계정을 삭제 할 수 없습니다.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
        } else if ("S".equals(grade)) {
        %>
        <%
            String result = request.getParameter("result");
            if ("success".equals(result)) {
        %>
        <div class="row">
            <div class="col-xs-12 text-center">
                <div class="alert alert-success">
                    <strong>관리자 삭제 완료</strong>
                    <p>관리자 삭제가 완료되었습니다.</p>
                </div>
            </div>
        </div>
        <%
            }
            if ("nosamepwd".equals(result)) {
        %>
        <div class="row">
            <div class="col-xs-12 text-center">
                <div class="alert alert-danger">
                    <strong>관리자 삭제 실패</strong>
                    <p>비밀번호를 확인하시기 바랍니다.</p>
                </div>
            </div>
        </div>
        <%

            }
        %>
        <div class="row">
            <div class="col-sm-12">
                <h3 class="text-center" style="font-weight: bold;">관리자 삭제하기</h3><br><br>
                <p class="alert alert-info"> 자기 자신의 관리자 아이디는 삭제할 수 없습니다.</p>
            </div>
            <div class="row">
                <div class="col-sm-offset-1 col-sm-10">
                    <form class="well" method="post" id="delete-form" action="adminClientDelete.jsp">
                        <div class="form-group">
                            <label style="font-weight: bold;">관리자 선택</label>
                            <select class="form-control inputbox" name="adminid" id="admin-id">
                                <%
                                    List<Admin> allAdmins = adminDao.getAllAdmins();
                                    for (Admin foundAdmin : allAdmins) {
                                %>

                                <option value="<%=foundAdmin.getId() %>" <%=
                                foundAdmin.getId().equals(getAdmin.getId()) ? "hidden" : "" %>>
                                    아이디:<%=foundAdmin.getId() %>, 이름:<%=foundAdmin.getName() %>,
                                    등급: <%=foundAdmin.getGrade() %>
                                </option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label><strong style="color: red;">삭제확인 </strong>- 현재 관리자 비밀번호 입력</label>
                            <input type="password" class="form-control" name="password" id="password"/>
                        </div>
                        <div class="text-right">
                            <button onclick="deleteAdminClient()" class="btn btn-danger" id="edit-button">관리자 삭제
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%
            }
        %>

    </div>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
    function deleteAdminClient() {
        var password = document.querySelector("#password").value;
        if (password == "") {
            alert("비밀번호를 입력하세요");
            return;
        }

        document.querySelector("#delete-form").submit();
    }

    function adminList(event) {
        event.preventDefault();

        var value = document.getElementById("admin-list").getAttribute("class");
        if (value == "admin-off") {
            document.getElementById("admin-list").setAttribute("class", "admin-on");

        } else {
            document.getElementById("admin-list").setAttribute("class", "admin-off");
        }

    }


    function gamelist(event) {
        event.preventDefault();

        var value = document.getElementById("game-list").getAttribute("class");
        if (value == "game-off") {
            document.getElementById("game-list").setAttribute("class", "game-on");

        } else {
            document.getElementById("game-list").setAttribute("class", "game-off");
        }
    }
</script>
</body>
</html>
