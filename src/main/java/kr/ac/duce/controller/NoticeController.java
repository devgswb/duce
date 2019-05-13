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

import kr.ac.duce.model.NoticeModel;
import kr.ac.duce.page.PageMaker;
import kr.ac.duce.page.SearchCriteria;
import kr.ac.duce.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired	
	NoticeService Service;
	
//	@GetMapping("/noticeList")
//	public String list(Model model) {
//		List<NoticeModel> noticeList = Service.findAll();
//		model.addAttribute("noticeList", noticeList);
//		return "noticeList"; // JSP 파일명
//	}
	
//	@GetMapping("/noticeList")
//	public String list(Model model) {
//		List<NoticeModel> noticeList = Service.listPage(1);
//		model.addAttribute("noticeList", noticeList);
//		model.addAttribute("page", 1);
//		return "noticeList";
//	}
//	
//	@GetMapping(value = "/noticeList", params = "page") 
//	public String list(Model model, @RequestParam String page) {
//		List<NoticeModel> noticeList = Service.listPage(Integer.parseInt(page));
//		model.addAttribute("noticeList", noticeList);
//		model.addAttribute("page", Integer.parseInt(page));
//		return "noticeList"; 
//	}
	
	@GetMapping(value = "/noticeList", params = { "number" }) // URL 주소
	public String list(Model model, @RequestParam String number) {
		int prev = Integer.parseInt(number);
		int next = Integer.parseInt(number);
		int contNo = Integer.parseInt(number);
		NoticeModel prevPage = Service.prev(prev).get(0);
		NoticeModel nextPage = Service.next(next).get(0);
		NoticeModel notice = Service.findNum(contNo).get(0);
		model.addAttribute("notice", notice);
		model.addAttribute("prev", prevPage);
		model.addAttribute("next", nextPage);
		return "noticeView"; // JSP 파일명
	}
	
	
	@GetMapping("/noticeWrite") // URL 주소
	public String write(Model model) {
		return "noticeWrite"; // JSP 파일명
	}
	
	@PostMapping(value = "/noticeWrite.do", params = { "noticeTitle", "noticeContent" }) // URL 주소
	public String writeOK(Model model, @RequestParam String noticeTitle, @RequestParam String noticeContent) {
		Date createDate = Calendar.getInstance().getTime();	
		NoticeModel insertModel = new NoticeModel();
		insertModel.setNoticeTitle(noticeTitle);
		insertModel.setUserID("작성자");
		insertModel.setNoticeDate(createDate);
		insertModel.setNoticeContent(noticeContent);
		insertModel.setNoticeHits(1);
		Service.insert(insertModel);
		return "redirect:/noticeList"; // JSP 파일명
	}
	
	@PostMapping(value = "/noticeUpdate", params = "noticeNum") // URL 주소
	public String update(Model model, @RequestParam int noticeNum) {
		NoticeModel notice = Service.findNum(noticeNum).get(0);
		model.addAttribute("notice", notice);
		model.addAttribute("noticeNum", noticeNum);
		System.out.println("test");
		return "noticeUpdate"; // JSP 파일명
	}
	
	@PostMapping(value = "/noticeUpdate.do", params = { "noticeNum", "noticeTitle", "noticeContent" }) // URL 주소
	public String updateOK(Model model, @RequestParam String noticeNum, @RequestParam String noticeTitle,
			@RequestParam String noticeContent) {
		System.out.println(noticeNum + noticeTitle + noticeContent);
		NoticeModel updatenotice = new NoticeModel();
		updatenotice.setNoticeNum(Integer.parseInt(noticeNum));
		updatenotice.setNoticeTitle(noticeTitle);
		updatenotice.setNoticeContent(noticeContent);
		Service.update(updatenotice);
		return "redirect:/noticeList"; // JSP 파일명
	}
	
	@PostMapping(value = "/noticeDelete.do", params = {"noticeNum"})
	public String deleteOK(Model model, @RequestParam String noticeNum) {
		Service.delete(Integer.parseInt(noticeNum));
		return "redirect:/noticeList";
	}
	
	@GetMapping(value="/noticeList")
	public void searchNoticeList(@ModelAttribute("cri") SearchCriteria cri,Model model) {
		List<Map<String, Object>> noticeList = Service.searchNoticeList(cri);
		model.addAttribute("noticeList",noticeList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(Service.countNoticeListTotal(cri));
		model.addAttribute("pageMaker", pageMaker);
	}

//	@GetMapping(value="/noticeList")
//	public ModelAndView NoticeList(@ModelAttribute("cri")SearchCriteria cri,Model model, 
//			@RequestParam(required = false, defaultValue = "n") String searchType, 
//			@RequestParam(required = false) String keyword){
//		ModelAndView mav = new ModelAndView("/noticeList");
//							
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri);
//		pageMaker.setTotalCount(Service.countNoticeListTotal(cri));
//		
//		List<Map<String,Object>> noticeList = Service.searchNoticeList(cri);
//		mav.addObject("noticeList",noticeList);
//		mav.addObject("pageMaker",pageMaker);
//		return mav;		
//	}
	
	
	
//	@GetMapping(value = "/noticeList.do", params = { "keyword", "searchType"}) // URL 주소
//	public String updateOK(SearchCriteria cri, @RequestParam String keyword, @RequestParam String searchType) {
//		
//		SearchCriteria search = new SearchCriteria();
//		search.setKeyword(keyword);
//		search.setSearchType(searchType);
//		Service.update(updatenotice);
//		return "redirect:/noticeList"; // JSP 파일명
//	}
//	
	
	
//	@RequestMapping(value ="/noticeList")
//	public void listPage(@ModelAttribute("scri") SearchCriteria scri, Model model)
//	{
//		List<NoticeModel> noticeList = Service.listSearch(scri);
//		model.addAttribute("noticeList",noticeList);
//		
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(scri);
//		pageMaker.setTotalCount(Service.countNoticeListTotal());
//		model.addAttribute("pageMaker",pageMaker);		
//	}
	

	

}
