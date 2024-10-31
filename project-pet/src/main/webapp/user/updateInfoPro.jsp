<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@	page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>    
<%	request.setCharacterEncoding("UTF-8");
	UserDTO dto = new UserDTO();
	String sid = (String)session.getAttribute("sid");
	
	
	if(sid==null){
		response.sendRedirect("loginForm.jsp");
	}
	dto.setUserId(sid);
		
	String filePath = request.getRealPath("resources/image");
	int max=1024*1024*5;
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,filePath,max,"UTF-8",dp);
	
	// 기존 이미지 이름
	String orgImg = mr.getParameter("orgImg");
	// 변경 이미지 이름
	String img = mr.getFilesystemName("img");
	

	if(img==null || img.equals("profile-image.png")){//수정값 없을 때
		dto.setProfileImg(orgImg);//원래 img 값 넣기
	}else{//수정값 있음
		dto.setProfileImg(img);
	}
	
	String userId=mr.getParameter("userId");
	dto.setUserId(userId);
	dto.setUserNick(mr.getParameter("userNick"));
	dto.setEmail(mr.getParameter("email"));
	
	File f = new File(filePath+"/"+orgImg); // views/upload/기존img이름
	
	// DB 작업
	UserDAO dao = UserDAO.getInstance();
	dao.updateUser(dto);
%>
	<script>
		alert("글이 수정되었습니다.");
		window.location="myPage.jsp";			
	</script> 
