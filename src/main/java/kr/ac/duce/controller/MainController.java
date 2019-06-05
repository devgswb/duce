package kr.ac.duce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	
	@RequestMapping("/") // URL 주소
	public String index(Model model) {
		return "index"; // JSP 파일명
	}

    @RequestMapping(value="/error", method = {RequestMethod.GET, RequestMethod.POST})
    public String errorPage(Model model) {
        return "error"; // JSP 파일명
    }

	@RequestMapping("/intro") // URL 주소
	public String intro(Model model) {
		return "intro"; // JSP 파일명
	}
	
}
