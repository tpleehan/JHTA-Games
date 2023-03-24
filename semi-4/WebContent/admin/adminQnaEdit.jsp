<%@page import="com.semi4.vo.QnaBoard" %>
<%@page import="com.semi4.dao.QnaBoardDao" %>
<%@page import="com.semi4.vo.QnaAnswer" %>
<%@page import="com.semi4.dao.QnaAnswerDao" %>
<%@page import="com.semi4.vo.Admin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    request.setCharacterEncoding("utf-8");
    // 입력받은 파라미터 값 받아오기
    Admin admin = (Admin)session.getAttribute("LOGINED_ADMIN");
    int qnaNo = Integer.parseInt(request.getParameter("qnano"));
    String answer = request.getParameter("answer");
    String where = request.getParameter("where");

    QnaAnswerDao qnaAnswerDao = QnaAnswerDao.getInstance();
    QnaAnswer qnaAnswer = new QnaAnswer();
    qnaAnswer.setAdmin(admin);
    qnaAnswer.setContent(answer);

    QnaBoard qnaBoard = new QnaBoard();
    qnaBoard.setNo(qnaNo);
    qnaAnswer.setQnaBoard(qnaBoard);

    QnaAnswer foundAnswer = qnaAnswerDao.getQnaAnswerByNo(qnaNo);

    if (foundAnswer == null) {
        qnaAnswerDao.insertQnaAnswer(qnaAnswer);
    } else {
        qnaAnswerDao.updateQnaAnswer(qnaAnswer);
    }

    response.sendRedirect("adminQnadetail.jsp?qnaNo=" + qnaNo + "&where=" + where + "&result=edit");
%>
