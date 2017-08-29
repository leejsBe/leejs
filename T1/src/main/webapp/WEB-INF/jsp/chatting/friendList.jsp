<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Friend List</title>

<script type="text/javascript" src="/js/friendList.js" charset="utf-8"></script>

<style type="text/css">
	html{
		height: 100%;
	}
	body{
		margin: 0;
		padding: 0;
		height: 100%;
	}
	.col-md-12{
		height: 100%;
		padding: 0;
		width: 100%;
		margin: 0; 
	}
	
	tr{
		background-color: rgb(255,255,0);
		margin: 0;
		padding: 0;
	}
	.row{
		height: 100%;
		width: 100%;
		margin: 0; 
	}
	
	.panel-heading{
		background-color:rgb(245,245,245);
		height: 56px;
		padding-right: 0;
	}
	
	.panel-body{
		padding: 0;
	}
	
	.sort-btn{
		margin: 5px;
	}
	
	/* style glyph */
	.inner-addon .glyphicon {
	  position: absolute;
	  padding: 10px;
	  pointer-events: none;
	}
	
	/* align glyph */
	.left-addon .glyphicon  { left:  0px;}
	.right-addon .glyphicon { right: 0px;}
	
	/* add padding  */
	.left-addon input  { padding-left:  25px; }
	.right-addon input { padding-right: 25px; } 
	
	ul{
		list-style: none; 
		padding-left: 50px;
		margin-left:50px;
		height: 100%;
	}
	li{
		margin-bottom: 8px;
	}
	
	.panel-footer{
		position:absolute;
		bottom: 0;
		left: 0;
		right: 0;
	}
	
	
	.modal{
		display: none;
		position: fixed;
		z-index: 3;
		left:0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgb(0,0,0);
		background-color: rgba(0,0,0,0.4);
	}
	
	.modal-content{
		margin: 0;
		width:150px;
		height:100px;
		position: absolute;
		bottom: 90px;  
		right: 15px;
		background-color: rgba(255,255,255,0);
		border-color: rgba(255,255,255,0);
		box-shadow:none;
		font-weight: bold;
		font-size: 16px;
		color: #FFFFFF;
	}
	
	.mdl-menu__item{
		height: 33px;
	}
	
	#friendGroupAdd{
		border: 0px;
		height: 25px;
		float: right;
		background-color: #FFFFFF;
		width: 44px;
		padding: 0;
		margin: 0 10px 0 0;
		color: #999999;
		outline:none;
	}
	#friendGroupAdd:hover{ 
		color: #404040;
	}

