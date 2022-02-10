<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/reload.js"></script>
</head>
<body>

	<table class="table w-50">
  <thead>
    <tr>
      <th scope="col">상품명</th>
      <th scope="col">유가</th>
      <th scope="col">단위</th>
      <th scope="col">전일비</th>
      <th scope="col">변동</th>
    </tr>
  </thead>
  <tbody>
    <tr>
   		<td>WTI</td>
     	<td>${WTI.value }</td>
     	<td>달러/배럴</td>
      	<td>${WTI.change }</td>
      	<td>${WTI.blind }</td>
    </tr>
    <tr>
    	<td>두바이유</td>
     	<td>${dobai.value }</td>
     	<td>달러/배럴</td>
     	<td>${dobai.change }</td>
     	<td>${dobai.blind }</td>
    </tr>
    <tr>
        <td>브렌트유</td>
     	<td>${brant.value }</td>
     	<td>달러/배럴</td>
     	<td>${brant.change }</td>
     	<td>${brant.blind }</td>
    </tr>
  </tbody>
	</table>

</body>
</html>