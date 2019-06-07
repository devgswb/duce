package kr.ac.duce.controller;

import java.awt.event.ActionEvent;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.hibernate.dialect.Ingres9Dialect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.duce.model.NoticeFileModel;
import kr.ac.duce.model.NoticeModel;
import kr.ac.duce.page.PageCriteria;
import kr.ac.duce.page.PageMaker;
import kr.ac.duce.page.SearchCriteria;
import kr.ac.duce.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired	
	NoticeService Service;	

	
	@GetMapping(value = "/notice/list", params = { "number" }) // URL 주소
	public String list(SearchCriteria cri, Model model, @RequestParam String number) {
		int prev = Integer.parseInt(number);
		int next = Integer.parseInt(number);
		int contNo = Integer.parseInt(number);
		int max = Service.countNoticeListTotal(cri);
		NoticeModel prevPage = Service.prev(prev).get(0);
		NoticeModel nextPage = Service.next(next).get(0);
		NoticeModel notice = Service.findNum(contNo).get(0);
		List<NoticeFileModel> noticeFile = Service.fileName(contNo);
		Integer maxPage = Service.max(max);
		model.addAttribute("notice", notice);
		model.addAttribute("prev", prevPage);
		model.addAttribute("next", nextPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("noticeFile", noticeFile);
		return "notice/view"; // JSP 파일명
	}
	
	
	@GetMapping("/notice/write") // URL 주소
	public String write(Model model) {
		return "notice/write"; // JSP 파일명
	}
	
	
	@PostMapping(value = "/notice/write.do", params = {"noticeTitle", "noticeContent"}) // URL 주소
	public String writeOK(MultipartHttpServletRequest mtf, @ModelAttribute("cri")SearchCriteria cri,
			Model model, @RequestParam String noticeTitle, @RequestParam String noticeContent, @RequestParam String refer)throws Exception {
		List<MultipartFile> file = mtf.getFiles("inFileName");
		NoticeModel insertModel = new NoticeModel();
		NoticeFileModel insertFile = new NoticeFileModel();
		int max = Service.countNoticeListTotal(cri);
		Integer maxPage;
		if(max == 0) 
		{
			maxPage = 0 ;
		}
		else
		{
			maxPage = Service.max(max);
		}
		Date createDate = Calendar.getInstance().getTime();
		insertModel.setNoticeTitle(noticeTitle);
		insertModel.setUserID("admin");
		insertModel.setRefer(refer);
		insertModel.setNoticeDate(createDate);
		insertModel.setNoticeContent(noticeContent);
		insertModel.setNoticeHits(1);
		for(MultipartFile mf : file) {	
		if(!mf.getOriginalFilename().equals("")) {
			UUID uuid = UUID.randomUUID();
			String path = NoticeController.class.getResource("").getPath();
			path = URLDecoder.decode(path,"UTF-8");
			path = path.split("/target")[0]+"/src/main/resources/files/notice/";
			String outFileName = uuid.toString() +"_"+mf.getOriginalFilename();
			File infile = new File(path,outFileName);
			mf.transferTo(infile);
			int fileSize = (int) mf.getSize();
			String inFileName = mf.getOriginalFilename();
			insertFile.setNoticeNum(maxPage+1);
			insertFile.setOutFileName(outFileName);
			insertFile.setFileSize(fileSize);
			insertFile.setInFileName(inFileName);
			Service.insertFile(insertFile);
		   }
	   }	
		Service.insert(insertModel);
		
		return "redirect:/notice/list"; // JSP 파일명
	}

	@PostMapping(value = "/notice/update", params = "noticeNum") // URL 주소
	public String update(Model model, @RequestParam int noticeNum) {
		NoticeModel notice = Service.findNum(noticeNum).get(0);
		int contNo = noticeNum;
		List<NoticeFileModel> noticeFile = Service.fileName(contNo);
		model.addAttribute("notice", notice);
		model.addAttribute("noticeNum", noticeNum);
		model.addAttribute("noticeFile", noticeFile);
//		System.out.println("test");
		return "/notice/update"; // JSP 파일명
	}

	@PostMapping(value = "/notice/update.do", params = { "noticeNum", "noticeTitle", "noticeContent", "deleteFile"}) // URL 주소
	public String updateOK(MultipartHttpServletRequest mtf, Model model, @ModelAttribute("cri")SearchCriteria cri,
			@RequestParam String noticeNum, @RequestParam String noticeTitle, @RequestParam String refer,
			@RequestParam String noticeContent, @RequestParam String deleteFile) throws Exception{
		if (!deleteFile.equals("")) {
			JsonParser parser = new JsonParser();
			Gson gson = new Gson();
			JsonArray deleteFiles = (JsonArray) ((JsonObject)parser.parse(deleteFile)).get("list");
			Collection<String> fileList = gson.fromJson(deleteFiles, new TypeToken<Collection<String>>(){}.getType());
			for (String fileName : fileList ) {
				String path = NoticeController.class.getResource("").getPath();
				path = URLDecoder.decode(path,"UTF-8");
				path = path.split("/target")[0]+"/src/main/resources/files/notice/";
				File file = new File(path,fileName);
				if(!file.equals("")) {
					if (file.exists()) {
						if (file.delete()) {
//							System.out.println("파일삭제 성공");
							Service.deleteFileByOutFileName(fileName);
						} else {
//							System.out.println("파일삭제 실패");
						}
					} else {
//						System.out.println("파일이 존재하지 않습니다.");
						Service.deleteFileByOutFileName(fileName);
					}
				}
			}
		}
		//파일 삭제 기능
		NoticeFileModel updateFile = new NoticeFileModel();
		List<MultipartFile> file = mtf.getFiles("inFileName");
		Date createDate = Calendar.getInstance().getTime();
		NoticeModel updatenotice = new NoticeModel();
		updatenotice.setNoticeDate(createDate);
		updatenotice.setRefer(refer);
		updatenotice.setNoticeNum(Integer.parseInt(noticeNum));
		updatenotice.setNoticeTitle(noticeTitle);
		updatenotice.setNoticeContent(noticeContent);
		Service.update(updatenotice);
		for(MultipartFile mf : file) {	
			if(!mf.getOriginalFilename().equals("")) {
				UUID uuid = UUID.randomUUID();
				String path = NoticeController.class.getResource("").getPath();
				path = URLDecoder.decode(path,"UTF-8");
				path = path.split("/target")[0]+"/src/main/resources/files/notice/";
				String outFileName = uuid.toString() +"_"+mf.getOriginalFilename();
				File infile = new File(path,outFileName);
				mf.transferTo(infile);
				int fileSize = (int) mf.getSize();
				String inFileName = mf.getOriginalFilename();
				updateFile.setNoticeNum(Integer.parseInt(noticeNum));
				updateFile.setOutFileName(outFileName);
				updateFile.setFileSize(fileSize);
				updateFile.setInFileName(inFileName);
				Service.insertFile(updateFile);
			   }
		   }
		return "redirect:/notice/list"; // JSP 파일명
	}

	@PostMapping(value = "/notice/delete.do", params = {"noticeNum" })
	public String deleteOK(Model model, @RequestParam String noticeNum ) throws Exception{
		NoticeModel notice = Service.findNum(Integer.parseInt(noticeNum)).get(0);
		List<String> FilesList = Service.getFilesByNo(Integer.parseInt(noticeNum));
		for (String fileName : FilesList) {
			String path = NoticeController.class.getResource("").getPath();
			path = URLDecoder.decode(path,"UTF-8");
			path = path.split("/target")[0]+"/src/main/resources/files/notice/";
			File file = new File(path,fileName);
			if(!file.equals("")) {
				if (file.exists()) {
					if (file.delete()) {
//						System.out.println("파일삭제 성공");
					} else {
//						System.out.println("파일삭제 실패");
					}
				} else {
//					System.out.println("파일이 존재하지 않습니다.");
				}
			}
		}
		Service.delete(Integer.parseInt(noticeNum));
		Service.deleteFile(Integer.parseInt(noticeNum));
		return "redirect:/notice/list";
	}
	
	@GetMapping(value="/notice/list")
	public ModelAndView NoticeList(@ModelAttribute("cri")SearchCriteria cri,Model model){
		ModelAndView mav = new ModelAndView("/notice/list");
		int noticeNumber = Service.countNoticeListTotal(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(Service.countNoticeListTotal(cri));
		
		List<Map<String,Object>> noticeList = Service.searchNoticeList(cri);
		mav.addObject("noticeList",noticeList);
		mav.addObject("pageMaker",pageMaker);
		mav.addObject("noticeNumber",noticeNumber);
		return mav;		
	}
}
