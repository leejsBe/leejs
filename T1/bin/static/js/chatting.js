/**
 * 
 */

var stompClient = null;
	
function setConnected(connected){
	$("#connect").prop("disabled",connected);
	$("#disconnected").prop("disabled",!connected);
	if(connected){
		$("#chat").show();
	}else{
		$("#chat").hide();
	}
	//$("#chat").html("");
}

//소켓 연결
function connect(){
	var socket = new SockJS('/j-websocket');
	stompClient = Stomp.over(socket);
	stompClient.connect({},function(frame){
		setConnected(true);
		console.log("Connected: "+frame);
		//입장에 대한 구독
		stompClient.subscribe('/chat/hello',function(msg){
			//showHello(JSON.parse(msg.body));
		});
		//입장에 대한 메시지 전달
		stompClient.subscribe('/chat/detail',function(msg){
			showDetail(JSON.parse(msg.body));
		});
		//퇴장에 대한 구독
		stompClient.subscribe('/chat/bye',function(msg){
			
			showBye(JSON.parse(msg.body));
		});
		//sendHello();
	});
	
}

//소켓 연결 끊음
function disconnect() {
	if (stompClient != null) {
		sendBye();
		stompClient.disconnect();
	}
	setConnected(false);
	
	console.log("Disconnected");
}

function sendHello(){
	stompClient.send("/hello",{},JSON.stringify({
		userid:$('#name').val()
	}));
	
	document.getElementById('disconnect').disabled= false;
}

function sendDetail(roomid,user_nicname,userProfileImg){
	stompClient.send("/detail",{},JSON.stringify({
		userid:$('#name').val(),
		contents:$('#btn-input').val(),
		roomid:roomid,
		user_nicname:user_nicname,
		profileimg:userProfileImg
	}));
}

function sendBye() {
	stompClient.send("/bye", {}, JSON.stringify({
		userid: $('#name').val()
	}));
	document.getElementById('disconnect').disabled= true;
}

var t;
function showDetail(message) {
	t = message;
	var html = "";
	var yyyyMMdd = (message.sendDate).split(' ')[0];
	var AM = (message.sendDate).split(' ')[1];
	var HHmiss = (message.sendDate).split(' ')[2];
	
	var timeheight = 1;
	if((message.contents).indexOf("\n") > -1){
		timeheight = (message.contents).match(/\n/g).length+1.2;
	} 
	
	if(message.userid == $('#name').val()){  /// 내가 보내는 메시지 
		html += '<li class="left clearfix">';
		html += '	<div class="chat-body clearfix">';
		html += '		<div class="header">';
		html += '			<div class="pull-right primary-font" style="box-shadow:1px 1px 1px #88A3B7; font-size:13px; padding: 5px 5px 5px 5px; border-radius:3px; background-color:rgb(254,236,66);">' +(message.contents).replace(/\n/gi,"</br>") + '</div>';
		html += '			<div class="pull-right text-muted" id="message-time" style="font-size:10px; margin-right:8px; margin-top:'+17*timeheight+'px;" title="'+ yyyyMMdd.split("-")[0]+'년 '+yyyyMMdd.split("-")[1]+'월 '+yyyyMMdd.split("-")[2]+'일 '+'">'+AM+' '+ HHmiss.split(":")[0] +':'+HHmiss.split(":")[1] +'</div>';		
		html += '		</div>';
		html += '	</div>';
		html += '</li>';
	} else {  							/// 상대방이 보내는 메시지
		html += '<li class="left clearfix">';
		html += '	<span class="chat-img pull-left img-circle" style="width: 40px; height: 40px; overflow: hidden;">'
		html += '		<img src="'+message.profileimg+'" style="margin-left: 50%; margin-top:50%; transform:translateX(-50%) translateY(-50%);">';
		html += '	</span>';
		html += '	<div class="chat-body clearfix" style="margin-left:35px;">';
		html += '		<div class="header">';
		html += '		<div class="primary-font" style="margin-left:9px; font-size:12px;">' + message.user_nicname + '</div>';

		html += '	</div>';
		html += 	'<div style="box-shadow:1px 1px 1px #88A3B7; margin-top: 5px; margin-left:5px; float:left; font-size:13px; padding: 5px 5px 5px 5px; border-radius:3px; background-color:rgb(255,255,255);">' +(message.contents).replace(/\n/gi,"</br>") +'</div>';
		html += '		<div style="margin-top:'+17*timeheight+'px;"><small class="text-muted" style="font-size:10px;  margin-left:5px;">';
		html += '			<i class="fa fa-clock-o fa-fw"></i>' + '<div style="display:inline-block;" title="'+ yyyyMMdd.split("-")[0]+'년 '+yyyyMMdd.split("-")[1]+'월 '+yyyyMMdd.split("-")[2]+'일 '+'">'+AM+' '+ HHmiss.split(":")[0] +':'+HHmiss.split(":")[1] + '</div>';
		html += '		</small></div>';
		html += '	</div>';
		html += '</li>';
	}
	
	$(".chat").append(html);
	$('.panel-body').scrollTop($(".chat")[0].scrollHeight);
}

