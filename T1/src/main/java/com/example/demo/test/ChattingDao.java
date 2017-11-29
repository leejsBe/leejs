package com.example.demo.test;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;


@Component
public class ChattingDao extends SqlSessionImpl{
	
	
	public List<HashMap<String, String>> chkidpwd(HashMap<String, String> chk) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("chkidpwd",chk);
	}


	public List<HashMap<String, String>> retrieveRoomList(HashMap<String, String> input) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("roomList",input);
	}


	public List<HashMap<String, String>> retrieveChat(HashMap<String, String> input) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("retrieveChat",input);
	}


	public void saveChat(HashMap<String, String> input) {
		// TODO Auto-generated method stub
		this.sqlSession.insert("saveChat",input);
	}


	public List<HashMap<String, String>> retrieveFriendList(HashMap<String, String> input) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("friendList",input);
	}


	public List<HashMap<String, String>> chkRoomId(HashMap<String, String> input) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("FriendRoomIdChk",input);
	}


	public void createRoom(HashMap<String, String> input) {
		// TODO Auto-generated method stub
		this.sqlSession.insert("createRoom",input);
	}


	public List<HashMap<String, String>> getRoomId(HashMap<String, String> input) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("getRoomId",input);
	}


	public void createUserRoom(HashMap<String, String> input) {
		// TODO Auto-generated method stub
		this.sqlSession.insert("createUserRoom",input);
		input.put("userid",input.get("frndid"));
		this.sqlSession.insert("createUserRoom",input);
	}


	public void chkReadUpdate(HashMap<String, String> input) {
		// TODO Auto-generated method stub
		List<HashMap<String, String>> list = this.sqlSession.selectList("chkExistData",input);
		if( String.valueOf(list.get(0).get("COUNT")).equals("0") ) {
			///add date by user room
			this.sqlSession.insert("insertReadData",input);
		}else {
			this.sqlSession.update("updateReadData",input);
		}
		
	}


	public List<HashMap<String, String>> retrieveProfileImgInRoom(HashMap<String, String> input) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectList("retrieveProfileImgInRoom",input);
	}






}
