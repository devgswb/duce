package kr.ac.duce.controller;

import kr.ac.duce.model.MemberModel;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginAccessContorller {

    @GetMapping("/login") // URL 주소
    public String loginPage(HttpServletRequest request, Model model) {
        String prevPage = request.getHeader("Referer");
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        Object principal = auth.getPrincipal();
//        if (principal instanceof MemberModel) {
//            System.out.println( ((MemberModel) principal).toString());
//        } else {
//            System.out.println(principal.toString());
//        } 로그인 체크
        boolean isLoggined = !(auth.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ANONYMOUS")));
        if (isLoggined) return "redirect:" + prevPage;
        request.getSession().setAttribute("prevPage", prevPage);
        return "member/login"; // JSP 파일명
    }

}
