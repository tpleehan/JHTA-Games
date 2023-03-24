<%@page import="com.semi4.vo.Admin" %>
<%@page import="com.semi4.dao.AdminDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    request.setCharacterEncoding("utf-8");

    // 수정폼에서 보낸 파라미터값 읽어오기
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String grade = request.getParameter("grade");

    // 관리자 정보 수정하기
    AdminDao adminDao = AdminDao.getInstance();
    Admin foundAdmin = adminDao.getAdminById(id);

    //읽어온 파라미터 값 관리자 객체에 집어넣기
    foundAdmin.setPassword(password);
    foundAdmin.setName(name);
    foundAdmin.setGrade(grade);
    // 관리자 객체 수정하기
    adminDao.updateAdmin(foundAdmin);

    // 관리자 수정폼으로 돌려보내기
    response.sendRedirect("adminClientEditForm.jsp?result=success");
%>
