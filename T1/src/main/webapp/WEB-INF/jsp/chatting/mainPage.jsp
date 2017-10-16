<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>

<script type="text/javascript" src="../webjars/sockjs-client/1.0.2/sockjs.min.js"></script>
<script type="text/javascript" src="../webjars/stomp-websocket/2.3.3/stomp.min.js"></script>
<script type="text/javascript" src="../webjars/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript" src="../webjars/jquery/3.1.0/jquery.js"></script>

<script type="text/javascript" src="../webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../webjars/vue/2.1.3/vue.js"></script>
<script type="text/javascript" src="../webjars/vue/2.1.3/vue.min.js"></script>
<script src="https://unpkg.com/axios@0.12.0/dist/axios.min.js"></script>
<script src="https://unpkg.com/lodash@4.13.1/lodash.min.js"></script>

<link rel="stylesheet" type="text/css" href="../webjars/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic">
<link rel="stylesheet" href="//fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.brown-orange.min.css" />
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>


<script type="text/javascript" src="/js/mainPage.js"></script>

<style type="text/css">

body{
	overflow: hidden;
}

::-webkit-scrollbar {
    width: 12px;
}

/* Track */
::-webkit-scrollbar-track {
    -webkit-border-radius: 0px;
    border-radius: 0px;
    margin-right: 10px;
}

/* Handle */
::-webkit-scrollbar-thumb {
    -webkit-border-radius: 0px;
    border-radius: 1px;
    background: rgba(190,190,190,1); 
 
}

::-webkit-scrollbar-thumb:hover {
    -webkit-border-radius: 0px;
    border-radius: 1px;
    background: rgba(150,150,150,1); 
 
}

::-webkit-scrollbar-thumb:window-inactive {
    background: rgba(190,190,190,1); 
}

#tabContainer{
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	background-color: #523738;
	height: 92px;
}

.tabcontent{
	position: absolute;
	top: 90px;
	left:0;
	right:0;
	bottom:0;
	height: calc(100% - 147px );
	 
	/* background-color: green; */
	
}
#tab1{
	background-color: #523738; 
	border: none;
	outline:none;
	position: absolute;
	top: 44px;
	left: 16px;
}
#tab2{
	background-color: #523738; 
	border: none;
	outline:none;
	position: absolute;
	top: 45px;
	left: 74px; 
}

#tab2:after
{	right: -10px; 
	background: #FF5B49;
    left: 18px;
    top: -5px; 
    color: white;
}


#tab3{
	background-color: #523738; 
	border: none;
	outline:none;
	position: absolute;
	top: 50px;
	left: 125px;
}

footer{
	position:absolute;
	bottom:0;
	left:0;
	right:0;
	height: 57px;
	/* background: url('/img/banner/banner2.PNG') center; */
	background-repeat:no-repeat;
/* 	background-color: #7EA5B8; */
}

#notice{

	outline:none; 
	position: absolute; 
	right: 50px; 
	top: 43px; 
	background-color: rgba(0,0,0,0); 
	border-style:solid; 
	border-width:1px; 
	border-color: #3F2728;
}

#main_menu{

	outline:none; 
	position: absolute; 
	right: 10px; 
	top: 43px; 
	background-color: rgba(0,0,0,0); 
	border-style:solid; 
	border-width:1px; 
	border-color: #3F2728;

}

#snackbar {
    visibility: hidden; /* Hidden by default. Visible on click */
    min-width: 85px; /* Set a default minimum width */
    margin-left: -38px; /* Divide value of min-width by 2 */
    background-color: rgba(33,33,33,0.8); /* Black background color */
    color: #fff; /* White text color */
    text-align: center; /* Centered text */
    border-radius: 2px; /* Rounded borders */
    padding: 16px; /* Padding */
    position: fixed; /* Sit on top of the screen */
    z-index: 1; /* Add a z-index if needed */
    left: 50%; /* Center the snackbar */
    bottom: 50%; /* 30px from the bottom */
}

/* Show the snackbar when clicking on a button (class added with JavaScript) */ 
#snackbar.show {
    visibility: visible; /* Show the snackbar */

/* Add animation: Take 0.5 seconds to fade in and out the snackbar. 
However, delay the fade out process for 2.5 seconds */
    -webkit-animation: fadein 0s, fadeout 0.5s 1.5s;
    animation: fadein 0s, fadeout 0.5s 1.5s;
}

/* Animations to fade the snackbar in and out */
@-webkit-keyframes fadein {
    from {bottom: 50%; opacity: 0;} 
    to {bottom: 50%; opacity: 0.1;}
}

@keyframes fadein {
    from {bottom: 50%; opacity: 0;}
    to {bottom: 50%; opacity: 0.5;}
}

@-webkit-keyframes fadeout {
    from {bottom: 50%; opacity: 0.1;} 
    to {bottom: 50%; opacity: 0;}
}

@keyframes fadeout {
    from {bottom: 50%; opacity: 0.5;}
    to {bottom: 50%; opacity: 0;}
}

