/**
 * 
 */

$(function(){
	$('#btn-input').on('keydown',function(event){
		
		if(event.keyCode == 13){
			if(!event.shiftKey){
				event.preventDefault();
				document.getElementById('btn-chat').click()
				document.getElementById('btn-chat').disabled = false;
			}
		}
		
	});
	
	
	$('#btn-input').on('keyup',function(event){
		
		
		//textarea 에 내용이 있는지 확인 후 버튼 활성화
		if(document.getElementById('btn-input').value.length > 0){
			document.getElementById('btn-chat').disabled = false;
		}else{
			document.getElementById('btn-chat').disabled = true;
		}
	});
	
	
	
	
	
});