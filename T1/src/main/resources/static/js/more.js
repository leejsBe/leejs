/**
 * 
 */



var moreList;

$(function() {


	moreList = new Vue({
		el:'#moreList',
		data:{
			items:[
				{img:'/img/morePage/notice_.png',name:'공지사항'},
				{img:'/img/morePage/emoticonShap_.png',name:'이모티콘샵'},
				{img:'/img/morePage/openChatting_.png',name:'오픈 채팅'},
				{img:'/img/morePage/help_.png',name:'도움말'},
				{img:'/img/morePage/setting_.png',name:'설정'},
				{img:'/img/morePage/versionInfo_.png',name:'버전 정보'},
				{img:'/img/morePage/fileBox_.png',name:'파일박스'},
				
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
					setTimeout(function(){
						event.target.closest('li').style.backgroundColor = "#F0F0F0";
					},80)
				}
				
			},
			dblclick:function(event){
				
				return;
				
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
				
				
			
			}
			
		}
	
	})
	
});