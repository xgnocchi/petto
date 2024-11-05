<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%
	String currentNick = (String)session.getAttribute("sNick"); //기존 닉네임 
    String nick = request.getParameter("userNick");//폼에 입력한 nick 값
    UserDAO dao = UserDAO.getInstance();
    boolean result = dao.confirmNick(nick,currentNick); // 닉네임 중복 검사 메서드 호출
    System.out.println("원래닉네임: "+currentNick+" 바꿀닉네임:"+nick);
    if (result) {
    	out.print("unavailable");
    } else {
    	out.print("available");
    }
%>