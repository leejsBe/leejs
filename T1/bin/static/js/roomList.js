/**
 * 
 */


/*function addRoomList(message) {
	var html = "";
	
	var date = new Date(message.sendDate);
		
	
	html += '<li class="list-group-item list-group-item-action" >';
	html += '	<span class="chat-img pull-left">'
	html += '		<img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle">';
	html += '	</span>';
	html += '	<div class="chat-body clearfix">';
	html += '		<div class="header">';
	html += '			<strong class="primary-font" style="margin-left:8px;">' + '이름~~' + '</strong>';
	html += '			<small class="text-muted" style="font-size:10px; float:right;">';
	html += '				<i class="fa fa-clock-o fa-fw"></i>' + '<div style="display:inline-block;" title="'+ date.getFullYear()+'년 '+(parseInt(date.getMonth())+1)+'월 '+date.getDate()+'일 '+'">'+ date.getHours() +':'+date.getMinutes() + '</div>';
	html += '			</small>';
	html += '		</div>';
	html += 	'<div style="margin-left:7px; float:left; font-size:13px;">' +('ㄷㄹㄷㄹㄷㄹㄷㄹㄷㄹㄷㅈㄷㄱㅈㄷㅈㄷㅎㅈㄷㅎㅈㄷㅎㄷㅎ').replace(/\n/gi,"</br>") +'</div>';
	html += '	</div>';
	html += '</li>'
		
	$(".list-group").append(html);
	
}
*/

//소켓 연결
function connect(){
	var socket = new SockJS('/j-websocket');
	stompClient = Stomp.over(socket);
	stompClient.connect({},function(frame){
		console.log("Connected: "+frame);
		//입장에 대한 구독
		stompClient.subscribe('/chat/hello',function(msg){

			//showHello(JSON.parse(msg.body));
		});
		//입장에 대한 메시지 전달
		stompClient.subscribe('/chat/detail',function(msg){
			console.log(msg)
			console.log('2@@@')
			getChat(document.getElementById('userid').innerHTML);
			//showDetail(JSON.parse(msg.body));
		});
		//퇴장에 대한 구독
		stompClient.subscribe('/chat/bye',function(msg){

			//showBye(JSON.parse(msg.body));
		});
		//sendHello();
	});
	
}



function getChat(userid,search){
	
	$.ajax({
		url:'/test/retrieveRoomList',
		type:'post',
		data:{"userid":userid,"search":search},
		success:function(data){
			if(data == "USERIDISNULL"){
				location.href="/test/entry";
			}
			roomInfomation = data;
			var result = eval(data);
			roomList.$data.items = result;
			
			
			var badgeSum=0;
			for(var i = 0 ; i < roomList.items.length; i++){
				badgeSum += parseInt(roomList.items[i].BADGE);
			}
			
			setNotReadMsgNum(badgeSum);
			
		}
	})
	
}

///채팅방 리스트 정렬
function sortRadio(e){
	
	if(e.id == "list-checkbox-1"){			///최신 메시지 순
		
	}else if(e.id == "list-checkbox-2"){	///안 읽은 메시지 순
		
	}else if(e.id == "list-checkbox-3"){	///즐겨 찾기 순		
		
	}
}

var chatToggle = true;
///채팅방 만들기
function makeChatbtn(){
	var fBtn = document.getElementById('mkChatI');
	var modal = document.getElementById('myModal');

	if(chatToggle == true){
		var cssText = fBtn.style.cssText;
			cssText += " -webkit-transform: rotate(45deg);"
		fBtn.style.cssText = cssText;
		fBtn.style.marginLeft = "-12px";
		fBtn.style.marginTop = "-12px";
		
		chatToggle= false;
		
		
		modal.style.display = "block";
		
		
	}else{
		var cssText = "color: #553F41;"
		fBtn.style.cssText = cssText;
		chatToggle= true;
		
		modal.style.display = "none";
		
		
	}
	
	window.onclick = function(event){
		if(event.target == modal){
			modal.style.display = "none";
			var cssText = "color: #553F41;"
			fBtn.style.cssText = cssText;
			chatToggle= true;
		}
	}
	
	
}


function makeChatCommon(){
	console.log('일반 채팅방 만들기')
	
}




var roomList;
var roomInfomation;
var f;
var t;
$(function() {
	
	var userid = document.getElementById('userid').innerHTML;
	

	
	var SearchRoomList = new Vue({
		el:'#watch-search',
		data:{
			roomSearch:''
		},
		watch:{
			roomSearch:function(newQuestion){
				this.getAnswer();
			}
		},
		methods:{
			getAnswer:_.debounce(
					function(){
						var searchText = document.getElementsByClassName('form-control')[1].value;
						getChat(userid,searchText);
						
					},400
			)
			
		}
		
		
	})
	
	
	
	roomList = new Vue({
		el:'#roomList',
		data:{
			items:[
				
			]
		},
		methods:{
			mouseOver:function(event){
				if(event.target.closest('li').style.backgroundColor != "rgb(255, 241, 115)"){
					event.target.closest('li').style.backgroundColor = "#F0F0F0";
				}
			},
			mouseOut:function(event){
				if(event.target.closest('li').style.backgroundColor != 'rgb(255, 241, 115)'){
					event.target.closest('li').style.backgroundColor = "#FFFFFF";
				}
			},
			click:function(event){
			
				for(var i = 0 ; i < event.target.closest('ul').children.length ; i++){
					event.target.closest('ul').children[i].style.backgroundColor = "";
					
				}
				
				if(event.target.closest('li').style.backgroundColor != "#FFF173"){
					event.target.closest('li').style.backgroundColor = "#FFF173";
				}
				
			},
			dblclick:function(event){
				
				var index = '';
				for(var i = 0 ; i < this.$el.children.length ; i++){
					if(event.target.closest('li') == this.$el.children[i]){
						index = i;
						break;
					}
				}
				var roominfo = eval(roomInfomation)[index];
				if(roominfo.USERINROOM){
					console.log(roominfo.USERINROOM)
				}else{
					roominfo.USERINROOM = '';
				}
				
				
				var f = document.createElement('form');
				var parm = [document.getElementById('userid').innerHTML,roominfo.USERINROOM,roominfo.ROOMID,document.getElementById('user_nicname').innerHTML];
				
				
				var objs, value;
				for(var key in parm){
					value = parm[key];
					objs = document.createElement('input');
					objs.setAttribute('type','hidden');
					objs.setAttribute('name',key);
					objs.setAttribute('value',value); 
					f.appendChild(objs);
				}
				
				f.setAttribute('method','post');
				f.setAttribute('action','/test/chatting');
				document.body.appendChild(f);
				
				window.open("about:blank","CHATTING_ROOM"+roominfo.ROOMID,"height=700, width=400, location=no, menubar=no, scrollbars=yes, resizable=no, toolbar=no, status=no, left=1000, top=50");
				f.target = "CHATTING_ROOM"+roominfo.ROOMID;
				f.submit();
				
				
			
				setTimeout(function(){
					///채팅 가져오기
					getChat(userid);
				},500)
				
				
			}
			
		}
	
	})
	
	///채팅 가져오기
	getChat(userid);
	
		
	///채팅방 정렬 버튼 이벤트
	$("[data-toggle=popover]").popover({
		placement:'bottom'
	});

	
	//connect();
});


