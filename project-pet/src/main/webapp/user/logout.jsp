<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 로그아웃 --%>
<%
	// 모든 세션 삭제
	session.invalidate();
	response.sendRedirect("main.jsp");
%>