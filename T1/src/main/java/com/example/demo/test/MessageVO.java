package com.example.demo.test;

import com.google.gson.Gson;

public class MessageVO {
	
	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getTo() {
		return to;
	}


	public void setTo(String to) {
		this.to = to;
	}


	private String message;
	private String type;
	private String to;
		
	
	public static MessageVO converMessage(String source) {
		MessageVO message = new MessageVO();
		Gson gson = new Gson();
		message = gson.fromJson(source, MessageVO.class);
		
		return message;
		
	}


}
