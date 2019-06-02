package kr.ac.duce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginAccessContorller {

    @GetMapping("/login") // URL 주소
    public String loginPage(HttpServletRequest request, Model model) {
        String prevPage = request.getHeader("Referer");
        request.getSession().setAttribute("prevPage", prevPage);
        return "member/login"; // JSP 파일명
    }

}