.mdl-badge.mdl-badge--overlap:after{
	right: -10px; 
	background-color: #FF5B49;
    left: 18px;
    bottom: -20px;

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

</style>
</head>
<body>

<div id = "tabContainer" class = "tab-container">
	
	
	<img alt="" src="/img/kakaotalk.PNG" style="position: absolute; top: 10px; left: 14px;">
	
	<button id="tab1" class="tablinks" onclick="showTab(event,'tab1_1');"><img v-bind:src='imgUrl'/></button> 
	<div class="mdl-tooltip" data-mdl-for="tab1">친구</div>
	
	<button id="tab2" class="tablinks material-icons mdl-badge mdl-badge--overlap" onclick="showTab(event,'tab2_1');"><img v-bind:src='imgUrl'/></button>
	<div class="mdl-tooltip" data-mdl-for="tab2">채팅</div>
	
	<button id="tab3" class="tablinks" onclick="showTab(event,'tab3_1')"><img v-bind:src='imgUrl'/></button>
	<div class="mdl-tooltip" data-mdl-for="tab3">더보기</div>
	
	<button id="notice" class="mdl-button--mini-fab mdl-js-button mdl-button--icon" v-on:click="onClick(this);"><img src="/img/alarm.PNG"/></button>
	<div class="mdl-tooltip" data-mdl-for="notice">알림</div>
	 
	<div id="snackbar"></div>
	 
	<button id="main_menu" class="mdl-button--mini-fab mdl-js-button mdl-button--icon" onclick="main_list_show();" v-tooltip:bottom="{html:'wefwef'}" primary><img src="/img/menu.PNG"/></button>
	<div class="mdl-tooltip" data-mdl-for="main_menu">메뉴</div>

	
	
	
	<ul id="main_menu_list" class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" style="width: 135px; margin: 0;padding: 0; border-width: 1px; outline: 1px;" for="main_menu">
	  <li id = "" class="mdl-menu__item mdl-menu__item--full-bleed-divider" style="line-height: 30px; vertical-align: middle; margin:0; padding: 0;">
		 <img alt="" src="/img/new_chatting.png" style="display: inline-block; margin-left: 10px;"> <div style="color: #262626; font-weight: bold; font-size: 12px; display: inline-block;">새로운 채팅</div>
	  </li>
	  <li id = "" class="mdl-menu__item mdl-menu__item--full-bleed-divider" style="line-height: 30px; vertical-align: middle; margin:0; padding: 0;">
	 	 <img alt="" src="/img/open_chatting.png" style="display: inline-block; margin-left: 10px;"> <div style="color: #262626; font-weight: bold; font-size: 12px; display: inline-block;">오픈 채팅</div>
	  </li>
	  <li id = "" class="mdl-menu__item" style="line-height: 30px; vertical-align: middle; margin:0; padding: 0;">
	 	 <div style="color: #262626; margin-left:32px; margin-top:3px; font-size: 12px; display: inline-block;">친구 추가</div>
	  </li>
	  <li id = "" class="mdl-menu__item mdl-menu__item--full-bleed-divider" style="line-height: 30px; vertical-align: middle; margin:0; padding: 0;">
	 	 <div style="color: #262626; margin-left:32px; font-size: 12px; display: inline-block;">그룹 만들기</div>
	  </li>
	  <li id = "" class="mdl-menu__item" style="line-height: 30px; vertical-align: middle; margin:0; padding: 0;">
	 	 <div style="color: #262626; margin-left:32px; margin-top:3px; font-size: 12px; display: inline-block;">카카오톡 정보</div>
	  </li>
	  <li id = "" class="mdl-menu__item mdl-menu__item--full-bleed-divider" style="line-height: 30px; vertical-align: middle; margin:0; padding: 0;">
	 	 <div style="color: #262626; margin-left:32px; font-size: 12px; display: inline-block;">설정</div>
	  </li>
	  <li id = "" class="mdl-menu__item" style="line-height: 30px; vertical-align: middle; margin:0; padding: 0;">
	 	 <div style="color: #262626; margin-left:32px; margin-top:3px; font-size: 12px; display: inline-block;">잠금모드 설정</div>
	  </li>
	  <li id = "" class="mdl-menu__item" style="line-height: 30px; vertical-align: middle; margin:0; padding: 0;">
	 	 <div style="color: #262626; margin-left:32px; margin-top:3px; font-size: 12px; display: inline-block;">로그아웃</div>
	  </li>
	  <li id = "" class="mdl-menu__item" style="line-height: 30px; vertical-align: middle; margin:0; padding: 0;">
	 	 <div style="color: #262626; margin-left:32px; margin-top:1px; font-size: 12px; display: inline-block;">종료</div>
	  </li>
	</ul>
	
	
	
</div>

	<div id="tab1_1" class = "tabcontent">
		<jsp:include page="friendList.jsp" flush="true">
			<jsp:param value="name" name="test"/>
		</jsp:include>
	</div>
	<div id="tab2_1" class = "tabcontent">
		<jsp:include page="roomList.jsp" flush="true">
			<jsp:param value="name" name="test"/>
		</jsp:include>
	</div>
	<div id="tab3_1" class = "tabcontent">
		<jsp:include page="more.jsp" flush="true">
			<jsp:param value="name" name="test"/>
		</jsp:include>
	</div>
	
	<footer>
		<div style="display: none;" id="userid"><%=session.getAttribute("userid") %></div>
		<div style="display: none;" id="user_nicname"><%=session.getAttribute("user_nicname") %></div>
		<div id = "banner" :style="{fontSize:size+'px', background:'url('+imgUrl+') center no-repeat', height:height+'%', backgroundColor:rgb}">
		</div>
	</footer>



	<div id = "mainModal" class = "modal">
		<!-- <div class = "modal-content" style="margin-bottom:4px;">
		일반 채팅   
    		<button id="mkChatModal" class="mdl-button mdl-js-button mdl-button--fab mdl-button--colored" style="margin-left:5px; background-Color: #FFFFFF;" onclick="makeChatCommon()">
			  <img alt="" src="/img/talk.PNG">
			</button>
		</div> -->
	
	</div>	
	

</body>
</html>