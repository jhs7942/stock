<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href = "css/main.css">
<link rel="stylesheet" href = "css/result.css">
<script src="js/reload.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<main>
	<section>
		<h2>종목명</h2>
		${name }
		<h2>현재 주가</h2>
		<div id="price">${price }</div><br>
	</section>
	<form action="MyList_reigst" method = "get">
		<input type = "hidden" value = ${code } name = "code">
		<input type="hidden" value = ${name } name = "name">
		<input type="button" value = "홈으로" onclick="move_index()">
		<input type = "submit" value = "관심목록 추가">
	</form>
	<hr>
	<jsp:include page="memo.jsp"></jsp:include>
</main>
<script src="js/checkbox.js"></script>
</body>
</html>