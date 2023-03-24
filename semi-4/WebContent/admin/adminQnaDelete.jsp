<%@page import="com.semi4.vo.QnaAnswer" %>
<%@page import="com.semi4.dao.QnaAnswerDao" %>
<%@page import="com.semi4.vo.QnaBoard" %>
<%@page import="com.semi4.dao.QnaBoardDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    int no = Integer.parseInt(request.getParameter("qnano"));
    String where = request.getParameter("where");

    QnaAnswerDao qnaAnswerDao = QnaAnswerDao.getInstance();
    qnaAnswerDao.deleteQnaAnswerbyQnaNo(no);

    QnaBoardDao qnaBoardDao = QnaBoardDao.getInstance();
    qnaBoardDao.deleteQnaBoard(no);

    response.sendRedirect("deleteQnaPopup.jsp?qnano=" + no + "&result=delete&where=" + where);
%>
