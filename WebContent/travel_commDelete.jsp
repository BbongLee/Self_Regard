<%@page import="All_comment.*"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <jsp:useBean id="diary" class="diary.Diary" scope="page" />
<jsp:setProperty name="diary" property="title" />
<jsp:setProperty name="diary" property="content" />

<jsp:useBean id="comm" class="All_comment.Comment" scope="page" />
<jsp:setProperty name="comm" property="comment" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
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
		
		//out.print(id);
	
		Travel_CommDAO travel_commDAO = new Travel_CommDAO();
		String comment = request.getParameter("Comment");
		int result = travel_commDAO.delete(ID);
			
		if(result == -1) { 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 삭제에 실패하였습니다.')"); // 데이터베이스 오류
			script.println("history.back()");
			script.println("</script>");
		} 
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'travel_diary.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>