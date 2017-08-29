/**
 * 
 */
var t;
function getFriend(userid,search){
	
	$.ajax({
		url:'/test/retrieveFriendList',
		type:'post',
		data:{"userid":userid,"search":search},
		success:function(data){
			t=data;
			if(data == "USERIDISNULL"){
				location.href="/test/entry";
			}
			friendInfomation = data;
			var result = eval(data);
			friendList.$data.items = result;
			
		}
	})
	
}


function divFriend(data){
	
	///
	if(chkDate == "" || chkDate != date){
		
		var html = "<li class='list-group-item list-group-item-action' style='line-height: 30px; vertical-align: middle; margin:0; padding: 0;'>";
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


var friendList;
var friendInfomation;

$(function() {
	
	var userid = document.getElementById('userid').innerHTML;
	console.log(userid)
	
	
	
		var f_SearchRoomList = new Vue({
			el:'#f-watch-search',
			data:{
				f_roomSearch:''
			},
			watch:{
				f_roomSearch:function(newQuestion){
					this.getAnswer();
				}
			},
			methods:{
				getAnswer:_.debounce(
						function(){
							var searchText = document.getElementsByClassName('form-control')[0].value;
							getFriend(userid,searchText);
							
						},300
				)
				
			}
			
			
			})
	
	
	
	
	
	
	
	
	
	friendList = new Vue({
		el:'#friendList',
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
				var roominfo = eval(friendInfomation)[index];
			
				
				if(roominfo.FRND_NICNAME){
					console.log(roominfo.FRND_NICNAME)
				}else{
					roominfo.FRND_NICNAME = '';
				}
				
				
				///ROOMID 가져오기
				$.ajax({
					url:'/test/retrieveFriendRoomId',
					type:'post',
					data:{"userid":userid,"frndid":roominfo.FRNDID},
					success:function(roomid){
						
						if(roomid === "FRNDIDISNULL"){
							console.log("자신한테 글쓰기 준비중..")
							return;
						}
						
						var f = document.createElement('form');
						var parm = [document.getElementById('userid').innerHTML,roominfo.FRND_NICNAME,roomid,document.getElementById('user_nicname').innerHTML];
						
						
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
						
						
						
						
						/*if(data == "USERIDISNULL"){
							location.href="/test/entry";
						}
						friendInfomation = data;
						var result = eval(data);
						friendList.$data.items = result;*/
						
						
						
						
						
					}
				})
				
				
				
				
				
			
			}
			
		}
	
	})
	
	
	///친구 목록 가져오기
	getFriend(userid);
	
	
});
