<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script src="js/checkTest.js"></script>
<body>

<main>
	<form action="search" method = "get" name="frm" class="text-center">
		<label for="search"><h3>검색할 주식 코드를 입력하세요.</h3></label>
		<input type = "text" name = "code" class="w-25 form-control container center_div" id="search"><br>
		<input type = "submit" value = "조회" class="btn btn-primary" onclick="return check_search()">
	</form>
</main>

</body>
</html>