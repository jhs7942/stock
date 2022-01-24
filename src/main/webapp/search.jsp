<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href = "css/main.css">
<script src="js/checkTest.js"></script>
<body>

<main>
	<h3>검색할 주식 코드를 입력하세요.</h3>
	
	<form action="search" method = "get" name="frm">
		<input type = "text" name = "code" class="search"><br>
		<input type = "submit" value = "조회" class="search" onclick="return check_search()">
	</form>
</main>

</body>
</html>