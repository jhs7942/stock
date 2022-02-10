<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.DBcon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%	
    String code = (String)session.getAttribute("code");
    boolean result = true;// 등록된 메모의 수가 0개면 메모가 출력되지 않도록 하기 위함
    Connection conn = DBcon.getConnection();
    String sql = "SELECT COUNT(text) count FROM memo where code = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, code);
    ResultSet rs = pstmt.executeQuery();
    rs.next();
    int memocode = 0;
    if(rs.getInt("count") == 0){
    	result = false;
    	memocode = 1; //새로 등록할 메모의 메모코드
    }else {
    	sql = "select max(memocode)+1 memocode from memo where code = ?";
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, code);
    	rs = pstmt.executeQuery();
    	rs.next();
    	memocode = rs.getInt("memocode");//새로 등록할 메모의 메모코드
    }
    
    session.setAttribute("result", result);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section2>
		<h1>메모</h1>
		<form action="Memo_regist" method="post" class="text-center" style="margin-left : 700px;">
			<input type = "hidden" value = ${code } name = "code">
			<input type = "hidden" value = <%=memocode %> name = "memocode">
			<div class="mb-3">
				<input type = "text" name="title" placeholder="제목을 입력하세요." id="title" class="form-control">
			</div>
			<div class="mb-3">
				<textarea rows="10" cols="10" name="text" placeholder="주요사항을 작성하세요." style="width: 800px;" class="form-control"></textarea>
				<input type="submit" value="등록" class="btn btn-secondary" style="position : relative ; left:140px">
			</div>
		</form>
	</section2>

	<section3>
	<h1>메모 목록</h1>
	<form action="Memo_delete" method="post">
		<table id = "memoList">
			<tr>
				
				<td><input type="checkbox" id="all"></td>
				<th>제목</th>
				<td></td>
			</tr>
	<%
	
	
	
	conn = DBcon.getConnection();
	sql = "SELECT * FROM memo where code = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, code);
	rs = pstmt.executeQuery();
	
	if(result){
	while(rs.next()){
		%>
			
		<tr>
			<td>
				<input type = "hidden" value="<%=rs.getString("code") %>" name = "code">
				<input type="checkbox" class="chk" name="memocode" value="<%=rs.getString("memocode")%>">
			</td>
			<td>
				<a href="memoModify.jsp?code=<%=rs.getString("code") %>&memocode=<%=rs.getString("memocode")%>"><%=rs.getString("title") %></a>
			</td>
			<td></td>
			<td style="width: 300px;"><%=rs.getString("regDate") %></td>
		</tr>
		
	<%}
	} 
	
	conn.close();
	pstmt.close();
	rs.close();
	
	%>
			<tr>
				<td></td>
				<td></td>
				<td><input type="submit" value="삭제" id="delete" class="btn btn-danger"></td>
				
			</tr>
		</table>
	</form>
	</section3>
</body>
</html>