function showHello(message) {
	var html = "";
	var yyyyMMdd = (message.sendDate).split(' ')[0];
	var HHmiss = (message.sendDate).split(' ')[1];
	
	html += '<li class="left clearfix">';
	html += '	<div class="chat-body clearfix">';
	html += '	<div class="header" style="text-align:center;">';
	html += '		<strong>' + message.user_nicname + '</strong>'+' 님이 입장 하였습니다';
	html += '		<small class="text-muted">';
	html += '			<i class="fa fa-clock-o fa-fw"></i>' + date.getFullYear()+'년 '+(parseInt(date.getMonth())+1)+'월 '+date.getDate()+'일 '+date.getHours()+'시 '+date.getMinutes()+'분 ';
	html += '		</small>';
	html += '	</div>';
	html += '	</div>';
	html += '</li>';
	
	$(".chat").append(html);
	$('.panel-body').scrollTop($(".chat")[0].scrollHeight);
}

function showBye(message) {
	var html = "";
	
	var date = new Date(message.sendDate);
	
	html += '<li class="left clearfix">';
	html += '	<div class="chat-body clearfix">';
	html += '	<div class="header" style="text-align:center;">';
	html += '		<strong class="primary-font">' + message.user_nicname + '</strong>'+' 님이 퇴장 하였습니다';
	html += '		<small class="text-muted">';
	html += '			<i class="fa fa-clock-o fa-fw"></i>' + new Date(message.sendDate);
	html += '		</small>';
	html += '	</div>';
	html += '	</div>';
	html += '</li>';
	
	$(".chat").append(html);
	$('.panel-body').scrollTop($(".chat")[0].scrollHeight);
}


///날짜 저장 변수
var chkDate = "";
var chkHHss = "";

function divChatByDate(date){
	
	///날짜 지나면 날짜 표시 가로줄 추가
	if(chkDate == "" || chkDate != date){
		
		var html = "<div style='display: table; width:100%; margin-top:10px; margin-bottom:10px; text-align:center;'>";
		    html +="	<div style=' display:table-cell;' ><hr style=' width:100%; border-top: 1px solid #809AAC;  '/></div>";
		    html +="	<div style=' display:table-cell; width:150px; height:100%; margin-left:10px; margin-right:10px; vertical-align:middle;'><div style='padding:0;'>"+date.split("-")[0]+"년 "+date.split("-")[1]+"월 "+date.split("-")[2]+"일 "+"</div></div>";
		    html +="	<div style=' display:table-cell;' ><hr style='width:100%; border-top: 1px solid #809AAC;'/></div>";
		    html +="</div>";
		$(".chat").append(html);
		$('.panel-body').scrollTop($(".chat")[0].scrollHeight);
		
		
		chkDate = date;
	}else{
		
	}
	
	
}

///현재 날짜 찍기
function getTimeStamp() {
	  var d = new Date();

	  var s =
	    leadingZeros(d.getFullYear(), 4) + '-' +
	    leadingZeros(d.getMonth() + 1, 2) + '-' +
	    leadingZeros(d.getDate(), 2) + ' ' +

	    leadingZeros(d.getHours(), 2) + ':' +
	    leadingZeros(d.getMinutes(), 2) + ':' +
	    leadingZeros(d.getSeconds(), 2);

	  return s;
}

function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}


var userid;
var roomid;
var profileImgInRoom;
$(function() {
	
		
	var user_nicname = document.getElementById('user_nicname').innerHTML;
	var roomName = document.getElementById('roomName').innerHTML;
		roomid = document.getElementById('roomid').innerHTML;
		userid = document.getElementById('name').value;
		
	setTimeout(function(){ document.getElementById('connect').click(); },100)
	
	
	///대화 불러오기
	$.ajax({
		url:'/test/retrieveChat',
		type:'post',
		data:{"roomid":roomid,"userid":userid},
		success:function(data){
			
			var result = eval(data);
			for(var i = 0 ; i< result.length ; i++){
				
				divChatByDate((result[i].sendDate).split(" ")[0]);
				
				//// 대화 한줄 표출
				showDetail(result[i])
			}
			
		}
	})
	
	///유저별 프로필 이미지
	$.ajax({
		url:'/test/retrieveProfileImgInRoom',
		type:'post',
		data:{"roomid":roomid},
		success:function(data){
			profileImgInRoom = eval(data);
			console.log(profileImgInRoom)
		}
	})
	
	
	
	$("form").on('submit', function(e) {
		e.preventDefault();
	});
	$("#connect").click(function() {
		if(document.getElementById('name').value.length > 0){
			// 소켓 연결
			connect();
		}else{
			console.log('이름 필요~!!')
		}
	});
	$("#disconnect").click(function() {
		// 소켓 연결 끊음
		disconnect();
	});
	$("#btn-chat").click(function() {
		try{
			
			divChatByDate(getTimeStamp().split(" ")[0])
			
			var userProfileImg;
			for(var i = 0 ; i < profileImgInRoom.length ; i++){
				if(profileImgInRoom[i].USERID == userid){
					userProfileImg =  profileImgInRoom[i].PROFILE_IMG;
				}
			}
			// 메시지 전달
			sendDetail(roomid,user_nicname,userProfileImg);
			$('#btn-input').val('');
			document.getElementById('btn-chat').disabled = true;
		}catch(err){
			console.log('메시지를 보낼 수 없습니다.'+ err)
			
		}
		
	});
	
});


/// 포커스 되었을때 방 리스트 재조회
window.addEventListener('focus',function(){
	
	///읽었다고 체크
	$.ajax({
		url:'/test/readChat',
		type:'post',
		data:{"roomid":roomid,"userid":userid},
		success:function(data){
			
			opener.getChat(userid);
			
		}
	})
	
},false)