</style>
</head>
<body>

	<div class="f-row">
		<div class="col-md-12">
			<div class="chat-panel panel panel-default" style="margin-bottom: 0px; height: 100%;  border-radius: 0px;">
				<div class="panel-heading">
				        <div id="f-watch-search" class="inner-addon left-addon" style="position: relative; width: calc(100% - 14px); display: inline-block;">
				          <i class="glyphicon glyphicon-search" style="margin-right: 100px;"></i>
				          <input type="text" class="form-control" placeholder="이름 검색" v-model="f_roomSearch" style="font-size: 12px; padding-left: 30px; border-radius:3px;" />
				        </div>
				</div>
				
				
				
				<!--/. panel-heading --> 
				<div class="panel-body" id="chat-body" style="height: calc(100% - 56px); overflow: auto;">
				
				
					<ul class="list-group" style="margin: 0px;" id ="friendList">
						 
						 
						 
						 <!-------------------------내 프로필 -------------------------------->
						 <li class="list-group-item list-group-item-action" style="border:0px; line-height: 30px; vertical-align: middle; margin:0; padding: 0;" v-for="item in items" v-if="item.USERID == '---' && item.SEQ === '0'">
						 	<div style="margin-top:8px; height: 27px; width: calc(100% - 15px); color: #5D5D5D; margin-left:15px; font-size: 12px; display: inline-block; border-bottom: 1px solid; border-width: 100%; border-color:#E6E6E6;">내 프로필</div>
						 	
						 </li> 
					
						<li class="list-group-item list-group-item-action" style="border:0px;" v-for="item in items" v-on:mouseover="mouseOver" v-on:mouseout="mouseOut" v-on:click="click" v-on:dblclick="dblclick" v-if="item.USERID != '---' && item.SEQ === '0'">
							<span class="chat-img pull-left img-circle" style="width: 46px; height: 46px; overflow: hidden;">
								<img v-bind:src="item.PROFILE_IMG" alt="" style="margin-left: 50%; margin-top:50%; transform:translateX(-50%) translateY(-50%);"> 
							</span> 
							
							<div class="chat-body clearfix">
								<div class="header">
									<small class="primary-font" style="margin-left:8px;" id="roomName">{{item.FRND_NICNAME}}</small>
									<small class="text-muted" style="font-size:12px; float:right;">
										<i class="fa fa-clock-o fa-fw"></i>
										<!-- <div style="display:inline-block;">{{item.LASTTIME}}</div> -->
									</small>
								</div>						
								
								<div style="color:rgb(115,115,115); margin-left:7px; padding-left:5px; padding-right:5px; float:left; font-size:11px; border: 1px solid; border-color:rgba(215,215,215,0.9); border-radius:5px; height: auto; width: auto;">{{item.STATUS_MSG}}</div>
							
							</div>							
						</li>
						 <!--------------------------------------------------------------------------------->
						 
						 
						 
						 
						 
						 
						 
						 <!-----------------------------친구 목록------------------------->
						 <li class="list-group-item list-group-item-action" style="border:0px; line-height: 30px; vertical-align: middle; margin:0; padding: 0;" v-for="item in items" v-if="item.USERID == '---' && item.SEQ === '2'">
						 	<div style="margin-top:8px; height: 27px; width: calc(100% - 15px); color: #5D5D5D; margin-left:15px; font-size: 12px; display: inline-block; border-bottom: 1px solid; border-width: 100%; border-color:#E6E6E6;">친구       
						 		<div style="display: inline-block; color:#A1A1A1;">  &nbsp {{item.FRND_COUNT}}</div>
						 		<button id="friendGroupAdd"><div style="padding-top:1px; display: inline-block; float: right;">그룹</div><div class="icon material-icons" style="font-size:18px; padding-top:6px; display: inline-block; float: right;">add</div></button>
						 	</div>
						 	
						 </li> 
					
						<li class="list-group-item list-group-item-action" style="border:0px;" v-for="item in items" v-on:mouseover="mouseOver" v-on:mouseout="mouseOut" v-on:click="click" v-on:dblclick="dblclick" v-if="item.USERID != '---' && item.SEQ === '2'">
							<span class="chat-img pull-left img-circle" style="width: 46px; height: 46px; overflow: hidden;">
								<img v-bind:src="item.PROFILE_IMG" alt="User Avatar" style="margin-left: 50%; margin-top:50%; transform:translateX(-50%) translateY(-50%);">
							</span> 
							
							<div class="chat-body clearfix">
								<div class="header">
									<small class="primary-font" style="margin-left:8px;" id="roomName">{{item.FRND_NICNAME}}</small>
									<small class="text-muted" style="font-size:12px; float:right;">
										<i class="fa fa-clock-o fa-fw"></i>
										<!-- <div style="display:inline-block;">{{item.LASTTIME}}</div> -->
									</small>
								</div>						
								
								<div style="color:rgb(115,115,115); margin-left:7px; padding-left:5px; padding-right:5px; float:left; font-size:11px; border: 1px solid; border-color:rgba(215,215,215,0.9); border-radius:5px; height: auto; width: auto;">{{item.STATUS_MSG}}</div>
							
							</div>							
						</li>
						 <!--------------------------------------------------------------------------------->
					</ul>
				
				</div>
				<!--/.panel-body -->
				
			
			</div>
		</div>
	</div>



</body>
</html>