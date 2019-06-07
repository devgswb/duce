package kr.ac.duce.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import kr.ac.duce.model.ProjectBoardViewModel;
import kr.ac.duce.module.BoardViewMaker;
import kr.ac.duce.page.Paging;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.duce.model.BranchCodeModel;
import kr.ac.duce.model.MajorCodeModel;
import kr.ac.duce.model.MemberModel;
import kr.ac.duce.model.ProjectBoardModel;
import kr.ac.duce.service.ProjectBoardService;

@Controller
public class ProjectBoardController {

	@Autowired
	ProjectBoardService ProjectBoardService;

	int displayPageNum = 5; // 페이징 개수 수정 시 ProjectBoardServiceImpl 에서
	int perPageNum = 15; // 페이징 당 글 개수 public List<ProjectBoardModel> findPage 도 수정할 것

	@GetMapping(value = "/project", params = { "page", "content", "major", "branch", "mYear" }) // URL 주소
	public String list(Model model, @RequestParam(value="page", defaultValue = "1") String page, @RequestParam String content,
			@RequestParam(value = "major", defaultValue = "all") String major,
			@RequestParam(value = "branch", defaultValue = "all") String branch,
			@RequestParam(value = "mYear", defaultValue = "all") String year) {
		int contNo = Integer.parseInt(content);
		String mYear = year;
		List<ProjectBoardModel> rawBoard = ProjectBoardService.findByNo(contNo);
		List<MajorCodeModel> majorList = ProjectBoardService.majorCode();
		List<BranchCodeModel> branchList = ProjectBoardService.branchCode();
		ProjectBoardViewModel board = BoardViewMaker.makeList(rawBoard, majorList, branchList).get(0);
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
		model.addAttribute("major", major);
		model.addAttribute("branch", branch);
		model.addAttribute("mYear", mYear);

		return "project/view"; // JSP 파일명
	}

