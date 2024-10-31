<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<jsp:useBean id="dto" class="user.UserDTO"/>
<jsp:setProperty name="dto" property="*" />
<%
	try{

		request.setCharacterEncoding("UTF-8");
		UserDAO dao = UserDAO.getInstance();
		
		//유저 아이디 값 받아옴
		String userId = (String)session.getAttribute("sid");
		
		//로그인 상태 확인
		if(userId==null){
			response.sendRedirect("loginForm.jsp"); //로그인페이지로 리다이렉트
			return;
		}

		//유저 비밀번호 DB에서 받아오기		
		String userPw = dto.getUserPw();
		
		//탈퇴처리
		boolean isDel = dao.deleteUser(userId,userPw);
		
	if(isDel){//탈퇴 성공
		session.invalidate();
%>
		<script>
			alert("탈퇴되었습니다.");
			window.location="main.jsp";
		</script>
	
<%	}else{ //탈퇴 실패
%>
		<script>
			alert("비밀번호가 일치하지 않습니다.");
			location.href = document.referrer;//입력값 초기화 하여 이전 페이지로 이동
		</script>
<%}
	}catch(Exception e){
	        e.printStackTrace();
	%>
	        <script>
	            alert("오류가 발생했습니다. 다시 시도해주세요.");
	            history.go(-1);
	        </script>
	<%
	    }
	%>


