<%@page import="com.semi4.vo.QnaAnswer" %>
<%@page import="com.semi4.dao.QnaAnswerDao" %>
<%@page import="com.semi4.dao.UserDao" %>
<%@page import="com.semi4.vo.QnaBoard" %>
<%@page import="com.semi4.dao.QnaBoardDao" %>
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
    <div class="col-sm-9" style="border-left: 2px solid grey;">
        <%
            request.setCharacterEncoding("utf-8");
            int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
            String where = request.getParameter("where");
            String result = request.getParameter("result");
            if ("edit".equals(result)) {
        %>
        <div class="row">
            <div class="col-xs-12 text-center">
                <div class="alert alert-success">
                    <strong>Q&amp;A 수정 완료</strong>
                    <p>수정이 완료되었습니다.</p>
                </div>
            </div>
        </div>
        <%
            }
        %>

        <div class="row" style="height:500px;">
            <div class="col-sm-12" style="border-bottom: 1px solid grey;">
                <h3 class="text-center" style="font-weight: bold;">Q&amp;A 게시글 상세보기</h3>
                <hr/>
                <div>
                    <table class="table" style="border: 2px solid grey;">
                        <colgroup>
                            <col width="20%">
                            <col width="60%">
                        </colgroup>
                        <%

                            QnaBoardDao qnaBoardDao = QnaBoardDao.getInstance();
                            QnaBoard board = qnaBoardDao.getBoardByQnaNo(qnaNo);
                            UserDao userDao = UserDao.getInstance();
                            User foundUser = userDao.getUserByNo(board.getUser().getNo());
                            QnaAnswerDao qnaAnswerDao = QnaAnswerDao.getInstance();
                            QnaAnswer answer = qnaAnswerDao.getQnaAnswerByNo(qnaNo);

                        %>
                        <tr>
                            <th class="info">글번호</th>
                            <th><%=board.getNo() %>
                            </th>
                        </tr>
                        <tr>
                            <th class="info">제목</th>
                            <th><%=board.getTitle() %>
                            </th>
                        </tr>
                        <tr>
                            <th class="info">글쓴이</th>
                            <th><%=foundUser.getName() %>
                            </th>
                        </tr>
                        <tr>
                            <th class="info">본문</th>
                            <th><textarea class="col-12" style="width: 100%; min-height:300px; resize: none; border: 0;"
                                          readonly><%=board.getContent() %></textarea></th>
                        </tr>
                        <tr>
                            <th class="info">조회수</th>
                            <th style="padding-bottom: 50px;"><%=board.getCount() %>
                            </th>
                        </tr>

                    </table>
                    <hr/>

                    <form id="qnaAnswer-form" action="adminQnaEdit.jsp" method="post">
                        <button class="btn btn-primary btn-xs"
                                style="padding: 7px; margin-left: 20px; margin-bottom: 10px;">답변내용
                        </button>
                        <label style="margin-left: 50px;">답변자 : <%=loginedAdmin.getName() %>
                        </label>
                        <div class="col-sm-12">
                            <input class="form-control hidden" type="text" name="qnano" value="<%=board.getNo() %>">
                            <input class="form-control hidden" type="text" name="where" id="where" value="<%=where %>">
                            <textarea class="form-control" id="answer" rows="8"
                                      style="width: 100%; resize: none; border: 1px solid grey; font-weight: bold; color: black;"
                                      name="answer" onclick="answercheck()"><%=answer == null ? "답변이 없습니다." :
                                    answer.getContent() %></textarea>

                        </div>

                        <div class="col-sm-12">
                            <%
                                if ("all".equals(where)) {
                            %>
                            <a href="adminQna.jsp">
                                <button class="btn btn-success pull-right" type="button" style="margin: 20px 10px;">
                                    목록으로
                                </button>
                            </a>
                            <%
                            } else if ("completed".equals(where)) {
                            %>
                            <a href="adminQnaAnswerCompleted.jsp">
                                <button class="btn btn-success pull-right" type="button" style="margin: 20px 10px;">
                                    목록으로
                                </button>
                            </a>
                            <%
                            } else if ("ready".equals(where)) {
                            %>
                            <a href="adminQnaNoAnswer.jsp">
                                <button class="btn btn-success pull-right" type="button" style="margin: 20px 10px;">
                                    목록으로
                                </button>
                            </a>
                            <%
                                }
                            %>
                            <button class="btn btn-primary pull-right" type="button" onclick="doAnswer()"
                                    style="margin: 20px 10px;">답변/수정
                            </button>
                            <button class="btn btn-danger pull-right" type="button" onclick="deleteqna(<%=qnaNo %>)"
                                    style="margin: 20px 10px;">삭제
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
    function deleteqna(no) {
        var where = document.getElementById("where").value;
        window.open("deleteQnaPopup.jsp?qnano=" + no + "&where=" + where + "", "deleteCheck", "width=500,height=300,resizable=0");
    }

    function doAnswer() {
        var answer = document.getElementById("answer").value;
        if (answer == "") {
            alert("답변을 입력하세요");
            return;
        }
        document.getElementById("qnaAnswer-form").submit();

    }

    function answercheck() {
        var answer = document.getElementById("answer").value;
        if (answer == "답변이 없습니다.") {
            document.getElementById("answer").value = "";
        }
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
