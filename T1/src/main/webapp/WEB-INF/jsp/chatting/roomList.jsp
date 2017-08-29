<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>LIST</title>

<script type="text/javascript" src="/js/roomList.js" charset="utf-8"></script>

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
	
	#roomDataBadge{
		width: 0;
		height: 0;
		background-color: rgba(255,255,255,0);
		border: 0;
	}
	
	#roomDataBadge:after
	{	right: 10px; 
		background: #FF5B49;
	    left: -4px;
	    top: 8px; 
	    color: white;
	}
</style>

</head>
<body>





	<div class="row">
		<div class="col-md-12">
			<div class="chat-panel panel panel-default" style="margin-bottom: 0px; height: 100%; border-radius: 0px;">
				<div class="panel-heading">
				        <div id="watch-search" class="inner-addon left-addon" style="position: relative; width: calc(100% - 46px); display: inline-block;">
				          <i class="glyphicon glyphicon-search" style="margin-right: 100px;"></i>
				          <input type="text" class="form-control" placeholder="채팅방 이름, 참여자 검색" v-model="roomSearch" style="font-size: 12px; padding-left: 30px; border-radius:3px;" />
				        </div>
				    
				
				 	  	<button id="roomList-menu"
						        class="mdl-button mdl-js-button mdl-button--icon">
						  <i class="material-icons">more_vert</i>
						</button>
						
						<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" style="width: 165px;"
						    for="roomList-menu">
						  <li class="mdl-menu__item">
							    <span class="mdl-list__item-secondary-action" style="padding: 0;">
							      <label class="demo-list-radio mdl-radio mdl-js-radio mdl-js-ripple-effect" for="list-checkbox-1" style="padding: 0; width:23px;">
							        <input type="radio" name="sortChk" id="list-checkbox-1" class="mdl-radio__button" v-model="picked" onclick="sortRadio(this)" checked />
							        <div style="margin-left: 25px; font-size: 14px;">최신 메시지 순</div>
							      </label>
							    </span>
						  </li>
						  <li class="mdl-menu__item">
						  		<span class="mdl-list__item-secondary-action" style="padding: 0;">
							      <label class="demo-list-radio mdl-radio mdl-js-radio mdl-js-ripple-effect" for="list-checkbox-2" style="padding: 0; width:23px;">
							        <input type="radio" name="sortChk" id="list-checkbox-2" class="mdl-radio__button" v-model="picked" onclick="sortRadio(this)"   />
							        <div style="margin-left: 25px; font-size: 14px;">안 읽은 메시지 순</div>
							      </label>
							    </span>
						  </li>
						  <li class="mdl-menu__item">
						  		<span class="mdl-list__item-secondary-action" style="padding: 0;">
							      <label class="demo-list-radio mdl-radio mdl-js-radio mdl-js-ripple-effect" for="list-checkbox-3" style="padding: 0; width:23px;">
							        <input type="radio" name="sortChk" id="list-checkbox-3" class="mdl-radio__button" v-model="picked" onclick="sortRadio(this)" />
							        <div style="margin-left: 25px; font-size: 14px;">즐겨찾기 순</div>
							      </label>
							    </span>
						  
						  </li>
						</ul>
				 	  	
				 	  	
				 	  	
				</div>
				<!--/. panel-heading --> 
				<div class="panel-body" id="chat-body" style="height: calc(100% - 56px); overflow: auto;">
				
				
					<ul class="list-group" style="margin: 0px;" id ="roomList"> 
						<li class="list-group-item list-group-item-action" style="border:0px;" v-for="(item , index) in items" v-on:mouseover="mouseOver" v-on:mouseout="mouseOut" v-on:click="click" v-on:dblclick="dblclick">
							<span class="chat-img pull-left img-circle" style="width: 50px; height: 50px; overflow: hidden;">
								<img v-bind:src="item.PROFILE_IMG" alt="User Avatar" style="margin-left: 50%; margin-top:50%; transform:translateX(-50%) translateY(-50%);">
							</span> 
							
							<div class="chat-body clearfix">
								<div class="header" style="margin-top: -6px;">
									<strong class="primary-font" style="margin-left:8px;" id="roomName">{{item.USERINROOM}}</strong>
									<small class="text-muted" style="font-size:12px; float:right; margin-top: -4px;">
										<i class="fa fa-clock-o fa-fw"></i>
										<div style="display:inline-block; font-size: 11px; color:#BFBFBF; ">{{item.LASTTIME}}</div>
										</br>
										<button disabled="disabled" class="material-icons mdl-badge mdl-badge--overlap" id=roomDataBadge style="float: right;" v-bind:data-badge=item.BADGE v-if="item.BADGE != 0">1</button>
									</small>
								</div>						
								
								<div style="margin-left:9px; float:left; font-size:13px;">{{item.LASTCONTENTS}}</div>
							
							</div>							
						</li>
					</ul>
				
				</div>
				<!--/.panel-body -->
				
			
			</div>
		</div>
	</div>

	<button id="mkChat" class="mdl-button mdl-js-button mdl-button--fab mdl-button--colored" style="z-index: 7; position: absolute; right: 30px; bottom: 13px; background-Color: #FFEB35;" onclick="makeChatbtn()">
	  <i id="mkChatI" class="material-icons" style="color: #553F41;">add</i>
	</button>

	<div id = "myModal" class = "modal">
		<div class = "modal-content" style="margin-bottom:4px;">
		일반 채팅   
    		<button id="mkChatModal" class="mdl-button mdl-js-button mdl-button--fab mdl-button--colored" style="margin-left:5px; background-Color: #FFFFFF;" onclick="makeChatCommon()">
			  <img alt="" src="/img/talk.PNG">
			</button>
		</div>
	
	</div>
	
	

	
	
	
	
</body>
</html>