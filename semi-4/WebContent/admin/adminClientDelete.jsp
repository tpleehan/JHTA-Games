<%@page import="com.semi4.dao.AdminDao" %>
<%@page import="com.semi4.vo.Admin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    request.setCharacterEncoding("utf-8");
    String adminId = request.getParameter("adminid");
    String password = request.getParameter("password");

    Admin admin = (Admin)session.getAttribute("LOGINED_ADMIN");
    // 비밀번호가 일치하지 않으면 관리자 삭제페이지로 돌려보낸다.
    if (!admin.getPassword().equals(password)) {
        response.sendRedirect("adminClientDeleteForm.jsp?result=nosamepwd");
        return;
    }

    AdminDao adminDao = AdminDao.getInstance();
    adminDao.deleteAdminById(adminId);

    response.sendRedirect("adminClientDeleteForm.jsp?result=success");
%>
