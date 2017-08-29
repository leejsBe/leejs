<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic">
<link rel="stylesheet" href="//fonts.googleapis.com/icon?family=Material+Icons">
<script type="text/javascript" src="../webjars/sockjs-client/1.0.2/sockjs.min.js"></script>
<script type="text/javascript" src="../webjars/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript" src="../webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../webjars/stomp-websocket/2.3.3/stomp.min.js"></script>

<script type="text/javascript" src="/js/chatting.js" charset="utf-8"></script>
<script type="text/javascript" src="/js/chat_keyEvent.js" charset="utf-8"></script>


<link rel="stylesheet" type="text/css" href="../webjars/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
	html{
		height: 100%;
	}
	body{
		height: 100%;
		margin: 0;
		padding: 0;
	}
	ul{
		list-style: none; 
		padding: 0;
		margin: 0;
		height: 100%;
	}
	li{
		margin-bottom: 8px;
	}
	textarea{
		resize:none;
		border: none;
		overflow: auto;
		outline: none;
		
		-webkit-box-shadow:none;
		-mox-box-shadow:none;
		box-shadow:none;
	}
	textarea.form-control{
		height:100%;
		border-color:#FFFFFF;
		box-shadow:none;
		outline:none;
	}
	textarea.form-control:focus{
		border-color:#FFFFFF;
		box-shadow:none;
	}
	.row{
		position: absolute;
		bottom: 0;
		right: 15px;
		left: 0;
		top: 0;
	}
	.col-md-12{
		padding-bottom: 0;
		padding-right: 0;
		height: 100%;
	}
	.panel-footer{
		padding: 0;
		border-width: 0px;
		height: 70px;
		width: 100%;
		display: inline-block;
		background-color: #FFFFFF;
	}
	
	.bottom{
		display: inline-block;
		height: 100%;
	}
	.form-inline{
		display: none;
	}
</style>

</head>
<body>

	<div style="display: none;">
		
			<div class="form-inline">
				<label for="connect">WebSocket connection</label>
				<button id="connect" class="btn btn-default" type="submit">Connect</button>
				<button id="disconnect" class="btn btn-default" type="submit" disabled="disabled">Disconnect</button>
			</div>
			
			<div class="form-inline">
			<label for="name">이름</label><strong><input type="text" id="name" class="form-control" placeholder="Your name here" value="${userid}"></strong>
			</div>
			<div id = "roomid">${roomid}</div>
			<div id = "roomname">${roomName}</div>
			<div id = "user_nicname">${user_nicname}</div>
			
	</div>
	
	<div class="row">
		<div class="col-md-12">
			<div class="chat-panel panel panel-default" style="margin-bottom: 0px; height: 100%; overflow: hidden;">
				<div class="panel-heading" style="background-color: rgb(152,182,204); margin: 0; padding: 10px;">
					<i class="fa fa-comments fa-fw"></i><strong><div id = "roomName">${roomName}</div></strong>
				</div>
				<!--/. panel-heading --> 
				<div class="panel-body" id="chat-body" style="height: calc(100% - 110px); overflow: auto; background-color: rgb(160,192,215);">
					<ul class="chat" id="chat"></ul>
				</div>
				<!--/.panel-body -->
				<div class="panel-footer">
							
						<div class="bottom" style="width: calc(100% - 65px);"> 
							<textarea id="btn-input" type="text" class="form-control input-sm" placeholder="" autocomplete="off"></textarea>
						</div>
						<div class="bottom" style="float: right; margin-right: 50px;">
							<span class="input-group-btn" > 
								<button class="btn btn-default" id="btn-chat" type="submit" style="position: absolute; top: 10px; right:-40px; float:left; border-radius: 5px; background-color: rgb(255,255,0);" disabled="true">전송</button>
							</span>
						</div>							
								
				
				</div>
				<!--/.panel-footer-->
			
			</div>
		</div>
	</div>
	
	
	

</body>
</html>