<%@page import="diary.Diary"%>
<%@page import="java.util.ArrayList"%>
<%@page import="diary.DiaryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
		
		int pageNumber = 1;
		
		if(request.getParameter("pageNumber")!= null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

	<div class="joinForm_div">
		<table class="table_content" >
			<thead class="ttr">
				<tr>
					<th class="table_num"> 번호 </th>
					<th class="table_title"> 제목 </th>
					<th class="table_date"> 작성일 </th>
				</tr>
			</thead>
			<tbody>
				<%
					DiaryDAO diaryDAO = new DiaryDAO();
					ArrayList<Diary> list = diaryDAO.getList(pageNumber, userID);
					
					for(int i = 0; i < list.size(); i++){
				%>
						<tr>
							<td class="t1"><%= list.get(i).getID() %></td>
							<td class="t2"><a href="diaryView.jsp?ID=<%= list.get(i).getID() %>"><%= list.get(i).getTitle() %></a></td>
							<td class="t4"><%= list.get(i).getDate().substring(0, 11) + list.get(i).getDate().substring(11, 13) + "시 " + list.get(i).getDate().substring(14, 16) + "분" %></td>
						</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<%
			if(pageNumber != 1){
		%>
				<a href="diary.jsp?pageNumber=<%= pageNumber - 1 %>"> 이전 </a>
		<%
			} if(diaryDAO.nextPage(userID ,pageNumber + 1)){
		%>
			<a href="diary.jsp?pageNumber=<%= pageNumber + 1 %>"> 다음 </a>
		<%
			}
		%>
		
		<a href="diaryWrite.jsp"><button class="snip1535">write</button></a>
	</div>
</html>