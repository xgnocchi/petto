<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 글쓰기 writeForm --%>
<h1>writeForm.jsp</h1>

<script type="text/javascript" src="../js/script.js"></script>
<%
	String sid = (String)session.getAttribute("sid");
	if( sid == null ) {
%>
<script>
//	alert("로그인 후 글쓰기 가능.");
//	window.location="../member/main.jsp";
</script>
<%	} %>
<%
	int num=0,ref=1,re_level=0,re_step=0;
	if( request.getParameter("num") != null ) {		// 답글인 경우
		num = Integer.parseInt(request.getParameter("num"));
		ref = Integer.parseInt(request.getParameter("ref"));
		re_level = Integer.parseInt(request.getParameter("re_level"));
		re_step = Integer.parseInt(request.getParameter("re_step"));
		
	}
%>

<center><b>글쓰기</b></center>
<br />
<form action="writePro.jsp" method="post" name="writeForm" onsubmit="return writeCheck()">
	<input type="hidden" name="num" value="<%= num %>" />
	<input type="hidden" name="ref" value="<%= ref %>" />
	<input type="hidden" name="re_level" value="<%= re_level %>" />
	<input type="hidden" name="re_step" value="<%= re_step %>" />
<table width="400" border="1" cellspacing="0" cellpadding="0" align="center" >
	<tr>
		<td align="right" colspan="2">
			<a href="contentList.jsp">글목록</a>
		</td>
	</tr>
	<tr>
		<td width="100" align="center" >작성자</td>
		<td width="300">
			<%= sid %>
			<input type="hidden" name="writer" value="<%= sid %>" />
		</td>
	</tr>
	<tr>
		<td width="100" align="center" >글제목</td>
		<td width="300">
<%		if( request.getParameter("num") == null ) {	//새글 %>
			<input type="text" name="title" size="40" maxlength="50" />
<%		} else { 	// 답글인 경우 %>
			<input type="text" name="title" size="40" maxlength="50" value="답글" />
<%		} %>
		</td>
	</tr>
	<tr>
		<td width="100" align="center" >글내용</td>
		<td width="300">
			<textarea name="content" rows="15" cols="40" ></textarea>
		</td>
	</tr>
	<tr>
		<td width="100" align="center">이미지</td>
		<td width="300">
			<input type="file" name="img" />
		</td>
	</tr>
	<tr>
		<td width="100" align="center" >비밀번호</td>
		<td width="300">
			<input type="password" name="passwd" size="10" maxlength="10" />
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" >
			<input type="submit" value="글쓰기" />
			<input type="reset" value="다시쓰기" />
			<input type="button" value="글목록" onclick="window.location='contentList.jsp'" />
		</td>
	</tr>
</table>
</form>

