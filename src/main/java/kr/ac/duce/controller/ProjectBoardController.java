package kr.ac.duce.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import kr.ac.duce.model.BranchCodeModel;
import kr.ac.duce.model.MajorCodeModel;
import kr.ac.duce.model.ProjectBoardModel;
import kr.ac.duce.service.ProjectBoardService;

@Controller
public class ProjectBoardController {

	@Autowired
	ProjectBoardService ProjectBoardService;

	@GetMapping(value = "/project", params = { "page", "content"}) // URL 주소
	public String list(Model model, @RequestParam String page, @RequestParam String content) {
		int contNo = Integer.parseInt(content);
		ProjectBoardModel board = ProjectBoardService.findByNo(contNo).get(0);
		model.addAttribute("board", board);
		model.addAttribute("page", Integer.parseInt(page));
		
		String fileName = "";
		
		if (!board.getAddFile().equals("")) {
			String[] file = board.getAddFile().split(",");

			for (int i = 0; i < file.length; i++) {
				fileName = fileName + file[i].split("-")[5] + ",";
			}
		}
		model.addAttribute("fileName", fileName);
		
		return "project/view"; // JSP 파일명
	}
	
	@GetMapping(value = "/project", params = "page") // URL 주소
	public String list(Model model, @RequestParam String page) {
		List<ProjectBoardModel> boardList = ProjectBoardService.findPage(Integer.parseInt(page));
		model.addAttribute("boardList", boardList);
		model.addAttribute("page", Integer.parseInt(page));
		return "project/list"; // JSP 파일명
	}
	
	@GetMapping(value = "/filter") // URL 주소
	public String filter(Model model, @RequestParam String major, @RequestParam String branch, @RequestParam String mYear) {
		List<ProjectBoardModel> boardList = null;
		List<MajorCodeModel> majorList = ProjectBoardService.majorCode();
		List<BranchCodeModel> branchList = ProjectBoardService.branchCode();
		
		// All
		if(major.equals("all") && branch.equals("all") && mYear.equals("all")) {
			boardList = ProjectBoardService.findAll();
		}
		//M
		else if(!major.equals("all") && branch.equals("all") && mYear.equals("all")) {
			boardList = ProjectBoardService.findbyfilterM(major);
		}
		//B
		else if(major.equals("all") && !branch.equals("all") && mYear.equals("all")) {
			boardList = ProjectBoardService.findbyfilterB(branch);
		}
		//Y
		else if(major.equals("all") && branch.equals("all") && !mYear.equals("all")) {
			boardList = ProjectBoardService.findbyfilterY(mYear);
		}
		//MB
		else if(!major.equals("all") && !branch.equals("all") && mYear.equals("all")) {
			boardList = ProjectBoardService.findbyfilter(major, branch);
		}
		//YB
		else if(major.equals("all") && !branch.equals("all") && !mYear.equals("all")) {
			boardList = ProjectBoardService.findbyfilterYB(mYear, branch);
		}
		//YM
		else if(!major.equals("all") && branch.equals("all") && !mYear.equals("all")) {
			boardList = ProjectBoardService.findbyfilterYM(mYear, major);
		}
		//YMB
		else {
			boardList = ProjectBoardService.findbyfilterYMB(mYear, major, branch);
		}

		model.addAttribute("boardList", boardList);
		model.addAttribute("majorList", majorList);
		model.addAttribute("branchList", branchList);
		model.addAttribute("page", 1);
		return "project/list"; // JSP 파일명
	}

	@GetMapping(value = "/project") // URL 주소
	public String index(Model model) {
		List<ProjectBoardModel> boardList = ProjectBoardService.findAll();
		List<MajorCodeModel> majorList = ProjectBoardService.majorCode();
		List<BranchCodeModel> branchList = ProjectBoardService.branchCode();
		model.addAttribute("boardList", boardList);
		model.addAttribute("majorList", majorList);
		model.addAttribute("branchList", branchList);
		model.addAttribute("page", 1);
		return "project/list"; // JSP 파일명
	}
	
