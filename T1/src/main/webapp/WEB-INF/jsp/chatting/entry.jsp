<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>까까</title>
<script type="text/javascript" src="../webjars/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript" src="../webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../webjars/vue/2.1.3/vue.js"></script>
<script type="text/javascript" src="../webjars/vue/2.1.3/vue.min.js"></script>

<script type="text/javascript" src="/js/entry.js" charset="utf-8"></script>

<link rel="stylesheet" type="text/css" href="../webjars/bootstrap/3.3.7/css/bootstrap.min.css">

<style type="text/css">
	html{
		height: 100%;
	}
	body{
		margin: 0;
		padding: 0;
		height: 100%;
		background-color: rgb(255, 235, 51);
	}
	
	hr{
		border-top: 1px solid #E4DA09;
		border-bottom: 1px solid #E4DA09;
		margin-left: 13px;
		margin-right: 13px;
		max-width: 300px;
	}
	
	#entry_connect{
		border-radius:2px;
		margin-top: 6px;
		max-width: 300px;
		width: 100%; 
		height: 40px;
		color: #FFFFDE;
		background-color: #574041;
		border:0px;
		font-size: 13px; 
	}
	
	#userid{
		max-width: 300px; 
		height:38px; 
		border-radius: 0; 
		margin-bottom: 0px; 
		outline: none; 
		border-color:#EEDB00;
	}
	
	#password{
		max-width: 300px; 
		height:38px; 
		border-radius: 0; 
		outline:0 none;  
		border-color:#EEDB00;
		
	}
	#password:focus{
		outline:0 none;
		outline-color: red;
	}
	
</style>
 
</head>
<body>
		<div style="margin-left: 10px; margin-right: 10px; position: absolute; top: 30%; right: 0; left: 0;"> 
			<center><img alt="" src="/img/kakaoTalkLogin_.png" style="margin-bottom: 66px;"></center>
			
			<form action="/test/chkidpwd" method="post">
				<center><input id="userid" name="userid" type="text" class="form-control" placeholder="아이디"/></center>
				<center><input id="password" name="password" type="text" class="form-control" placeholder="비밀번호"/></center>
				
				<center><button id="entry_connect" class="btn btn-default" type="submit">로그인</button></center>
			</form>
		</div>
		 
		<div style="position: absolute; bottom: 12px; left: 0; right: 0;">
				<center><hr></center>
		</div>

</body>
</html>