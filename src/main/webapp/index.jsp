<%@page import="service.MyList"%>
<%@page import="info.Oil"%>
<%@page import="info.exchange_rate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    MyList m = new MyList(); //관심목록
    exchange_rate ex = new exchange_rate(); //환율
    Oil oil = new Oil(); //유가
    
	//주가
	request.setAttribute("MyList", m.List());
    
  	//환율
	request.setAttribute("usd", ex.today("미국"));
	request.setAttribute("japan", ex.today("일본"));
	request.setAttribute("EU", ex.today("유럽"));
	request.setAttribute("china", ex.today("중국"));
    
	//유가
	request.setAttribute("WTI", oil.today("WTI"));
	request.setAttribute("dobai", oil.today("두바이"));
	request.setAttribute("brant", oil.today("브렌트"));
	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<jsp:include page="header.jsp"></jsp:include>

<main>
	<jsp:include page="search.jsp"></jsp:include>
	<jsp:include page="MyList.jsp"></jsp:include>
	<section>
		<div class="group1">
			<jsp:include page="exchange.jsp"></jsp:include>
		</div>
		<div class="group2">
			<jsp:include page="Oil.jsp"></jsp:include>
		</div>
	</section>
	<footer>
		<jsp:include page="search_history.jsp"></jsp:include>
	</footer>
</main>
</body>
</html>