	@GetMapping(value = "/project", params = "page") // URL 주소
	public String list(Model model, @RequestParam String page) {
		int pageCount = ((ProjectBoardService.findAll().size() - 1) / perPageNum) + 1;
		int pageStart = ((Integer.parseInt(page) - 1) / displayPageNum) * displayPageNum + 1;
		int pageEnd = Math.min(pageStart + 5 - 1, pageCount);
		boolean isPrev = Integer.parseInt(page) >= displayPageNum + 1;
		boolean isNext = pageEnd < pageCount;

		List<ProjectBoardModel> rawBoardList = ProjectBoardService.findPage(Integer.parseInt(page));

		List<MajorCodeModel> majorList = ProjectBoardService.majorCode();
		List<BranchCodeModel> branchList = ProjectBoardService.branchCode();
		List<ProjectBoardViewModel> boardList = BoardViewMaker.makeList(rawBoardList, majorList, branchList);
		List<String> yearList = ProjectBoardService.findAllYear();
		model.addAttribute("yearList", yearList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("majorList", majorList);
		model.addAttribute("branchList", branchList);
		model.addAttribute("pageStart", pageStart);
		model.addAttribute("pageEnd", pageEnd);
		model.addAttribute("isPrev", isPrev);
		model.addAttribute("isNext", isNext);
		model.addAttribute("page", Integer.parseInt(page));
//		model.addAttribute("pageCount", pageCount);
		return "project/list"; // JSP 파일명
	}

	@GetMapping(value = "/filter", params = { "page", "major", "branch", "mYear" }) // URL 주소
	public String filter(Model model, @RequestParam String page,
			@RequestParam(value = "major", defaultValue = "all") String major,
			@RequestParam(value = "branch", defaultValue = "all") String branch,
			@RequestParam(value = "mYear", defaultValue = "all") String year) {
		List<ProjectBoardModel> rawBoardList = null;
		List<MajorCodeModel> majorList = ProjectBoardService.majorCode();
		List<BranchCodeModel> branchList = ProjectBoardService.branchCode();
		List<String> paramList = new ArrayList<>(Arrays.asList((major.equals("all") ? "" : major),
				(branch.equals("all") ? "" : branch), (year.equals("all") ? "" : year)));
		String mYear = year;
		// All
		if (major.equals("all") && branch.equals("all") && mYear.equals("all")) {
			rawBoardList = ProjectBoardService.findPage(Integer.parseInt(page));
			Paging pg = new Paging();
			pg.setPaging(Integer.parseInt(page), ProjectBoardService.findAll().size(), perPageNum, displayPageNum);
			model.addAttribute("pageStart", pg.getPageStart());
			model.addAttribute("pageEnd", pg.getPageEnd());
			model.addAttribute("isPrev", pg.isPrev());
			model.addAttribute("isNext", pg.isNext());
			model.addAttribute("page", Integer.parseInt(page));
		}
		// M
		else if (!major.equals("all") && branch.equals("all") && mYear.equals("all")) {
			rawBoardList = ProjectBoardService.findbyfilterMP(major, Integer.parseInt(page));
			Paging pg = new Paging();
			pg.setPaging(Integer.parseInt(page), ProjectBoardService.findbyfilterM(major).size(), perPageNum,
					displayPageNum);
			model.addAttribute("pageStart", pg.getPageStart());
			model.addAttribute("pageEnd", pg.getPageEnd());
			model.addAttribute("isPrev", pg.isPrev());
			model.addAttribute("isNext", pg.isNext());
			model.addAttribute("page", Integer.parseInt(page));
		}
		// B
		else if (major.equals("all") && !branch.equals("all") && mYear.equals("all")) {
			rawBoardList = ProjectBoardService.findbyfilterBP(branch, Integer.parseInt(page));
			Paging pg = new Paging();
			pg.setPaging(Integer.parseInt(page), ProjectBoardService.findbyfilterB(branch).size(), perPageNum,
					displayPageNum);
			model.addAttribute("pageStart", pg.getPageStart());
			model.addAttribute("pageEnd", pg.getPageEnd());
			model.addAttribute("isPrev", pg.isPrev());
			model.addAttribute("isNext", pg.isNext());
			model.addAttribute("page", Integer.parseInt(page));
		}
		// Y
		else if (major.equals("all") && branch.equals("all") && !mYear.equals("all")) {
			rawBoardList = ProjectBoardService.findbyfilterYP(mYear, Integer.parseInt(page));
			Paging pg = new Paging();
			pg.setPaging(Integer.parseInt(page), ProjectBoardService.findbyfilterY(mYear).size(), perPageNum,
					displayPageNum);
			model.addAttribute("pageStart", pg.getPageStart());
			model.addAttribute("pageEnd", pg.getPageEnd());
			model.addAttribute("isPrev", pg.isPrev());
			model.addAttribute("isNext", pg.isNext());
			model.addAttribute("page", Integer.parseInt(page));
		}
		// MB
		else if (!major.equals("all") && !branch.equals("all") && mYear.equals("all")) {
			rawBoardList = ProjectBoardService.findbyfilterP(major, branch, Integer.parseInt(page));
			Paging pg = new Paging();
			pg.setPaging(Integer.parseInt(page), ProjectBoardService.findbyfilter(major, branch).size(), perPageNum,
					displayPageNum);
			model.addAttribute("pageStart", pg.getPageStart());
			model.addAttribute("pageEnd", pg.getPageEnd());
			model.addAttribute("isPrev", pg.isPrev());
			model.addAttribute("isNext", pg.isNext());
			model.addAttribute("page", Integer.parseInt(page));
		}
		// YB
		else if (major.equals("all") && !branch.equals("all") && !mYear.equals("all")) {
			rawBoardList = ProjectBoardService.findbyfilterYBP(mYear, branch, Integer.parseInt(page));
			Paging pg = new Paging();
			pg.setPaging(Integer.parseInt(page), ProjectBoardService.findbyfilterYB(mYear, branch).size(), perPageNum,
					displayPageNum);
			model.addAttribute("pageStart", pg.getPageStart());
			model.addAttribute("pageEnd", pg.getPageEnd());
			model.addAttribute("isPrev", pg.isPrev());
			model.addAttribute("isNext", pg.isNext());
			model.addAttribute("page", Integer.parseInt(page));
		}
		// YM
		else if (!major.equals("all") && branch.equals("all") && !mYear.equals("all")) {
			rawBoardList = ProjectBoardService.findbyfilterYMP(mYear, major, Integer.parseInt(page));
			Paging pg = new Paging();
			pg.setPaging(Integer.parseInt(page), ProjectBoardService.findbyfilterYM(mYear, major).size(), perPageNum,
					displayPageNum);
			model.addAttribute("pageStart", pg.getPageStart());
			model.addAttribute("pageEnd", pg.getPageEnd());
			model.addAttribute("isPrev", pg.isPrev());
			model.addAttribute("isNext", pg.isNext());
			model.addAttribute("page", Integer.parseInt(page));
		}
		// YMB
		else {
			rawBoardList = ProjectBoardService.findbyfilterYMBP(mYear, major, branch, Integer.parseInt(page));
			Paging pg = new Paging();
			pg.setPaging(Integer.parseInt(page), ProjectBoardService.findbyfilterYMB(mYear, major, branch).size(),
					perPageNum, displayPageNum);
			model.addAttribute("pageStart", pg.getPageStart());
			model.addAttribute("pageEnd", pg.getPageEnd());
			model.addAttribute("isPrev", pg.isPrev());
			model.addAttribute("isNext", pg.isNext());
			model.addAttribute("page", Integer.parseInt(page));
		}
		List<ProjectBoardViewModel> boardList = BoardViewMaker.makeList(rawBoardList, majorList, branchList);
		List<String> yearList = ProjectBoardService.findAllYear();
		model.addAttribute("paramList", paramList);
		model.addAttribute("yearList", yearList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("majorList", majorList);
		model.addAttribute("branchList", branchList);
		model.addAttribute("major", major);
		model.addAttribute("branch", branch);
		model.addAttribute("mYear", mYear);
		return "project/list"; // JSP 파일명
	}

	@GetMapping(value = "/search", params = { "page", "query" }) // URL 주소
	public String search(Model model, @RequestParam(value = "page", defaultValue = "1") String page,
			@RequestParam String query) {
		int pageCount = ((ProjectBoardService.searchProjectList(query).size() - 1) / perPageNum) + 1;
		int pageStart = ((Integer.parseInt(page) - 1) / displayPageNum) * displayPageNum + 1;
		int pageEnd = Math.min(pageStart + 5 - 1, pageCount);
		boolean isPrev = Integer.parseInt(page) >= displayPageNum + 1;
		boolean isNext = pageEnd < pageCount;
		List<ProjectBoardModel> rawBoardList = ProjectBoardService.searchProjectList(query, Integer.parseInt(page));
		List<MajorCodeModel> majorList = ProjectBoardService.majorCode();
		List<BranchCodeModel> branchList = ProjectBoardService.branchCode();
		List<ProjectBoardViewModel> boardList = BoardViewMaker.makeList(rawBoardList, majorList, branchList);
		List<String> yearList = ProjectBoardService.findAllYear();
		model.addAttribute("yearList", yearList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("majorList", majorList);
		model.addAttribute("branchList", branchList);
		model.addAttribute("pageStart", pageStart);
		model.addAttribute("pageEnd", pageEnd);
		model.addAttribute("isPrev", isPrev);
		model.addAttribute("isNext", isNext);
		model.addAttribute("query", query);
		model.addAttribute("page", Integer.parseInt(page));
//		model.addAttribute("pageCount", pageCount);
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
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		if (principal instanceof MemberModel) {
//			System.out.println(((MemberModel) principal).toString());
		} else {
//			System.out.println(principal.toString());
		}
		String loginID = ((MemberModel) principal).getId();
		String authority = ((MemberModel) principal).getAuthorities().toString();
		
		String setContent = board.getContent().replaceAll("<br/>", "\r\n");
		board.setContent(setContent);
		
		if (loginID.equals(board.getId()) || authority.equals("[admin]")) {
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
			
			return "/project/update";
		}
		else
		{
//			System.out.println("수정 접근 - ID 불일치.");
			
			return "redirect:/project?page=1";
		}
//		String saveImgs = board.getPhoto();
//		String saveFiles = board.getAddFile();
//		model.addAttribute("saveImgs", saveImgs);
//		model.addAttribute("saveFiles", saveFiles);
		 // JSP 파일명
	}

	@PostMapping(value = "/project/delete.do", params = "pNo")
	public String delete(Model model, @RequestParam String pNo) throws Exception {
		int deleteNo = Integer.parseInt(pNo);
		ProjectBoardModel filedelete = ProjectBoardService.findByNo(deleteNo).get(0);
		String img = filedelete.getPhoto();
		String add = filedelete.getAddFile();
		String[] imgs = img.split(",");
		String[] adds = add.split(",");

		String path = ProjectBoardController.class.getResource("").getPath();
		path = URLDecoder.decode(path, "UTF-8");
		String imgPath = path.split("/target")[0] + "/src/main/resources/images/project";
		String filePath = path.split("/target")[0] + "/src/main/resources/files/project";

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		if (principal instanceof MemberModel) {
//			System.out.println(((MemberModel) principal).toString());
		} else {
//			System.out.println(principal.toString());
		}
		String loginID = ((MemberModel) principal).getId();
		String authority = ((MemberModel) principal).getAuthorities().toString(); 

		if (loginID.equals(filedelete.getId()) || authority.equals("[admin]")) {
//			System.out.println("삭제 신청 - ID 일치.");
			ProjectBoardService.delete(Integer.parseInt(pNo));
			if (!imgs[0].equals("")) {
				for (String i : imgs) {
					File file = new File(imgPath + i.split("/project")[1]);
					File delfile = new File(imgPath + i.split("/project")[1] + ".del");

					if (file.exists()) {
						if (file.renameTo(delfile)) {
//							System.out.println("파일삭제 성공");
						} else {
//							System.out.println("파일삭제 실패");
						}
					} else {
//						System.out.println("파일이 존재하지 않습니다.");
					}
				}
			}

			if (!adds[0].equals("")) {
				for (String a : adds) {
					File file = new File(filePath + a.split("/project")[1]);
					File delfile = new File(filePath + a.split("/project")[1] + ".del");

					if (file.exists()) {
						if (file.renameTo(delfile)) {
//							System.out.println("파일삭제 성공");
						} else {
//							System.out.println("파일삭제 실패");
						}
					} else {
//						System.out.println("파일이 존재하지 않습니다.");
					}
				}
			}
//			System.out.println("Projcet 삭제 성공");
		} else {
//			System.out.println("삭제 신청 - ID 불일치.");
//			System.out.println("Projcet 삭제 실패");
		}

		return "redirect:/project?page=1"; // JSP 파일명
	}

	@PostMapping(value = "/project/update.do") // URL 주소
	public String modifyOK(Model model, @RequestParam String pNo, @RequestParam String title,
			@RequestParam String content, @RequestParam String part, @RequestParam String guide,
			@RequestParam String branch, @RequestParam String major, @RequestParam String video,
			@RequestParam String startDate, @RequestParam String finishDate,
			@RequestParam(value = "imgsDelete", defaultValue = "false") String imgsDelete,
			@RequestParam(value = "filesDelete", defaultValue = "false") String filesDelete,
			@RequestParam String reference, @RequestParam String saveImgs, @RequestParam String saveFiles,
			@RequestParam("uploadFile") List<MultipartFile> files, HttpServletRequest filerequest,
			@RequestParam("uploadAddFile") List<MultipartFile> addfiles, HttpServletRequest addfilerequest)
			throws Exception {
		
		ProjectBoardModel updateboard = ProjectBoardService.findByNo(Integer.parseInt(pNo)).get(0);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		if (principal instanceof MemberModel) {
//			System.out.println(((MemberModel) principal).toString());
		} else {
//			System.out.println(principal.toString());
		}
		String loginID = ((MemberModel) principal).getId();
		String authority = ((MemberModel) principal).getAuthorities().toString(); 
		if (loginID.equals(updateboard.getId()) || authority.equals("[admin]")) {
//		System.out.println("수정 접근 - ID 일치.");
			
		String imgPath = "";
		String addPath = "";
		String simgPath = saveImgs;
		String sfilePath = saveFiles;
		String fileDel = filesDelete;
		String imgsDel = imgsDelete;
		boolean isThumbNotMade = true;

		// img 기존파일 삭제 Not Checked
		if (!imgsDel.equals("true")) {
			imgPath = simgPath;
			for (MultipartFile file : files) {
				String originalName = file.getOriginalFilename();
				// 이미지 추가 - 기존이미지 유지
				if (!file.getOriginalFilename().equals("")) {
					UUID uuid = UUID.randomUUID();
					String path = ProjectBoardController.class.getResource("").getPath();
					path = URLDecoder.decode(path, "UTF-8");
					path = path.split("/target")[0] + "/src/main/resources/images/project/";
					String fileName = uuid.toString() + "-" + file.getOriginalFilename();
					File f = new File(path, fileName);
					file.transferTo(f);
					if (isThumbNotMade) {
						String[] extensionArray = fileName.split("\\.");
						String FILE_EXTENSION = extensionArray[(extensionArray.length) - 1];
						makeThumbnail(path + fileName, fileName, FILE_EXTENSION);
						isThumbNotMade = false;
					}
					imgPath = imgPath + "/img/project/" + fileName + ",";
				}
				// 이미지 유지
				else if (file.getOriginalFilename().equals("")) {
					break;
				}
			}
		}
		// img 기존파일 삭제 Checked
		else if (imgsDel.equals("true")) {
			String path = ProjectBoardController.class.getResource("").getPath();
			path = URLDecoder.decode(path, "UTF-8");
			String deleteimgPath = path.split("/target")[0] + "/src/main/resources/images/project";
			String[] imgs = simgPath.split(",");
			if (!imgs[0].equals("")) {
				for (String i : imgs) {
					File imgfile = new File(deleteimgPath + i.split("/project")[1]);
					File delimgfile = new File(deleteimgPath + i.split("/project")[1] + ".del");
					if (imgfile.exists()) {
						if (imgfile.renameTo(delimgfile)) {
//							System.out.println("파일삭제 성공");
						} else {
//							System.out.println("파일삭제 실패");
						}
					} else {
//						System.out.println("파일이 존재하지 않습니다.");
					}
				}
			}

			for (MultipartFile file : files) {
				String originalName = file.getOriginalFilename();
				// 이미지 신규추가
				if (!file.getOriginalFilename().equals("")) {
					UUID uuid = UUID.randomUUID();
					path = ProjectBoardController.class.getResource("").getPath();
					path = URLDecoder.decode(path, "UTF-8");
					path = path.split("/target")[0] + "/src/main/resources/images/project/";
					String fileName = uuid.toString() + "-" + file.getOriginalFilename();
					File f = new File(path, fileName);
					file.transferTo(f);
					if (isThumbNotMade) {
						String[] extensionArray = fileName.split("\\.");
						String FILE_EXTENSION = extensionArray[(extensionArray.length) - 1];
						makeThumbnail(path + fileName, fileName, FILE_EXTENSION);
						isThumbNotMade = false;
					}
					imgPath = imgPath + "/img/project/" + fileName + ",";
				}
			}
		}

		// AddFile 기존파일 삭제 Not Checked
		if (!fileDel.equals("true")) {
			addPath = sfilePath;
			for (MultipartFile addfile : addfiles) {
				String originalName = addfile.getOriginalFilename();
				// 파일 추가 - 기존파일 유지
				if (!addfile.getOriginalFilename().equals("")) {
					UUID uuid = UUID.randomUUID();
					String path = ProjectBoardController.class.getResource("").getPath();
					path = URLDecoder.decode(path, "UTF-8");
					path = path.split("/target")[0] + "/src/main/resources/files/project/";
					String fileName = uuid.toString() + "-" + addfile.getOriginalFilename();
					File f = new File(path, fileName);
					addfile.transferTo(f);
					addPath = addPath + "/file/project/" + fileName + ",";
				}
				// 파일 유지
				else if (addfile.getOriginalFilename().equals("")) {
					break;
				}
			}
		}
		// AddFile 기존파일 삭제 Checked
		else if (fileDel.equals("true")) {
			// 파일 삭제
			String path = ProjectBoardController.class.getResource("").getPath();
			path = URLDecoder.decode(path, "UTF-8");
			String deletefilePath = path.split("/target")[0] + "/src/main/resources/files/project";
			String[] adds = sfilePath.split(",");
			if (!adds[0].equals("")) {
				for (String a : adds) {
					File addfile = new File(deletefilePath + a.split("/project")[1]);
					File deladdfile = new File(deletefilePath + a.split("/project")[1] + ".del");

					if (addfile.exists()) {
						if (addfile.renameTo(deladdfile)) {
//							System.out.println("파일삭제 성공");
						} else {
//							System.out.println("파일삭제 실패");
						}
					} else {
//						System.out.println("파일이 존재하지 않습니다.");
					}
				}
			}

			for (MultipartFile addfile : addfiles) {
				String originalName = addfile.getOriginalFilename();
				// 파일 신규추가
				if (!addfile.getOriginalFilename().equals("")) {
					UUID uuid = UUID.randomUUID();
					path = ProjectBoardController.class.getResource("").getPath();
					path = URLDecoder.decode(path, "UTF-8");
					path = path.split("/target")[0] + "/src/main/resources/files/project/";
					String fileName = uuid.toString() + "-" + addfile.getOriginalFilename();
					File f = new File(path, fileName);
					addfile.transferTo(f);
					addPath = addPath + "/file/project/" + fileName + ",";
				}
			}
		}

//		for(MultipartFile file : files) {
//			String originalName = file.getOriginalFilename();
//			
//			if(! file.getOriginalFilename().equals("")) {
//				UUID uuid = UUID.randomUUID();
//				String path = ProjectBoardController.class.getResource("").getPath();		
//				path = URLDecoder.decode(path, "UTF-8");
//				path = path.split("/target")[0]+"/src/main/resources/images/project/";
//				String fileName =  uuid.toString() + "-"+ file.getOriginalFilename();
//				File f = new File(path, fileName);
//			    file.transferTo(f);
//				if (isThumbNotMade) {
//					String[] extensionArray = fileName.split("\\.");
//					String FILE_EXTENSION = extensionArray[(extensionArray.length) - 1];
//					makeThumbnail(path+fileName, fileName, FILE_EXTENSION);
//					isThumbNotMade = false;
//				}
//			    imgPath = imgPath + "/img/project/" + fileName + ",";
//			}
//		}
//
//		for(MultipartFile addfile : addfiles) {
//			String originalName = addfile.getOriginalFilename();
//
//			if(! addfile.getOriginalFilename().equals("")) {
//				UUID uuid = UUID.randomUUID();
//				String path = ProjectBoardController.class.getResource("").getPath();
//				path = URLDecoder.decode(path, "UTF-8");
//				path = path.split("/target")[0]+"/src/main/resources/files/project/";
//				String fileName =  uuid.toString() + "-"+ addfile.getOriginalFilename();
//				File f = new File(path, fileName);
//			    addfile.transferTo(f);
//			    addPath = addPath + "/file/project/" + fileName + ",";
//			}
//		}

		Date dStartDate = YYYYMMtoDate(startDate);
		Date dFinishDate = YYYYMMtoDate(finishDate);

		if (!video.equals("")) {
			video = video.substring(video.lastIndexOf("=") + 1);
		}

		int No = Integer.parseInt(pNo);
		ProjectBoardModel modModel = new ProjectBoardModel();
		modModel.setpNo(No);
		modModel.setTitle(title);
		modModel.setContent(content.replaceAll("\r\n", "<br/>"));
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
		}	
		else {
//			System.out.println("수정 접근 - ID 불일치.");
		}
		
		return "redirect:/project?page=1"; // JSP 파일명
	}

	@PostMapping(value = "/project/write.do", params = { "id", "title", "content" }) // URL 주소
	public String writeOK(Model model, @RequestParam String id, @RequestParam String title,
			@RequestParam String content, @RequestParam String part, @RequestParam String guide,
			@RequestParam String branch, @RequestParam String major, @RequestParam String video,
			@RequestParam String reference, @RequestParam("uploadFile") List<MultipartFile> files,
			@RequestParam String finishDate, @RequestParam String startDate, HttpServletRequest filerequest,
			@RequestParam("uploadAddFile") List<MultipartFile> addfiles, HttpServletRequest addfilerequest)
			throws Exception {
		String imgPath = "";
		String addPath = "";
		Boolean isThumbNotMade = true;
		for (MultipartFile file : files) {
			String originalName = file.getOriginalFilename();

//			System.out.println(originalName);

			if (!file.getOriginalFilename().equals("")) {
				UUID uuid = UUID.randomUUID();
				String path = ProjectBoardController.class.getResource("").getPath();
				path = URLDecoder.decode(path, "UTF-8");
				path = path.split("/target")[0] + "/src/main/resources/images/project/";
				String fileName = uuid.toString() + "-" + file.getOriginalFilename();
				File f = new File(path, fileName);
				file.transferTo(f);
				if (isThumbNotMade) {
					String[] extensionArray = fileName.split("\\.");
					String FILE_EXTENSION = extensionArray[(extensionArray.length) - 1];
					makeThumbnail(path + fileName, fileName, FILE_EXTENSION);
					isThumbNotMade = false;
				}
				imgPath = imgPath + "/img/project/" + fileName + ",";
			}
		}

		for (MultipartFile addfile : addfiles) {
			String originalName = addfile.getOriginalFilename();

//			System.out.println(originalName);

			if (!addfile.getOriginalFilename().equals("")) {
				UUID uuid = UUID.randomUUID();
				String path = ProjectBoardController.class.getResource("").getPath();
				path = URLDecoder.decode(path, "UTF-8");
				path = path.split("/target")[0] + "/src/main/resources/files/project/";
				String fileName = uuid.toString() + "-" + addfile.getOriginalFilename();
				File f = new File(path, fileName);
				addfile.transferTo(f);
				addPath = addPath + "/file/project/" + fileName + ",";
			}
		}

		if (video.contains("https://www.youtube.com/")) {
			if (!video.equals("")) {
				video = video.substring(video.lastIndexOf("=") + 1);
			}
		} else {
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
		insertModel.setContent(content.replaceAll("\r\n", "<br/>"));
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
		return "redirect:/project?page=1"; // JSP 파일명
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

	private void makeThumbnail(String filePath, String fileName, String fileExt) throws Exception {

		String path = ProjectBoardController.class.getResource("").getPath();
		path = URLDecoder.decode(path, "UTF-8");
		path = path.split("/target")[0] + "/src/main/resources/images/project/thumb/";
		// 저장된 원본파일로부터 BufferedImage 객체를 생성합니다.
		BufferedImage srcImg = ImageIO.read(new File(filePath));

		// 썸네일의 너비와 높이 입니다.
		int dw = 330, dh = 200;

		// 원본 이미지의 너비와 높이 입니다.
		int ow = srcImg.getWidth();
		int oh = srcImg.getHeight();

		// 원본 너비를 기준으로 하여 썸네일의 비율로 높이를 계산합니다.
		int nw = ow;
		int nh = (ow * dh) / dw;

		// 계산된 높이가 원본보다 높다면 crop이 안되므로
		// 원본 높이를 기준으로 썸네일의 비율로 너비를 계산합니다.
		if (nh > oh) {
			nw = (oh * dw) / dh;
			nh = oh;
		}

		// 계산된 크기로 원본이미지를 가운데에서 crop 합니다.
		BufferedImage cropImg = Scalr.crop(srcImg, (ow - nw) / 2, (oh - nh) / 2, nw, nh);

		// crop된 이미지로 썸네일을 생성합니다.
		BufferedImage destImg = Scalr.resize(cropImg, dw, dh);

		// 썸네일을 저장합니다. 이미지 이름 앞에 "THUMB_" 를 붙여 표시했습니다.
		String thumbName = path + fileName;
		File thumbFile = new File(thumbName);
		ImageIO.write(destImg, fileExt.toLowerCase(), thumbFile);
	}

}
