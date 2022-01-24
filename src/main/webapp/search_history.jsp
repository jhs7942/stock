<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.DBcon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    Connection conn = DBcon.getConnection();
    String sql = "select * from search_history";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

	#history{
	
	margin-right : auto;
	margin-left : auto;
	
	}

</style>
<body>

<h1>검색 기록</h1>
<table id="history" >
	<tr>
		<%while(rs.next()){ %>
		
			<th width="150px"><a href="search?code=<%=rs.getString("code")%>"><%=rs.getString("name") %></a>  <a href="search_history_delete.jsp?code=<%=rs.getString("code")%>">X</a></th>
		<%} 
		
		pstmt.close();
		conn.close();
		rs.close();
		
		%>		
		</tr>		
</table>
</body>
</html>