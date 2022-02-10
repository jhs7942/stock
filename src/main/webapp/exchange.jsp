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

<table class="table w-50">
  <thead>
    <tr>
      <th scope="col">국가</th>
      <th scope="col">환율</th>
      <th scope="col">단위</th>
      <th scope="col">전일비</th>
      <th scope="col">변동</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">미국</th>
      <td>${usd.value } </td>
      <td>원/1달러</td>
      <td>${usd.change }</td>
      <td>${usd.blind }</td>
    </tr>
    <tr>
      <th scope="row">중국</th>
      <td>${china.value } </td>
      <td>원/1위안</td>
      <td>${china.change }</td>
      <td>${china.blind }</td>
    </tr>
    <tr>
      <th scope="row">유럽</th>
      <td>${EU.value } </td>
      <td>원/1유로</td>
      <td>${china.change }</td>
      <td>${china.blind }</td>
    </tr>
    <tr>
      <th scope="row">일본</th>
      <td>${japan.value } </td>
      <td>원/100엔</td>
      <td>${japan.change }</td>
      <td>${japan.blind }</td>
    </tr>
  </tbody>
</table>

</body>

</html>