package com.example.demo.chat;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.example.demo.test.ChattingDao;

@Controller
public class ChatController {
	
	@Autowired
	private ChattingDao chattingDao;

	@MessageMapping("hello")
	@SendTo("/chat/hello")
	public HelloMessage hello(HelloMessage message) throws Exception {
		Thread.sleep(100);
		return message;
	}
	
	
	@MessageMapping("bye")
	@SendTo("/chat/bye")
	public HelloMessage bye(HelloMessage message) throws Exception{
		Thread.sleep(100);
		return message;
	}
	
	@MessageMapping("detail")
	@SendTo("/chat/detail")
	public HelloMessage detail(HelloMessage message) throws Exception{
		Thread.sleep(100);
		
		message.setSendDate(new SimpleDateFormat("yyyy-MM-dd a HH:mm:ss").format(new Date()));
		
		System.out.println("~~~~~~~~~~~~~~~~~");
		System.out.println(message.getUserid());
		System.out.println(message.getContents());
		System.out.println(message.getSendDate());
		System.out.println(message.getUser_nicname());
		System.out.println("~~~~~~~~~~~~~~~~~");

		HashMap<String,String> input = new HashMap<>();
		input.put("userid",message.getUserid());
		input.put("contents", message.getContents());
		input.put("date", message.getSendDate());
		input.put("roomid", message.getRoomid());
		
		chattingDao.saveChat(input);
		
		return message;
	}
		
}
