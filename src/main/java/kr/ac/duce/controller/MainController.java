package kr.ac.duce.controller;

import kr.ac.duce.model.BranchCodeModel;
import kr.ac.duce.model.MajorCodeModel;
import kr.ac.duce.model.ProjectBoardModel;
import kr.ac.duce.model.ProjectBoardViewModel;
import kr.ac.duce.service.IndexPageService;
import kr.ac.duce.service.ProjectBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MainController {

	@Autowired
	IndexPageService indexPageService;

	@RequestMapping("/") // URL 주소
	public String index(Model model) {
		List<ProjectBoardViewModel> boardList = indexPageService.getSampleProject(6);
		model.addAttribute("boardList", boardList);
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