	@GetMapping("/project/write") // URL 주소
	public String write(Model model) {
		List<MajorCodeModel> majorList = ProjectBoardService.majorCode();
		List<BranchCodeModel> branchList = ProjectBoardService.branchCode();
		model.addAttribute("majorList", majorList);
		model.addAttribute("branchList", branchList);
		return "project/write"; // JSP 파일명
	}

	@PostMapping(value = "/project/update", params = "pNo") // URL 주소
	public String modify(Model model, @RequestParam int pNo) {
		ProjectBoardModel board = ProjectBoardService.findByNo(pNo).get(0);
		List<MajorCodeModel> majorList = ProjectBoardService.majorCode();
		List<BranchCodeModel> branchList = ProjectBoardService.branchCode();
		model.addAttribute("majorList", majorList);
		model.addAttribute("branchList", branchList);
		model.addAttribute("board", board);
		model.addAttribute("pno", pNo);
		System.out.println("test");
		return "/project/update"; // JSP 파일명
	}

	
	@PostMapping(value = "/project/delete.do", params = "pNo")
	public String delete(Model model, @RequestParam String pNo) throws Exception {
		int deleteNo = Integer.parseInt(pNo);
		ProjectBoardModel filedelete = ProjectBoardService.findByNo(deleteNo).get(0);
		ProjectBoardService.delete(Integer.parseInt(pNo));	
		String img = filedelete.getPhoto();
		String add = filedelete.getAddFile();
		String[] imgs = img.split(",");
		String[] adds = add.split(",");
//		System.out.println(img);
//		System.out.println(imgs[0].split("/project/")[1]);
//		System.out.println(add);
//		System.out.println(adds[0].split("/project/")[1]);
		
		String path = ProjectBoardController.class.getResource("").getPath();		
		path = URLDecoder.decode(path, "UTF-8");
		path = path.split("/target")[0]+"/src/main/resources/static/project";
//		System.out.println(path);
		
		if (!imgs[0].equals("")) {
			for(String i : imgs) {
				File file = new File(path + i.split("/project")[1]);
				
				if(file.exists()) {
					if(file.delete()) {
						System.out.println("파일삭제 성공");
					}
					else {
						System.out.println("파일삭제 실패");
					}
				}
				else {
					System.out.println("파일이 존재하지 않습니다.");
				}
			}
		}
		
		if (!adds[0].equals("")) {
			for(String a : adds) {
				File file = new File(path + a.split("/project")[1]);
				
				if(file.exists()) {
					if(file.delete()) {
						System.out.println("파일삭제 성공");
					}
					else {
						System.out.println("파일삭제 실패");
					}
				}
				else {
					System.out.println("파일이 존재하지 않습니다.");
				}
			}
		}
		
		return "redirect:/project"; // JSP 파일명
	}


