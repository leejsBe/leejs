<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>더보기</title>


<script type="text/javascript" src="/js/more.js" charset="utf-8"></script>

<style>
	html{
		height: 100%;
	}
	body{
		margin: 0;
		padding: 0;
		height: 100%;
		
	}

</style>

</head>
<body>

				<div class="panel-body" id="chat-body" style="height:100%; overflow: auto;">
				
				
					 <div style="background-color: #F7F7F7; height: 88px; padding-top: 14px; padding-left: 16px; border-bottom: 1px solid; border-color:#E6E6E6;">
						 
							<span class="chat-img pull-left img-circle" style="width:60px; height: 60px; overflow: hidden;"> 
								<img src="<%=session.getAttribute("profile_img") %>" style="margin-left: 50%; margin-top:50%; transform:translateX(-50%) translateY(-50%);">
							</span>  
							
							<div class="chat-body clearfix">
								<div class="header" style="margin-top: -4px;">
									<strong class="primary-font" style="margin-left:8px;" id="roomName"><%=session.getAttribute("user_nicname") %></strong>
								</div>						
								
								<div style="margin-left:7px; float:left; font-size:12px; color: #999999; margin-top: 9px; height: 11px;">계정&nbsp</div>
								<div style="margin-left:7px; float:left; font-size:12px; height: 11px; margin-top: 9px;"><%=session.getAttribute("user_email") %></div>
								</br>
								<div style="margin-left:7px; float:left; font-size:12px; color: #999999; margin-top: 6px; height: 11px; margin-right: 12px;">ID&nbsp</div>
								<div style="margin-left:7px; float:left; font-size:12px; margin-top: 6px; height: 11px;"><%=session.getAttribute("userid") %></div>
							 
								<div style="float: right; border-left: 1px solid; border-color:#E8E8E8; width: 76px; margin-top: -38px; margin-right: 5px; height: 63px;"> 
									<button style="width: 100%; height: 100%; outline:none; background-color: rgba(255,255,255,0); border: none;"><img src="/img/news.png"></img></button>
								</div>
													
							</div>		
										
					</div>
					
					
					 
					<ul class="list-group" style="margin: 0px; height: 300px;" id ="moreList"> 
						<li class="list-group-item list-group-item-action" style="height:49px; border:0px; border-radius: 0px;" v-for="item in items" v-on:mouseover="mouseOver" v-on:mouseout="mouseOut" v-on:click="click" v-on:dblclick="dblclick">
							<span class="chat-img pull-left" style="margin-top: 6px;">
								<img v-bind:src=item.img alt="User Avatar">
							</span> 
							
							<div class="chat-body clearfix">
								<div class="header">
									<div class="primary-font" style="margin-left:8px; font-size: 13px;" id="roomName"><div style="padding-left:20px; padding-top: 2px;">{{item.name}}</div></div>
								</div>						
							</div>							
						</li>
					</ul>
					
					
					
				</div>
				<!--/.panel-body -->
	
</body>
</html>