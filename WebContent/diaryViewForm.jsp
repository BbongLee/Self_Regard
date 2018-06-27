<%@page import="diary.DiaryDAO"%>
<%@page import="diary.Diary"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/view_css.css">
<link type="text/css" rel="stylesheet" href="css/proc_css.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		
		int ID = 0;
		if(request.getParameter("ID") != null){
			ID = Integer.parseInt(request.getParameter("ID"));
		}
		
		if(ID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		
		Diary diary = new DiaryDAO().getDiary(ID, userID);
	%>

	<div class="joinForm_div">
		<table class="table table-striped" id="table_content">
			<thead>
				<tr>
					<th colspan="3" class="view_name"><%= diary.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></th>
				</tr>
			</thead>
			<tbody>
				<tr class="ttt">
					<td class="tt1"> 작성자 </td>
					<td class="tt1_1"><%= userID %></td>
					<td class="tt2"><%= diary.getDate().substring(0, 11) + diary.getDate().substring(11, 13) + "시 " + diary.getDate().substring(14, 16) + "분" %></td>
				</tr>
				<tr>
					<td colspan="3" class="t_content" style="min-height: 200px; text-align: left;">
					<%= diary.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
					</td>
				</tr>
			</tbody>
		</table>
		
		<a  class="m_a" href="diary.jsp">목록</a>
		<%
			if(userID != null){
		%>
			<a class="m_a" href="diaryUpdate.jsp?ID=<%= ID %>">수정</a>
			<a class="m_a"onclick="return confirm('정말로 삭제하시겠습니까?')" href="diaryDelete.jsp?ID=<%= ID %>">삭제</a>
		<%
			}
		%>
		<br>
		<a href="diaryWrite.jsp"><button class="snip1535">write</button></a>
	</div>
</html>