package kr.ac.duce.controller;

import kr.ac.duce.model.MemberModel;
import kr.ac.duce.service.MemberSignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberSignUpController {

    @Autowired
    MemberSignService service;

    @GetMapping("/register") // URL 주소
    public String signIn(Model model) {
        return "member/register"; // JSP 파일명
    }

    @PostMapping(value = "/register", params = { "id", "password", "name", "mail", "hp" })
    public String registerMember(@RequestParam String id, @RequestParam String password, @RequestParam String name,
                                 @RequestParam String mail, @RequestParam String hp) {
        MemberModel user = new MemberModel();
        user.setId(id);
        user.setPassword(password);
        user.setHp(hp);
        user.setMail(mail);
        user.setName(name);
        service.memberRegister(user);
        return "redirect:/";
    }

    }
