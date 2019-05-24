package kr.ac.duce.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.duce.model.FaqModel;

import kr.ac.duce.page.PageMaker;
import kr.ac.duce.page.SearchCriteria;
import kr.ac.duce.service.FaqService;

@Controller
public class FaqController {
	
	@Autowired	
	FaqService Service;
	
	@GetMapping(value="/faq/list")
	public ModelAndView FaqList(@ModelAttribute("cri")SearchCriteria cri, Model model){
		ModelAndView mav = new ModelAndView("/faq/list");
							
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(Service.countFaqListTotal(cri));
		
		List<Map<String,Object>> faqList = Service.searchFaqList(cri);
		mav.addObject("faqList",faqList);
		mav.addObject("pageMaker",pageMaker);
		return mav;		
	}
	
	@GetMapping("/faq/write") // URL 주소
	public String writeFaq(Model model) {
		return "/faq/write"; // JSP 파일명
	}
	
	@PostMapping(value = "/faq/write.do", params = {"faqTitle", "faqContent", "faqCategory"}) // URL 주소
	public String writefaq(@ModelAttribute("cri")SearchCriteria cri, Model model,@RequestParam String faqCategory, 
			@RequestParam String faqTitle, @RequestParam String faqContent)throws Exception {

		FaqModel insertFaq = new FaqModel();
		Date createDate = Calendar.getInstance().getTime();
		insertFaq.setFaqTitle(faqTitle);
		insertFaq.setUserID("작성자");
		insertFaq.setFaqCategory(faqCategory);
		insertFaq.setFaqDate(createDate);
		insertFaq.setFaqContent(faqContent);
		insertFaq.setFaqHits(1);
		Service.insertFaq(insertFaq);
		return "redirect:/faq/list"; // JSP 파일명
	}
	
	@GetMapping(value = "/faq/list", params = { "number" }) // URL 주소
	public String faqlist(SearchCriteria cri, Model model, @RequestParam String number) {		
		
		int contNo = Integer.parseInt(number);

		FaqModel faq = Service.faqNum(contNo).get(0);
		model.addAttribute("faq", faq);

		return "/faq/view"; // JSP 파일명
	}
	
	@PostMapping(value = "/faq/delete.do", params = {"faqNum"})
	public String deleteFaq(Model model, @RequestParam String faqNum) {
		Service.deleteFaq(Integer.parseInt(faqNum));
		return "redirect:/faq/list";
	}
	
	@PostMapping(value = "/faq/update", params = "faqNum") // URL 주소
	public String update(Model model, @RequestParam int faqNum) {
		FaqModel faq = Service.faqNum(faqNum).get(0);
		model.addAttribute("faq", faq);
		model.addAttribute("faqNum", faqNum);
		
		return "/faq/update"; // JSP 파일명
	}
	
	@PostMapping(value = "/faq/update.do", params = { "faqNum", "faqTitle", "faqContent", "faqCategory"}) // URL 주소
	public String updateOK(Model model, @RequestParam String faqNum, @RequestParam String faqTitle, 
			@RequestParam String faqCategory, @RequestParam String faqContent) throws Exception{
		Date createDate = Calendar.getInstance().getTime();
		FaqModel updateFaq = new FaqModel();
		updateFaq.setFaqDate(createDate);
		updateFaq.setFaqCategory(faqCategory);
		updateFaq.setFaqNum(Integer.parseInt(faqNum));
		updateFaq.setFaqTitle(faqTitle);
		updateFaq.setFaqContent(faqContent);
		Service.updateFaq(updateFaq);
		
		return "redirect:/faq/list"; // JSP 파일명
	}
}
