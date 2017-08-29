<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript" src="../webjars/vue/1.0.28/vue.js"></script>
<script type="text/javascript" src="../webjars/vue/1.0.28/vue.min.js"></script>

<link rel="stylesheet" type="text/css" href="/css/vue-material.css"> 
<script type="text/javascript" src="/js/util/vue-material.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<script>
Vue.use(VueMaterial)

var App = new Vue({
  el: '#app'
})

</script>
</head>
<body>

	<h1> LIST </h1>
	
	
	<table border="1">
	
			<thead>	
				<tr>
					<th>id</th>
					<th>email</th>
					<th>password</th>
					<th>-</th>
			</thead>
			
			<tbody>
				<c:forEach var="data" items="${list}">
					<tr>
						<td>${data.ID}</td>
						<td>${data.NAME}</td>
						<td>${data.PWD}</td>
						<td>-</td>
					</tr>
					
				</c:forEach>
			
			</tbody>
		
	
	
	</table> 

	<a href="./add">입력</a>
	


</body>
</html>