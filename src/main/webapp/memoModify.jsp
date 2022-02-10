<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB.DBcon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    String code = request.getParameter("code");
    String memocode = request.getParameter("memocode");
    Connection conn = DBcon.getConnection();
    String sql = "select * from memo where code = ? and memocode = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, code);
    pstmt.setString(2, memocode);
    ResultSet rs = pstmt.executeQuery();
    rs.next();
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	#title{
	
	width : 800px;
	height: 30px;
	
	}

</style>
</head>
<script>
	function move_result(){
		location.href = "result.jsp";
	}
</script>
<link rel="stylesheet" href = "css/main.css">
<link rel="stylesheet" href = "css/result.css">
<jsp:include page="header.jsp"></jsp:include>
<body>
<main>
	<h1>메모</h1>
	<form action="Memo_modify" method="post">
		<input type = "hidden" value = <%=rs.getString("code") %> name = "code">
		<input type = "hidden" value = <%=rs.getString("memocode") %> name = "memocode">
		<div class="mb-3" style="position : relative ; left:550px">
			<input type = "text" name="title" placeholder="제목을 입력하세요." id = "title" value = "<%=rs.getString("title")%>" class="form-control">
		</div>
		<div class="mb-3" style="position : relative ; left:550px">
			<textarea name="text" rows="10" cols="10" placeholder="주요사항을 작성하세요." style="width: 800px;" class="form-control" style="position : relative ; left:600px"><%=rs.getString("text")%></textarea>
		</div>
		<input type="submit" value="수정" class="btn btn-primary">
		<input type="button" value="뒤로가기" onclick="move_result()" class="btn btn-warning">
	</form>
</main>
</body>
<%

conn.close();
pstmt.close();
rs.close();
%>
</html>