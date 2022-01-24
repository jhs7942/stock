<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id ="exchange_rate" style="text-align: left;">
		<h1>환율</h1>
		<h3 class="exchange_rate">
			미국 환율
			${usd.value } 원/1달러 <span class="change"> ${usd.change }</span> ${usd.blind }
		</h3>
		<h3 class="exchange_rate">
			중국 환율
			${china.value } 원/1위안 <span class="change">${china.change }</span> ${china.blind }
		</h3>
		<h3 class="exchange_rate">
			유럽 환율
			${EU.value } 원/1유로 <span class="change">${EU.change }</span> ${EU.blind }
		</h3>
		<h3 class="exchange_rate">
			일본 환율
			${japan.value } 원/100엔 <span class="change">${japan.change }</span> ${japan.blind }
		</h3>
	</div>
</body>

</html>