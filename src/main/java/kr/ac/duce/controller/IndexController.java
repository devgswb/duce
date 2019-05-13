package kr.ac.duce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("/") // URL 주소
	public String index(Model model) {

		return "index"; // JSP 파일명
	}
	
	
}
