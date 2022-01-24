<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.DBcon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    Connection conn = DBcon.getConnection();
    String code = request.getParameter("code");
    System.out.print("");
    String sql = "delete search_history where code = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, code);
    pstmt.executeUpdate();
    response.sendRedirect("index.jsp");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>