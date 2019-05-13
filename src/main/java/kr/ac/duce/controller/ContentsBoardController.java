package kr.ac.duce.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.duce.model.ContentsBoardModel;
import kr.ac.duce.service.ContentsBoardService;

@Controller
public class ContentsBoardController {

	@Autowired
	ContentsBoardService ContentsBoardService;

	@GetMapping(value = "/ContentsBoard", params = { "page", "bContent" }) // URL 주소
	public String list(Model model, @RequestParam String page, @RequestParam String bContent) {
		int contNo = Integer.parseInt(bContent);
		ContentsBoardModel board = ContentsBoardService.findByNo(contNo).get(0);
		model.addAttribute("board", board);
		model.addAttribute("page", Integer.parseInt(page));
		return "ContentsBoardcont"; // JSP 파일명
	}

	@GetMapping(value = "/ContentsBoard", params = "page") // URL 주소
	public String list(Model model, @RequestParam String page) {
		List<ContentsBoardModel> boardList = ContentsBoardService.findPage(Integer.parseInt(page));
		model.addAttribute("boardList", boardList);
		model.addAttribute("page", Integer.parseInt(page));
		return "ContentsBoard"; // JSP 파일명
	}

	@GetMapping(value = "/ContentsBoard") // URL 주소
	public String index(Model model) {
		List<ContentsBoardModel> boardList = ContentsBoardService.findPage(1);
		model.addAttribute("boardList", boardList);
		model.addAttribute("page", 1);
		return "ContentsBoard"; // JSP 파일명
	}

	@GetMapping("/ContentsBoard/write") // URL 주소
	public String write(Model model) {
		return "ContentsBoard/write"; // JSP 파일명
	}

	@PostMapping(value = "/ContentsBoard/modify", params = "bNo") // URL 주소
	public String modify(Model model, @RequestParam int bNo) {
		ContentsBoardModel board = ContentsBoardService.findByNo(bNo).get(0);
		model.addAttribute("board", board);
		model.addAttribute("bno", bNo);
		System.out.println("test");
		return "ContentsBoard/modify"; // JSP 파일명
	}

	
	@PostMapping(value = "/ContentsBoard/delete.do", params = "bNo")
	public String delete(Model model, @RequestParam String bNo) {
		ContentsBoardService.delete(Integer.parseInt(bNo));
		return "redirect:/ContentsBoard"; // JSP 파일명
	}


	@PostMapping(value = "/ContentsBoard/modify.do", params = {"bNo", "bTitle", "bContent" }) // URL 주소
	public String modifyOK(Model model, @RequestParam String bNo, @RequestParam String bTitle, @RequestParam String bContent) {
		System.out.println(bNo + bContent + bTitle);
		int No = Integer.parseInt(bNo);
		ContentsBoardModel modModel = new ContentsBoardModel();
		modModel.setbNo(No);
		modModel.setbTitle(bTitle);
		modModel.setbContent(bContent);
		ContentsBoardService.update(modModel);
		return "redirect:/ContentsBoard"; // JSP 파일명
	}
	
	
	@PostMapping(value = "/ContentsBoard/write.do", params = {"userName", "bTitle", "bContent"}) // URL 주소
	public String writeOK(Model model, /*@RequestParam int bNo,*/ @RequestParam String userName,
			@RequestParam String bTitle, @RequestParam String bContent) {
		Date writedate = Calendar.getInstance().getTime();
//		int No = ContentsBoardService.getTopbNo() + 1;
		int Hit = 0;
		ContentsBoardModel insertModel = new ContentsBoardModel();
		insertModel.setUserName(userName);
		insertModel.setbTitle(bTitle);
		insertModel.setbContent(bContent);
		insertModel.setbDate(writedate);
		insertModel.setbHit(Hit);
		ContentsBoardService.insert(insertModel);
		return "redirect:/ContentsBoard"; // JSP 파일명
	}
}
