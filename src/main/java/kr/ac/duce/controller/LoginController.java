package kr.ac.duce.controller;




import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.duce.dao.UserDao;
import kr.ac.duce.model.UserModel;
import kr.ac.duce.service.impl.LoginServiceImpl;

@Controller
public class LoginController {

	@Autowired
	LoginServiceImpl loginservice;
	
	@Autowired
	UserDao userDao;

	
	@RequestMapping(value = "/login", method = {RequestMethod.POST,RequestMethod.GET})
	public String viewLoginForm() {
		return "member/login";
	}
	
	@RequestMapping(value ="/register", method = {RequestMethod.POST,RequestMethod.GET})
	public String viewRegiFrom() {
		
		return "member/register";
	}
	
	//권한 확인위한 임시 메서드. 나중에 삭제 요망
	@RequestMapping("/readAuthority/{id}")
	public @ResponseBody String openAuthor(@PathVariable String id) {
		String auth = userDao.readAuthority(id);
		
		StringBuffer buf = new StringBuffer();
		
			buf.append(auth);
			buf.append(" ");
		
		return buf.toString();
	}
	
	@RequestMapping(value ="/loginFailure")
	public String loginFailure(){
		String fail = "로그인 실패";
		return fail;
	}
}
