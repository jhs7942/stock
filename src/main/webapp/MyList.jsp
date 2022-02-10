<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- <script src="js/reload.js"></script> -->
<style>

	#MyList {
		
		margin-right : 100px;
		float:right;
		line-height: 50px;
		margin-top: 10px;
	}

</style>
<body>
	<form action="MyList_delete" method="get">
		<div id="price">
		<table id="MyList">
			<th><input type="checkbox" id="all"></th>
			<th colspan="2">관심목록</th>
			<c:forEach var="company" items="${ MyList}" varStatus = "status">	
				<tr>
					<th width="40%"><input type="checkbox" class="chk" name="code" value="${company.code}"></th>
						<td><a href="search?code=${company.code}">${company.name }</a></td>
<%-- 						<td >${company.price }</td> --%>
				</tr>
			</c:forEach>
			<tr><th><input type="submit" value="삭제" id="delete" class="btn btn-danger"><th></tr>
		</table>
		</div>
	</form>
<script src="js/checkbox.js"></script>
</body>
</html>