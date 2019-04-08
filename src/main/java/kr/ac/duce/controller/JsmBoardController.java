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

import kr.ac.duce.model.JsmBoardModel;
import kr.ac.duce.service.JsmBoardService;

@Controller
public class JsmBoardController {

	@Autowired
	JsmBoardService JsmBoardService;

	@GetMapping(value = "/jsmb", params = { "page", "content" }) // URL 주소
	public String list(Model model, @RequestParam String page, @RequestParam String content) {
		int contNo = Integer.parseInt(content);
		JsmBoardModel board = JsmBoardService.findByNo(contNo).get(0);
		model.addAttribute("board", board);
		model.addAttribute("page", Integer.parseInt(page));
		return "jsmbcont"; // JSP 파일명
	}

	@GetMapping(value = "/jsmb", params = "page") // URL 주소
	public String list(Model model, @RequestParam String page) {
		List<JsmBoardModel> boardList = JsmBoardService.findPage(Integer.parseInt(page));
		model.addAttribute("boardList", boardList);
		model.addAttribute("page", Integer.parseInt(page));
		return "jsmb"; // JSP 파일명
	}

	@GetMapping(value = "/jsmb") // URL 주소
	public String index(Model model) {
		List<JsmBoardModel> boardList = JsmBoardService.findPage(1);
		model.addAttribute("boardList", boardList);
		model.addAttribute("page", 1);
		return "jsmb"; // JSP 파일명
	}

	@GetMapping("/jsmb/write") // URL 주소
	public String write(Model model) {
		return "jsmb/write"; // JSP 파일명
	}

	@PostMapping(value = "/jsmb/modify", params = "bno") // URL 주소
	public String modify(Model model, @RequestParam int bno) {
		JsmBoardModel board = JsmBoardService.findByNo(bno).get(0);
		model.addAttribute("board", board);
		model.addAttribute("bno", bno);
		System.out.println("test");
		return "jsmb/modify"; // JSP 파일명
	}

	@PostMapping(value = "/jsmb/modify.do", params = { "bno", "bcontent", "bsubject" }) // URL 주소
	public String modifyOK(Model model, @RequestParam String bno, @RequestParam String bcontent,
			@RequestParam String bsubject) {
		System.out.println(bno + bsubject + bcontent);
		JsmBoardModel modModel = new JsmBoardModel();
		modModel.setNo(Integer.parseInt(bno));
		modModel.setSubject(bsubject);
		modModel.setContent(bcontent);
		JsmBoardService.update(modModel);
		return "redirect:/jsmb"; // JSP 파일명
	}
	
	@PostMapping(value = "/jsmb/delete.do", params = "no")
	public String delete(Model model, @RequestParam String no) {
		JsmBoardService.delete(Integer.parseInt(no));
		return "redirect:/jsmb"; // JSP 파일명
	}


	@PostMapping(value = "/jsmb/write.do", params = { "bpassword", "bwriter", "bsubject", "bcontent" }) // URL 주소
	public String writeOK(Model model, @RequestParam String bpassword, @RequestParam String bwriter,
			@RequestParam String bsubject, @RequestParam String bcontent) {
		Date writedate = Calendar.getInstance().getTime();
		int No = JsmBoardService.getTopNo() + 1;
		JsmBoardModel insertModel = new JsmBoardModel();
		insertModel.setNo(No);
		insertModel.setWriter(bwriter);
		insertModel.setWritedate(writedate);
		insertModel.setSubject(bsubject);
		insertModel.setPassword(bpassword);
		insertModel.setContent(bcontent);
		JsmBoardService.insert(insertModel);
		return "redirect:/jsmb"; // JSP 파일명
	}
}
