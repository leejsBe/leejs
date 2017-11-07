package com.example.demo.test;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

public class EchoHandler extends TextWebSocketHandler{
	
	private Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	/*
	 * list of user who connected to the server
	 */
	private List<WebSocketSession> connectedUsers;
	
	public EchoHandler() {
		
		connectedUsers = new ArrayList<WebSocketSession>();
	}
	
	/*
	 * connection-related Event Method 
	 * 
	 * @param WebSocketSession
	 * 	 connected users
	 */
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		connectedUsers.add(session);
		
		logger.info(session.getId() + "님 안녕하세요.");
		logger.info("접속IP : "+session.getRemoteAddress().getHostName());
	}
	
	/*
	 *
	 * 
	 * 1. Send :
	 * 2. Emit : 
	 *	
	 *	@param WebSocketSession
	 *			
	 *	@param TextMessage
	 *			
	 */
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		MessageVO messageVO = MessageVO.converMessage(message.getPayload());
		String hostName = "";
		
		for(WebSocketSession webSocketSession : connectedUsers) {
			if(messageVO.getType().equals("all")) {
				if(!session.getId().equals(webSocketSession.getId())) {
					webSocketSession.sendMessage(new TextMessage(session.getRemoteAddress().getHostName() + " >> " + messageVO.getMessage()));
				}
			}else {
				hostName = webSocketSession.getRemoteAddress().getHostName();
				if(messageVO.getTo().equals(hostName)) {
					webSocketSession.sendMessage(new TextMessage( "<span style = 'color:red; font-weight:bold;'>"
																   + session.getRemoteAddress().getHostName() +" >> "+ messageVO.getMessage()
																   + "</span>"));
					break;
				}
				
			}
		}
		
		/*
		 * Payload : 
		 */
		
		logger.info(session.getId() + "���� �޽���:" + message.getPayload());
		
		
	}
	
	
	/*
	 * 
	 * 
	 * @param  WebSocketSession
	 * 			
	 * 
	 * @param  CloseStatus
	 * 			
	 */
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		connectedUsers.remove(session);
		for(WebSocketSession webSocketSession : connectedUsers) {
			/*
			 * 
			 * 
			 */
			
			if(!session.getId().equals(webSocketSession.getId())) {
				webSocketSession.sendMessage(new TextMessage(session.getRemoteAddress().getHostName()+" �����߽��ϴ�."));
			}
		}
		
		logger.info(session.getId() + "���� �����߽��ϴ�.");
		
	}
	
}


