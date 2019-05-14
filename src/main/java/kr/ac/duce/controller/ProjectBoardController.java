package kr.ac.duce.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.duce.model.ProjectBoardModel;
import kr.ac.duce.service.ProjectBoardService;

@Controller
public class ProjectBoardController {

	@Autowired
	ProjectBoardService ProjectBoardService;

	@GetMapping(value = "/projectboard", params = { "page", "content"}) // URL 주소
	public String list(Model model, @RequestParam String page, @RequestParam String content) {
		int contNo = Integer.parseInt(content);
		ProjectBoardModel board = ProjectBoardService.findByNo(contNo).get(0);
		model.addAttribute("board", board);
		model.addAttribute("page", Integer.parseInt(page));
		return "ProjectBoardcont"; // JSP 파일명
	}

	@GetMapping(value = "/projectboard", params = "page") // URL 주소
	public String list(Model model, @RequestParam String page) {
		List<ProjectBoardModel> boardList = ProjectBoardService.findPage(Integer.parseInt(page));
		model.addAttribute("boardList", boardList);
		model.addAttribute("page", Integer.parseInt(page));
		return "ProjectBoard"; // JSP 파일명
	}

	@GetMapping(value = "/projectboard") // URL 주소
	public String index(Model model) {
		List<ProjectBoardModel> boardList = ProjectBoardService.findPage(1);
		model.addAttribute("boardList", boardList);
		model.addAttribute("page", 1);
		return "ProjectBoard"; // JSP 파일명
	}
	
	@GetMapping("/projectboard/write") // URL 주소
	public String write(Model model) {
		return "ProjectBoard/write"; // JSP 파일명
	}

	@PostMapping(value = "/projectboard/modify", params = "pNo") // URL 주소
	public String modify(Model model, @RequestParam int pNo) {
		ProjectBoardModel board = ProjectBoardService.findByNo(pNo).get(0);
		model.addAttribute("board", board);
		model.addAttribute("pno", pNo);
		return "ProjectBoard/modify"; // JSP 파일명
	}

	
	@PostMapping(value = "/projectboard/delete.do", params = "pNo")
	public String delete(Model model, @RequestParam String pNo) {
		ProjectBoardService.delete(Integer.parseInt(pNo));
		return "redirect:/projectboard"; // JSP 파일명
	}


	@PostMapping(value = "/projectboard/modify.do") // URL 주소
	public String modifyOK(Model model, @RequestParam String pNo, @RequestParam String title, @RequestParam String content,  @RequestParam String part,  @RequestParam String guide,
			@RequestParam String branch,  @RequestParam String major,  @RequestParam String video, @RequestParam("uploadFile") MultipartFile file
	        ,HttpServletRequest request) throws Exception {
		
		String path = "";
		
		if(! file.getOriginalFilename().equals("")) {
			UUID uuid = UUID.randomUUID();
			
			String fileName =  uuid.toString() + "_"+ file.getOriginalFilename();
			File f = new File("C:\\Users\\user\\Desktop\\git\\De\\src\\main\\webapp\\img\\" + fileName);
		    file.transferTo(f);
		    path = "/img/" + fileName;
		}
		
		int No = Integer.parseInt(pNo);
		ProjectBoardModel modModel = new ProjectBoardModel();
		modModel.setpNo(No);
		modModel.setTitle(title);
		modModel.setContent(content);
		modModel.setPart(part);
		modModel.setGuide(guide);
		modModel.setBranchNo(branch);
		modModel.setMajorNo(major);
		modModel.setVideo(video);
		modModel.setPhoto(path);
		ProjectBoardService.update(modModel);
		return "redirect:/projectboard"; // JSP 파일명
	}
	
	
	@PostMapping(value = "/projectboard/write.do", params = {"id", "title", "content"}) // URL 주소
	public String writeOK(Model model, @RequestParam String id,  @RequestParam String title, @RequestParam String content,  @RequestParam String part,  @RequestParam String guide,
			@RequestParam String branch,  @RequestParam String major,  @RequestParam String video, @RequestParam("uploadFile") MultipartFile file
	        ,HttpServletRequest request) throws Exception {
				
		String path = "";
		
		if(! file.getOriginalFilename().equals("")) {
			UUID uuid = UUID.randomUUID();
			
			String fileName =  uuid.toString() + "_"+ file.getOriginalFilename();
			File f = new File("C:\\Users\\user\\Desktop\\git\\De\\src\\main\\webapp\\img\\" + fileName);
		    file.transferTo(f);
		    path = "/img/" + fileName;
		}
     
		Date writedate = Calendar.getInstance().getTime();
//		int No = ContentsBoardService.getTopbNo() + 1;
		int Hit = 0;
		ProjectBoardModel insertModel = new ProjectBoardModel();
		insertModel.setId(id);
		insertModel.setTitle(title);
		insertModel.setContent(content);
		insertModel.setPart(part);
		insertModel.setGuide(guide);
		insertModel.setBranchNo(branch);
		insertModel.setpDate(writedate);
		insertModel.setHit(Hit);
		insertModel.setMajorNo(major);
		insertModel.setVideo(video);
		insertModel.setPhoto(path);
		ProjectBoardService.insert(insertModel);
		return "redirect:/projectboard"; // JSP 파일명
	}

}
