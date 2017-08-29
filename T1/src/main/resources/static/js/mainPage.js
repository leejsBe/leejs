/**
 * 
 */

function showTab(evt, tabName){
	
	var i , tabcontent, tablinks;
	
	tabcontent = document.getElementsByClassName("tabcontent");
	for(i = 0 ; i < tabcontent.length ; i++){
		tabcontent[i].style.display = "none";
	}
	
	tablinks = document.getElementsByClassName("tablinks");
	for(i = 0 ; i< tablinks.length ; i++){
		tablinks[i].className = tablinks[i].className.replace(" active","");
	}
	
	document.getElementById(tabName).style.display = "block";
	evt.currentTarget.className +=" active";
} 

function main_list_show(){
	
	
}

////배너 이미지
var bannerBackColor = [{imgUrl:"/img/banner/banner1.PNG",rgb:'#235093'},
					   {imgUrl:"/img/banner/banner2.PNG",rgb:'#7EA5B8'},
					   {imgUrl:"/img/banner/banner3.PNG",rgb:'#45BBE6'},
					   {imgUrl:"/img/banner/banner4.PNG",rgb:'#000033'},
					   {imgUrl:"/img/banner/banner5.PNG",rgb:'#DA7826'},
					   {imgUrl:"/img/banner/banner6.PNG",rgb:'#EDCD78'},
					   {imgUrl:"/img/banner/banner7.PNG",rgb:'#4BBFFA'},
					   {imgUrl:"/img/banner/banner8.PNG",rgb:'#7B34B8'}]
var bannerToggleNum = 0;
function bannerChange(){
	
	setTimeout(function(){
		
		banner.setBanner(bannerToggleNum);
		
		bannerToggleNum = bannerToggleNum+1;
		if(bannerToggleNum > 7){
			bannerToggleNum = 0;
		}
		
		bannerChange();
	},60000)
	
}

function setNotReadMsgNum(num){
	///전체 안본 톡 개수 변경
	if(num != 0){
		document.getElementById('tab2').setAttribute('data-badge',num);
	}else{
	///삭제
		document.getElementById('tab2').removeAttribute('data-badge');
	}
}

var q;
var banner;
$(function() {
	
	var tabImg1 = new Vue({
		el:"#tab1",
		data:{
			imgUrl:"/img/tab1_1.PNG"
		}
	})
	var tabImg2 = new Vue({
		el:"#tab2",
		data:{
			imgUrl:"/img/tab2_2.PNG"
		}
	})
	var tabImg3 = new Vue({
		el:"#tab3",
		data:{
			imgUrl:"/img/tab3_1.PNG"
		}
	})
	
	$("#tab1").on("click", function () {
		tabImg1.imgUrl = '/img/tab1_2.PNG';
		
		tabImg2.imgUrl = '/img/tab2_1.PNG';
		tabImg3.imgUrl = '/img/tab3_1.PNG';

	});
	$("#tab2").on("click", function () {
		tabImg2.imgUrl = '/img/tab2_2.PNG';
		
		tabImg3.imgUrl = '/img/tab3_1.PNG';
		tabImg1.imgUrl = '/img/tab1_1.PNG';
		
	});
	$("#tab3").on("click", function () {
		tabImg3.imgUrl = '/img/tab3_2.PNG';

		tabImg1.imgUrl = '/img/tab1_1.PNG';
		tabImg2.imgUrl = '/img/tab2_1.PNG';

	});
	
	
	var noticeBtn = new Vue({
		el:"#notice",
		data:{
			toggle:true
		},
		methods:{
			onClick:function(event){
				
				// Get the snackbar DIV
			    var x = document.getElementById("snackbar");
			    
			    if(x.className != "show"){
				    // Add the "show" class to DIV
				    x.className = "show";
				    // After  seconds, remove the show class from DIV
				    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 2000);
			    }
				
				if(this.toggle==true){
					document.getElementById('notice').innerHTML='<img src="/img/alarm_close_.PNG">'
					document.getElementById('snackbar').innerHTML='<img alt="" src="/img/alarm_off.png">'
								
					this.toggle = false;
				}else{
					document.getElementById('notice').innerHTML='<img src="/img/alarm.PNG">'
					document.getElementById('snackbar').innerHTML='<img alt="" src="/img/alarm_on.png">'

					this.toggle = true;
				}
				
				
			}			
		}
	})
	
	
	
	$("#notice").on('mouseover',function(){
		document.getElementById('notice').style.backgroundColor='rgba(255,255,255,0.1)'
	})
	$("#notice").on('mouseout',function(){
		document.getElementById('notice').style.backgroundColor='rgba(255,255,255,0)'
	})
	$("#main_menu").on('mouseover',function(){
		document.getElementById('main_menu').style.backgroundColor='rgba(255,255,255,0.1)'
	})
	$("#main_menu").on('mouseout',function(){
		document.getElementById('main_menu').style.backgroundColor='rgba(255,255,255,0)'
	})
	
	
	document.getElementById("tab1").click();

	
	banner = new Vue({
		el:"#banner",
		data:{
			imgUrl:bannerBackColor[7].imgUrl,
			rgb:bannerBackColor[7].rgb,
			size:17,
			height:100
		},
		methods:{
			setBanner:function(num){
				this.imgUrl = bannerBackColor[num].imgUrl;
				this.rgb = bannerBackColor[num].rgb;
			}
	
		}
		
	})
	
	bannerChange();
	connect();
	
	
	$('#main_menu_list li').click(function(e){
		
		if($(this).index() == 2){
			
			window.open("about:blank","ADDFRIEND","height=400, width=400, location=no, menubar=no, scrollbars=yes,"+
						"resizable=no, toolbar=no, status=no, left="+(window.screenX + window.outerWidth/2  - 200)+", top="+(window.screenY + window.outerHeight/2 - 220));

			
		}
	})
	
});

