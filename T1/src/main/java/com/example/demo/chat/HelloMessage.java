package com.example.demo.chat;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter 
@Setter
public class HelloMessage {

	private String userid;
	private String contents;
	private String sendDate;
	private String roomid;
	private String user_nicname;
}
