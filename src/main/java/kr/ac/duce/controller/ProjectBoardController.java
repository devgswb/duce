package kr.ac.duce.controller;

import java.io.File;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import kr.ac.duce.model.ProjectBoardViewModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
		List<ProjectBoardModel> rawBoardList = ProjectBoardService.findPage(Integer.parseInt(page));
		List<MajorCodeModel> majorList = ProjectBoardService.majorCode();
		List<BranchCodeModel> branchList = ProjectBoardService.branchCode();
		List<ProjectBoardViewModel> boardList = makeBoardViewList(rawBoardList, majorList, branchList);
		List<String> yearList = ProjectBoardService.findAllYear();
		model.addAttribute("yearList", yearList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("page", Integer.parseInt(page));
		return "project/list"; // JSP 파일명
	}
	
	@GetMapping(value = "/filter") // URL 주소
	public String filter(Model model, @RequestParam(value="major", defaultValue="all") String major,
						 @RequestParam(value="branch", defaultValue="all") String branch,
						 @RequestParam(value="mYear", defaultValue="all") String mYear) {
		List<ProjectBoardModel> rawBoardList = null;
		List<MajorCodeModel> majorList = ProjectBoardService.majorCode();
		List<BranchCodeModel> branchList = ProjectBoardService.branchCode();
		List<String> paramList = new ArrayList<>(Arrays.asList(
				(major.equals("all") ? "" : major),
				(branch.equals("all") ? "" : branch),
				(mYear.equals("all") ? "" : mYear)
		));

		// All
		if(major.equals("all") && branch.equals("all") && mYear.equals("all")) {
			rawBoardList = ProjectBoardService.findAll();
		}
		//M
		else if(!major.equals("all") && branch.equals("all") && mYear.equals("all")) {
			rawBoardList = ProjectBoardService.findbyfilterM(major);
		}
		//B
		else if(major.equals("all") && !branch.equals("all") && mYear.equals("all")) {
			rawBoardList = ProjectBoardService.findbyfilterB(branch);
		}
		//Y
		else if(major.equals("all") && branch.equals("all") && !mYear.equals("all")) {
			rawBoardList = ProjectBoardService.findbyfilterY(mYear);
		}
		//MB
		else if(!major.equals("all") && !branch.equals("all") && mYear.equals("all")) {
			rawBoardList = ProjectBoardService.findbyfilter(major, branch);
		}
		//YB
		else if(major.equals("all") && !branch.equals("all") && !mYear.equals("all")) {
			rawBoardList = ProjectBoardService.findbyfilterYB(mYear, branch);
		}
		//YM
		else if(!major.equals("all") && branch.equals("all") && !mYear.equals("all")) {
			rawBoardList = ProjectBoardService.findbyfilterYM(mYear, major);
		}
		//YMB
		else {
			rawBoardList = ProjectBoardService.findbyfilterYMB(mYear, major, branch);
		}
		List<ProjectBoardViewModel> boardList = makeBoardViewList(rawBoardList, majorList, branchList);
		List<String> yearList = ProjectBoardService.findAllYear();
		model.addAttribute("paramList", paramList);
		model.addAttribute("yearList", yearList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("majorList", majorList);
		model.addAttribute("branchList", branchList);
		model.addAttribute("page", 1);
		return "project/list"; // JSP 파일명
	}

	@GetMapping(value = "/project") // URL 주소
	public String index(Model model) {
		List<ProjectBoardModel> rawBoardList = ProjectBoardService.findAll();
		List<MajorCodeModel> majorList = ProjectBoardService.majorCode();
		List<BranchCodeModel> branchList = ProjectBoardService.branchCode();
		List<String> yearList = ProjectBoardService.findAllYear();
		List<ProjectBoardViewModel> boardList = makeBoardViewList(rawBoardList, majorList, branchList);
		model.addAttribute("yearList", yearList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("majorList", majorList);
		model.addAttribute("branchList", branchList);
		model.addAttribute("page", 1);
		return "project/list"; // JSP 파일명
	}

	// 뷰에 알맞게 boardList 생성
	private List<ProjectBoardViewModel> makeBoardViewList(List<ProjectBoardModel> rawBoardList,
														  List<MajorCodeModel> majorList,
														  List<BranchCodeModel> branchList) {
		List<ProjectBoardViewModel> boardList = new ArrayList<>();
		for (ProjectBoardModel ele : rawBoardList) {
			try {
				ProjectBoardViewModel appendEle = new ProjectBoardViewModel(ele);
				for (MajorCodeModel major : majorList) {
					if (major.getMajorNo().equals(appendEle.getMajorNo())) {
						appendEle.setMajor(major.getMajor());
						break;
					}
				} // 전공 코드가 아닌 이름으로
				for (BranchCodeModel branch : branchList) {
					if (branch.getBranchNo().equals(appendEle.getBranchNo())) {
						appendEle.setBranch(branch.getBranch());
						break;
					}
				} // 분야 코드가 아닌 이름으로
				Date finishDate = appendEle.getFinishDate();
				DateFormat df = new SimpleDateFormat("yyyy");
				appendEle.setYear(df.format(finishDate));
				// 간단히 부를 수 있게 년도값 추가
				int viewContentLength = 140;
				String strContent = appendEle.getContent();
				String strViewContent = strContent.substring(0, (strContent.length() > viewContentLength ? viewContentLength : strContent.length()) );
				strViewContent += (strContent.length() > viewContentLength ? "..." : "");
				appendEle.setViewContent(strViewContent);
				// 메인 페이지용 간이 텍스트 만들기
				String[] partStudents = appendEle.getPart().split(",");
				String viewPartStudents = partStudents[0];
				if (partStudents.length != 1) viewPartStudents += " 외 " + (partStudents.length-1) + "명";
				appendEle.setViewPartStudents(viewPartStudents);
				// 참가학생 텍스트 생성
				boardList.add(appendEle);
			} catch (NullPointerException e) {
			}
		}
		return boardList;
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
		DateFormat df = new SimpleDateFormat("yyyy-MM");
		String startDate = df.format(board.getStartDate());
		String finishDate = df.format(board.getFinishDate());
		List<MajorCodeModel> majorList = ProjectBoardService.majorCode();
		List<BranchCodeModel> branchList = ProjectBoardService.branchCode();
		model.addAttribute("majorList", majorList);
		model.addAttribute("branchList", branchList);
		model.addAttribute("board", board);
		model.addAttribute("pno", pNo);
		model.addAttribute("startDate", startDate);
		model.addAttribute("finishDate", finishDate);
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
			@RequestParam String branch,  @RequestParam String major,  @RequestParam String video,
						   @RequestParam String startDate, @RequestParam String finishDate,
						   @RequestParam String reference, @RequestParam("uploadFile") List<MultipartFile> files
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
				path = path.split("/target")[0]+"/src/main/resources/images/project/";
				String fileName =  uuid.toString() + "-"+ file.getOriginalFilename();
				File f = new File(path, fileName);
			    file.transferTo(f);
			    imgPath = imgPath + "/img/project/" + fileName + ",";
			}
		}

		for(MultipartFile addfile : addfiles) {
			String originalName = addfile.getOriginalFilename();

			System.out.println(originalName);

			if(! addfile.getOriginalFilename().equals("")) {
				UUID uuid = UUID.randomUUID();
				String path = ProjectBoardController.class.getResource("").getPath();
				path = URLDecoder.decode(path, "UTF-8");
				path = path.split("/target")[0]+"/src/main/resources/files/project/";
				String fileName =  uuid.toString() + "-"+ addfile.getOriginalFilename();
				File f = new File(path, fileName);
			    addfile.transferTo(f);
			    addPath = addPath + "/file/project/" + fileName + ",";
			}
		}

		Date dStartDate = YYYYMMtoDate(startDate);
		Date dFinishDate = YYYYMMtoDate(finishDate);

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
		modModel.setStartDate(dStartDate);
		modModel.setFinishDate(dFinishDate);
		modModel.setPhoto(imgPath);
		modModel.setAddFile(addPath);
		modModel.setReference(reference);
		ProjectBoardService.update(modModel);	
		return "redirect:/project"; // JSP 파일명
	}
	
	
	@PostMapping(value = "/project/write.do", params = {"id", "title", "content"}) // URL 주소
	public String writeOK(Model model, @RequestParam String id,  @RequestParam String title, @RequestParam String content,
						  @RequestParam String part,  @RequestParam String guide, @RequestParam String branch,
						  @RequestParam String major,  @RequestParam String video, @RequestParam String reference,
						  @RequestParam("uploadFile") List<MultipartFile> files, @RequestParam String finishDate,
						  @RequestParam String startDate
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
				path = path.split("/target")[0]+"/src/main/resources/images/project/";
				String fileName =  uuid.toString() + "-" + file.getOriginalFilename();
				File f = new File(path, fileName);
			    file.transferTo(f);
			    imgPath = imgPath + "/img/project/" + fileName + ",";
			}
		}


		for(MultipartFile addfile : addfiles) {
			String originalName = addfile.getOriginalFilename();

			System.out.println(originalName);

			if(! addfile.getOriginalFilename().equals("")) {
				UUID uuid = UUID.randomUUID();
				String path = ProjectBoardController.class.getResource("").getPath();
				path = URLDecoder.decode(path, "UTF-8");
				path = path.split("/target")[0]+"/src/main/resources/files/project/";
				String fileName =  uuid.toString() + "-" + addfile.getOriginalFilename();
				File f = new File(path, fileName);
			    addfile.transferTo(f);
			    addPath = addPath + "/file/project/" + fileName + ",";
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
		Date dStartDate = YYYYMMtoDate(startDate);
		Date dFinishDate = YYYYMMtoDate(finishDate);

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
		insertModel.setStartDate(dStartDate);
		insertModel.setFinishDate(dFinishDate);
		ProjectBoardService.insert(insertModel);
		return "redirect:/project"; // JSP 파일명
	}

	private Date YYYYMMtoDate(String inputYYYYMM) {
		inputYYYYMM += "-02";
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date resultDate = null;
		try {
			resultDate = transFormat.parse(inputYYYYMM);
		} catch (ParseException e) {
			return null;
		}
		return resultDate;
	}
}
