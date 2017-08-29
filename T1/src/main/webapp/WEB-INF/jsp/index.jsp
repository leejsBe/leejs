<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	Hello JSP index world~!!~ 안녕ㅎ세요
	${name}
	
	
	<br/>
	
	<table border="1">
			<thead>
				<tr>
					<th>id</th>
					<th>name</th>
					<th>pwd</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="data" items="${list}">
					<tr>
						<td>${data.ID}</td>
						<td>${data.NAME}</td>
						<td>${data.PWd}</td>
					</tr>
					
				
				</c:forEach>
			
			</tbody>
		
	</table>
	
</body>
</html>