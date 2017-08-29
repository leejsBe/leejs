package com.example.demo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.test.ChattingDao;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import net.minidev.json.JSONObject;


@Controller
@RequestMapping("/test")
public class TestController {

	@Autowired
	private MemberRepository memberDao;
	
	
	@ResponseBody
	@RequestMapping("/test")
	public String test(Model model) {
			return "Hello World";
		
	}
	
	@RequestMapping("/index")
	public String index(Model model) {
		model.addAttribute("name","hi~!~ Hello");
			return "index";
		
	}
	
	
	////////////////////////////////////////////////
	@RequestMapping(value = "/add", method=RequestMethod.GET)
	public String add(Users member) {
		return "test/add";
	}
	
	@RequestMapping(value = "/add", method=RequestMethod.POST)
	public String postadd(Users member) {
		memberDao.save(member);
		return "redirect:/test/list";
	}
	
	
	@RequestMapping(value = "/mod/{id}", method = RequestMethod.GET)
	public String mod(@PathVariable int id, Model model){
		Users users = memberDao.findOne(id);
		model.addAttribute("data",users);
		return "test/mod";
	}
	
	@RequestMapping(value="/mod")
	public String postMod(Users users){
		memberDao.save(users);
		return "redirect:/test/list";
	}
	
	@RequestMapping("/del/{id}")
	public String del(@PathVariable int id){
		memberDao.delete(id);
		return "redirect:/test/list";
	}
	
	
	@RequestMapping("/list")
	public String list(Model model){
		List<Users> memberList = memberDao.findAll();		
		model.addAttribute("list",memberList);
	
		return "test/list";
	}
	
	
	
	
	@RequestMapping("/edit/{id}")
	@ResponseBody
	public Users edit(Users member) {
		Users memberData = memberDao.save(member);
		return memberData;
	}
	
	
	
	@RequestMapping("/chat")
	public String viewChattingPage() {
		return "chatting/chat";
	}
	
	@RequestMapping("/paint")
	public String viewPaintingPage() {
		return "chatting/paint";
	}
	
	
	///////////////////////////////////////////
	
	@Autowired
	private ChattingDao chattingDao;
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/chatting")
	public String viewPage(Model model, HttpServletRequest request) {
		
		if(request.getParameter("0") != null && request.getParameter("1") != null && request.getParameter("2") != null && request.getParameter("3") != null) {
			model.addAttribute("userid",request.getParameter("0"));
			model.addAttribute("roomName",request.getParameter("1"));
			model.addAttribute("roomid",request.getParameter("2"));
			model.addAttribute("user_nicname",request.getParameter("3"));
			
			return "chatting/chatting";
		}else {
			return "redirect:/test/entry";
		}
		
	}
	
	@RequestMapping("/roomList")
	public String viewRoom() {
		return "chatting/mainPage";
	}
	
	@RequestMapping("/friendList")
	public String friendList() {
		return "chatting/friendList";
	}
	
	@RequestMapping("/entry")
	public String viewEntry(HttpSession httpSession) {
		httpSession.setAttribute("ef", "33");
		return "chatting/entry";
	}
	
	@RequestMapping(value = "/chkidpwd", method=RequestMethod.POST)
	public String chkidpwd(String userid, String password, HttpSession httpSession) {
		
		HashMap<String,String> input = new HashMap<>();
		input.put("userid",userid);
		input.put("password", password);
		
		List<HashMap<String, String>> chk = chattingDao.chkidpwd(input);
		
		httpSession.setAttribute("userid", chk.get(0).get("USERID"));
		httpSession.setAttribute("user_nicname", chk.get(0).get("USER_NICNAME"));
		httpSession.setAttribute("user_email", chk.get(0).get("USER_EMAIL"));
		httpSession.setAttribute("profile_img", chk.get(0).get("PROFILE_IMG"));
		
		return "redirect:/test/roomList";
		
	}
	

	
	
	@RequestMapping("/retrieveRoomList")
	@ResponseBody
	public String retrieveRoomList(String userid,String search, HttpSession httpSession) {
		
		if(httpSession.getAttribute("userid")=="" || httpSession.getAttribute("userid") == null) {
			return "USERIDISNULL";
		}
		
		HashMap<String,String> input = new HashMap<>();
		input.put("userid",userid.trim());
		input.put("search",search);
		
	
		List<HashMap<String, String>> roomList = chattingDao.retrieveRoomList(input);
		
		Gson gson = new Gson();
		String jsonPlace = gson.toJson(roomList);
		
		return jsonPlace;
	}
	
	
	@RequestMapping("/retrieveChat")
	@ResponseBody
	public String retrieveChat(String roomid, String userid) throws Exception{
		HashMap<String,String> input = new HashMap<>();
		input.put("roomid",roomid);
		input.put("userid",userid);
		
		///메시지 읽었다고 업데이트
		chattingDao.chkReadUpdate(input);
		
		
		List<HashMap<String, String>> retrieveChat = chattingDao.retrieveChat(input);
		
		
		Gson gson = new Gson();
		String jsonPlace = gson.toJson(retrieveChat);
		
		return jsonPlace;
	}
	
	
	@RequestMapping("/retrieveFriendList")
	@ResponseBody
	public String retrieveFriendList(String userid,String search, HttpSession httpSession) {
		
		if(httpSession.getAttribute("userid")=="" || httpSession.getAttribute("userid") == null) {
			return "USERIDISNULL";
		}
		
		HashMap<String,String> input = new HashMap<>();
		input.put("userid",userid.trim());
		input.put("search",search);
		
		List<HashMap<String, String>> friendList = chattingDao.retrieveFriendList(input);
		
		Gson gson = new Gson();
		String jsonPlace = gson.toJson(friendList);
		
		return jsonPlace;
	}
	
	@RequestMapping("/retrieveFriendRoomId")
	@ResponseBody
	public String retrieveFriendRoomId(String userid, String frndid, HttpSession httpSession) {
		
		if(httpSession.getAttribute("userid")=="" || httpSession.getAttribute("userid") == null) {
			return "USERIDISNULL";
		}
		
		if(frndid=="" || frndid == null) {
			return "FRNDIDISNULL";
		}
		
		HashMap<String,String> input = new HashMap<>();
		input.put("userid",userid.trim());
		input.put("frndid",frndid.trim());
		
		
		List<HashMap<String, String>> chkRoomId = chattingDao.chkRoomId(input);
		
		if(chkRoomId.size()>0) { //// 서로 공통된 방 있음
			
			return String.valueOf(chkRoomId.get(0).get("CHK"));
		
		}else { //// 서로 공통된 방 없음
			////새로 방만들기
			chattingDao.createRoom(input);
			List<HashMap<String, String>> getRoomId = chattingDao.getRoomId(input);
			
			String inRoomId = String.valueOf(getRoomId.get(0).get("ROOMID"));
			input.put("roomid",inRoomId);

			
			chattingDao.createUserRoom(input);
			
			
			return inRoomId;
		}
		
	}
	
	@RequestMapping("/readChat")
	@ResponseBody
	public String readChat(String roomid, String userid) throws Exception{
		HashMap<String,String> input = new HashMap<>();
		input.put("roomid",roomid);
		input.put("userid",userid);
		System.out.println(roomid);
		System.out.println(userid);
		
		///메시지 읽었다고 업데이트
		chattingDao.chkReadUpdate(input);
		
		
		return "";
	}	
	
}
