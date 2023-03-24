<%@page import="com.semi4.dao.AdminDao" %>
<%@page import="com.semi4.vo.Pagination1" %>
<%@page import="com.semi4.utils.NumberUtils" %>
<%@page import="com.semi4.utils.DateUtil" %>
<%@page import="com.semi4.vo.NoticeBoard" %>
<%@page import="com.semi4.dao.NoticeBoardDao" %>
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
            String result = request.getParameter("result");
            if ("success".equals(result)) {
        %>
        <div class="row">
            <div class="col-xs-12 text-center">
                <div class="alert alert-success">
                    <strong>공지사항 등록 완료</strong>
                    <p>공지사항 등록이 완료되었습니다.</p>
                </div>
            </div>
        </div>
        <%
            }
            if ("delete".equals(result)) {
        %>
        <div class="row">
            <div class="col-xs-12 text-center">
                <div class="alert alert-success">
                    <strong>공지사항 삭제 완료</strong>
                    <p>공지사항 삭제가 완료되었습니다.</p>
                </div>
            </div>
        </div>
        <%
            }
        %>

        <%
            NoticeBoardDao noticeBoardDao = NoticeBoardDao.getInstance();
            List<NoticeBoard> allNotices = noticeBoardDao.getAllNotice();
            //요청한 페이지 번호
            int pageNo = NumberUtils.stringToNumber(request.getParameter("pageno"), 1);
            //한페이지에 보여질 테이블개수 요청
            int record = NumberUtils.stringToNumber(request.getParameter("record"), 5);
            //검색할 때 무엇으로 검색할지를 요청
            String searchType = request.getParameter("searchtype");
            //검색할 단어 요청
            String searchKeyword = StringUtils.nullToBlank(request.getParameter("searchkeyword"));
            //검색창이 null이 아닐 때 밑에 searchtype과 searchkeyword를 criteria에 담아준다.
            Map<String, Object> criteria = new HashMap<String, Object>();
            if (!searchKeyword.isEmpty()) {
                criteria.put("type", searchType);
                criteria.put("keyword", searchKeyword);
            }
            //총 데이터 개수
            int totalRows = noticeBoardDao.getNoticeBoardBySearchCount(criteria);
            //페이징 처리에 필요한 값들을 제공하는 Pagination객체 생성
            Pagination1 pagination = new Pagination1(pageNo, totalRows, record);
            //데이터 조회
            criteria.put("begin", pagination.getBeginIndex());
            criteria.put("end", pagination.getEndIndex());

            List<NoticeBoard> notices = noticeBoardDao.getNoticeBoardBySearch(criteria);
        %>
        <form class="form-inline" id="search-form" action="adminNotice.jsp" method="get">
            <input type="hidden" name="pageno" id="page-no" value="<%=pageNo %>"/>

            <div class="row">

                <div class="col-sm-12">
                    <h3 class="text-center" style="font-weight: bold;">공지사항 관리</h3><br><br>
                    <div>
                        <div class="col-sm-12 text-right">
                            <select class="form-control" name="record" onchange="searchBoards(1)">
                                <option value="5" <%=record == 5 ? "selected" : "" %>>5개씩</option>
                                <option value="10" <%=record == 10 ? "selected" : "" %>>10개씩</option>
                                <option value="15" <%=record == 15 ? "selected" : "" %>>15개씩</option>
                                <option value="20" <%=record == 20 ? "selected" : "" %>>20개씩</option>
                            </select>
                        </div>
                        <div class="col-sm-12">
                            <table class="table" style="table-layout: fixed">
                                <colgroup>
                                    <col width="15%">
                                    <col width="35%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="20%">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>글번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                    <th>조회수</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%

                                    AdminDao adminDao = AdminDao.getInstance();
                                    for (NoticeBoard notice : notices) {
                                        Admin noticeAdmin = adminDao.getAdminById(notice.getAdmin().getId());
                                %>

                                <tr>
                                    <td><%=notice.getNo() %>
                                    </td>
                                    <td style="text-overflow: ellipsis; overflow: hidden; height: 3px; white-space: nowrap;">
                                        <a href="noticeDetail.jsp?no=<%=notice.getNo() %>&pageno=<%=pageNo %>"><%=notice.getTitle() %>
                                        </a></td>
                                    <td><%=noticeAdmin.getName() %>
                                    </td>
                                    <td><%=DateUtil.dateToString(notice.getCreateDate()) %>
                                    </td>
                                    <td><%=notice.getCount() %>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                            <div class="row">
                                <div class="col-sm-6 text-left">
                                    <select class="form-control" name="searchtype">
                                        <option value="title" <%="title".equals(searchType) ? "selected" : "" %>>제목
                                        </option>
                                        <option value="writer" <%="writer".equals(searchType) ? "selected" : "" %>>작성자
                                        </option>
                                    </select>
                                    <input type="text" class="form-control" name="searchkeyword" id="search-keyword"
                                           value="<%=StringUtils.nullToBlank(searchKeyword) %>"/>
                                    <button type="button" class="btn btn-info" onclick="searchBoards(1)">검색</button>
                                </div>
                            </div>
                            <a href="noticeRegisterForm.jsp">
                                <button class="btn btn-primary pull-right" type="button" style="margin-bottom: 30px;">
                                    글쓰기
                                </button>
                            </a>
                            <div class="row">
                                <div class="col-sm-12 text-center">
                                    <ul class="pagination">
                                        <%
                                            if (pageNo > 1) {
                                        %>
                                        <li><a href="" onclick="searchBoards(<%=pageNo - 1%>, event)">&laquo;</a></li>
                                        <%
                                        } else {
                                        %>
                                        <li class="<%=pageNo == 1 ? "disabled" : "" %>"><a href=""
                                                                                           onclick="searchBoards(1, event)">&laquo;</a>
                                        </li>
                                        <%
                                            }
                                        %>
                                        <%
                                            for (int num = pagination.getBeginPage();
                                                 num <= pagination.getEndPage(); num++) {
                                        %>
                                        <li class="<%=pageNo == num ? "active" : "" %>"><a
                                                href="" onclick="searchBoards(<%=num %>, event)"><%=num %>
                                        </a></li>
                                        <%
                                            }
                                        %>
                                        <%
                                            if (pageNo < pagination.getTotalPageCount()) {
                                        %>
                                        <li><a href="" onclick="searchBoards(<%=pageNo + 1%>, event)">&raquo;</a></li>
                                        <%
                                        } else {
                                        %>
                                        <li
                                                class="<%=pageNo == pagination.getTotalPageCount() ? "disabled" : "" %>">
                                            <a
                                                    href=""
                                                    onclick="searchBoards(<%=pagination.getTotalPageCount() %>, event)">&raquo;</a>
                                        </li>
                                        <%
                                            }
                                        %>
                                    </ul>
                                </div>
                            </div>
                            <hr/>

                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
    function searchBoards(pageno, e) {
        if (e) {
            e.preventDefault();
        }
        // 전달받은 페이지번호를 form의 히든필드에 값으로 담는다.
        document.getElementById("page-no").value = pageno;
        // 폼을 서버로 보낸다.
        // 폼의 pageno, sort, record, searchopt, searchkeyword값이 서버로 제출된다.
        document.getElementById("search-form").submit();
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
