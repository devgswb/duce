package kr.ac.duce.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.duce.model.UserManageModel;
import kr.ac.duce.page.PageMaker;
import kr.ac.duce.page.SearchCriteria;
import kr.ac.duce.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminservice;
	
	// 관리자 페이지 - 유저관리 페이지에 유저 리스트 넘김
		@GetMapping(value = "/user/management")
		public ModelAndView ManagementForm(Model model, @ModelAttribute("cri")SearchCriteria cri)throws Exception {
			ModelAndView mav = new ModelAndView("/admin/usermanagement");
			List<Map<String,Object>> list = adminservice.readAllUsers(cri);
			PageMaker pg = new PageMaker();
			pg.setCri(cri);
			
			mav.addObject("pagemaker", pg);
			
			mav.addObject("list", list);
			return mav;
		}

		
		//정보수정 실행
		@PostMapping(value = "/user/management.do", params = {"id"})
		public String ManagementDo(UserManageModel um ,@RequestParam String id, @RequestParam String authority/*, @RequestParam boolean isEnabled*/) {
			um.setId(id);
			um.setAuthority(authority);

			System.out.println("id= " +id);
			System.out.println("aut = " + authority);
			adminservice.updateAuthor(um);
//			adminservice.updateEnabled(um);
			return "redirect:/admin/usermanagement";
		}
}
