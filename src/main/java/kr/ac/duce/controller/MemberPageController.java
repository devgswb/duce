package kr.ac.duce.controller;

import java.security.Principal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.duce.model.MemberModel;
import kr.ac.duce.model.ProjectBoardModel;
import kr.ac.duce.service.MemberSignService;

@Controller
public class MemberPageController {
	
    @Autowired
    MemberSignService service;
    
    @Autowired
    private PasswordEncoder pwEncoder;
    
    @GetMapping(value = "/user/update")
	public String update(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Object principal = auth.getPrincipal();
        if (principal instanceof MemberModel) {
            System.out.println( ((MemberModel) principal).toString());
        } else {
            System.out.println(principal.toString());
        }
    	String id = ((MemberModel) principal).getId();
        List<ProjectBoardModel> project = service.findproject(id);
		model.addAttribute("user", principal);
		model.addAttribute("project", project);
		return "/user/update"; // JSP 파일명
	}
    
    @PostMapping(value = "/user/update.do",params= {"id","mail","hp"})
    public String updateUser(Model model, @RequestParam String mail, @RequestParam String hp, 
    		@RequestParam String id) {
    	MemberModel updateUser = new MemberModel();
    	updateUser.setMail(mail);
    	updateUser.setHp(hp);
    	updateUser.setId(id);
		service.updateUser(updateUser);
		return "redirect:/";
    }
    
    @PostMapping(value = "/user/check")
   	public String check(Model model) {
   		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
           Object principal = auth.getPrincipal();
           if (principal instanceof MemberModel) {
               System.out.println( ((MemberModel) principal).toString());
           } else {
               System.out.println(principal.toString());
           }
   		model.addAttribute("user", principal);
   		
   		return "/user/check"; // JSP 파일명
   	}
    
    @PostMapping(value = "/user/check.do",params= {"pw","pwd","id"})
    public String updatePw(HttpSession session, Model model, @RequestParam String pw, @RequestParam String pwd, 
    		@RequestParam String id) {
    	MemberModel updatePwd = new MemberModel();
    	MemberModel user = service.getUserById(id);
    	String Password = pw; //원래 비밀번호
    	String encodedPassword = user.getPassword();//암호화되어 DB에 저장된 패스워드
    	String newPw = pwd; //새로운 비밀번호
    	if(pwEncoder.matches(Password, encodedPassword)){
    			updatePwd.setPassword(newPw);
    			updatePwd.setId(id);
    			service.updatePw(updatePwd);
    			System.out.println("변경되었습니다.");
    			session.invalidate() ;
    			return "redirect:/";
    	}
    	else {
    		model.addAttribute("error", "현재 비밀번호를 다시 확인해 주세요");
    		return "/user/check";
    	}
    }
    
    @PostMapping(value = "/user/delete")
   	public String delete(Model model) {
   		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
           Object principal = auth.getPrincipal();
           if (principal instanceof MemberModel) {
               System.out.println( ((MemberModel) principal).toString());
           } else {
               System.out.println(principal.toString());
           }
   		model.addAttribute("user", principal);
   		
   		return "/user/delete"; // JSP 파일명
   	}
    
    @PostMapping(value = "/user/delete.do",params= {"pw", "id"})
    public String deleteUser(HttpSession session, Model model, @RequestParam String pw, @RequestParam String id) {
    	MemberModel deleteUser = new MemberModel();
    	MemberModel user = service.getUserById(id);
    	String Password = pw; //원래 비밀번호
    	String encodedPassword = user.getPassword();//암호화되어 DB에 저장된 패스워드
    	if(pwEncoder.matches(Password, encodedPassword)){
    			boolean delete = false;  
    			deleteUser.setId(id);
    			deleteUser.setEnabled(delete);
    			service.deleteUser(deleteUser);
    			System.out.println("변경되었습니다.");
    			session.invalidate() ;
    			return "redirect:/";
    	}
    	else {
    		model.addAttribute("error", "비밀번호가 맞지 않습니다.");
    		return "/user/delete";
    	}
    }

}