	@PostMapping(value = "/project/update.do") // URL 주소
	public String modifyOK(Model model, @RequestParam String pNo, @RequestParam String title, @RequestParam String content,  @RequestParam String part,  @RequestParam String guide,
			@RequestParam String branch,  @RequestParam String major,  @RequestParam String video, @RequestParam String reference, @RequestParam("uploadFile") List<MultipartFile> files
	        ,HttpServletRequest filerequest, @RequestParam("uploadAddFile") List<MultipartFile> addfiles
	        ,HttpServletRequest addfilerequest) throws Exception {
			
		String imgPath = "";
		String addPath = "";
		
		for(MultipartFile file : files) {
			String originalName = file.getOriginalFilename();
			
			System.out.println(originalName);
			
			if(! file.getOriginalFilename().equals("")) {
				UUID uuid = UUID.randomUUID();
				String path = ProjectBoardController.class.getResource("").getPath();		
				path = URLDecoder.decode(path, "UTF-8");
				System.out.println(path);
				path = path.split("/target")[0]+"/src/main/resources/static/project/img/";
				String fileName =  uuid.toString() + "-"+ file.getOriginalFilename();
				File f = new File(path, fileName);
			    file.transferTo(f);
			    imgPath = imgPath + "/res/project/img/" + fileName + ",";
			}
		}
		
		for(MultipartFile addfile : addfiles) {
			String originalName = addfile.getOriginalFilename();
			
			System.out.println(originalName);
			
			if(! addfile.getOriginalFilename().equals("")) {
				UUID uuid = UUID.randomUUID();
				String path = ProjectBoardController.class.getResource("").getPath();
				path = URLDecoder.decode(path, "UTF-8");
				path = path.split("/target")[0]+"/src/main/resources/static/project/file/";
				String fileName =  uuid.toString() + "-"+ addfile.getOriginalFilename();
				File f = new File(path, fileName);
			    addfile.transferTo(f);
			    addPath = addPath + "/res/project/file/" + fileName + ",";
			}
		}
		
		if(! video.equals("")) {	video = video.substring(video.lastIndexOf("=") + 1);	}
		
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
		modModel.setPhoto(imgPath);
		modModel.setAddFile(addPath);
		modModel.setReference(reference);
		ProjectBoardService.update(modModel);	
		return "redirect:/project"; // JSP 파일명
	}
	
	
	@PostMapping(value = "/project/write.do", params = {"id", "title", "content"}) // URL 주소
	public String writeOK(Model model, @RequestParam String id,  @RequestParam String title, @RequestParam String content,  @RequestParam String part,  @RequestParam String guide,
			@RequestParam String branch,  @RequestParam String major,  @RequestParam String video, @RequestParam String reference, @RequestParam("uploadFile") List<MultipartFile> files
	        ,HttpServletRequest filerequest, @RequestParam("uploadAddFile") List<MultipartFile> addfiles
	        ,HttpServletRequest addfilerequest) throws Exception {
		
		String imgPath = "";
		String addPath = "";
		
		for(MultipartFile file : files) {
			String originalName = file.getOriginalFilename();
			
			System.out.println(originalName);
			
			if(! file.getOriginalFilename().equals("")) {
				UUID uuid = UUID.randomUUID();
				String path = ProjectBoardController.class.getResource("").getPath();
				path = URLDecoder.decode(path, "UTF-8");
				path = path.split("/target")[0]+"/src/main/resources/static/project/img/";
				String fileName =  uuid.toString() + "-" + file.getOriginalFilename();
				File f = new File(path, fileName);
			    file.transferTo(f);
			    imgPath = imgPath + "/res/project/img/" + fileName + ",";
			}
		}
		
		
		for(MultipartFile addfile : addfiles) {
			String originalName = addfile.getOriginalFilename();
			
			System.out.println(originalName);
			
			if(! addfile.getOriginalFilename().equals("")) {
				UUID uuid = UUID.randomUUID();
				String path = ProjectBoardController.class.getResource("").getPath();
				path = URLDecoder.decode(path, "UTF-8");
				path = path.split("/target")[0]+"/src/main/resources/static/project/file/";
				String fileName =  uuid.toString() + "-" + addfile.getOriginalFilename();
				File f = new File(path, fileName);
			    addfile.transferTo(f);
			    addPath = addPath + "/res/project/file/" + fileName + ",";
			}
		}
		
		if(video.contains("https://www.youtube.com/")) {
			if(! video.equals("")) {	video = video.substring(video.lastIndexOf("=") + 1);	}
		}
		else
		{
			video = "";
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
		insertModel.setPhoto(imgPath);
		insertModel.setAddFile(addPath);
		insertModel.setReference(reference);
		ProjectBoardService.insert(insertModel);
		return "redirect:/project"; // JSP 파일명
	}
	
}
