package kr.ac.duce.controller;

import java.awt.event.ActionEvent;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
	public String write(Model model,HttpServletRequest request) {
		return "notice/write"; // JSP 파일명
	}
	
	@PostMapping(value = "/notice/write.do", params = {"noticeTitle", "noticeContent"}) // URL 주소
	public String writeOK(MultipartHttpServletRequest mtf,HttpServletRequest request, @ModelAttribute("cri")SearchCriteria cri,
			Model model, @RequestParam String noticeTitle, @RequestParam String noticeContent)throws Exception {
		MultipartFile file = mtf.getFile("inFileName");
		NoticeModel insertModel = new NoticeModel();
		NoticeFileModel insertFile = new NoticeFileModel();
		int max = Service.countNoticeListTotal(cri);
		Integer maxPage = Service.max(max);
		Date createDate = Calendar.getInstance().getTime();
		insertModel.setNoticeTitle(noticeTitle);
		insertModel.setUserID("작성자");
		insertModel.setNoticeDate(createDate);
		insertModel.setNoticeContent(noticeContent);
		insertModel.setNoticeHits(1);
			if(!file.getOriginalFilename().equals("")) {
				UUID uuid = UUID.randomUUID();
				String inFileName = file.getOriginalFilename();
				String inFileNames = FilenameUtils.getExtension(inFileName).toLowerCase();
				File outFile;
				String outFileName;
				String path = "C:\\file\\";
//				String savePath2=application.getRealPath("Fileupload/upload");

				outFileName = uuid.toString() + "_" + inFileNames;
				outFile = new File(path,outFileName);
				outFile.getParentFile().mkdirs();
				file.transferTo(outFile);
				
				insertFile.setNoticeNum(maxPage+1);
				insertFile.setInFileName(inFileName);
				insertFile.setOutFileName(outFileName);
				insertFile.setFileUrl(path);
				
				Service.insertFile(insertFile, request);					
			}			

		Service.insert(insertModel);
		
		return "redirect:/notice/list"; // JSP 파일명
	}
	
	@GetMapping(value = "/notice/download.do/{noticeNum}")
	public void downloadFile(@PathVariable int noticeNum, HttpServletRequest request,HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		List<NoticeFileModel> down = Service.fileName(noticeNum);
		String fileUrl =  ((NoticeFileModel) down).getFileUrl();
		fileUrl += "/";
		String savePath = fileUrl;
        String inFileName = ((NoticeFileModel) down).getInFileName();
        String outFileName = ((NoticeFileModel) down).getOutFileName();
        InputStream in = null;
        OutputStream os = null;
        File file = null;
        String client = "";		       
        file = new File(savePath,outFileName);
        in = new FileInputStream(file);       
        client = request.getHeader("User-Agent");
        response.reset();
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Description", "JSP Generated Data");
        response.setHeader("Content-Disposition",
                "attachment; outFilename=\"" + new String(inFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
        response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
        response.setHeader("Content-Length", "" + file.length());
        os = response.getOutputStream();
        byte b[] = new byte[(int) file.length()];
        int leng = 0;
        while ((leng = in.read(b)) > 0) {
            os.write(b, 0, leng);
        }
        in.close();
        os.close();     
	}
	
	

	@PostMapping(value = "/notice/update", params = "noticeNum") // URL 주소
	public String update(Model model, @RequestParam int noticeNum) {
		NoticeModel notice = Service.findNum(noticeNum).get(0);
		model.addAttribute("notice", notice);
		model.addAttribute("noticeNum", noticeNum);
		System.out.println("test");
		return "notice/update"; // JSP 파일명
	}
	
	@PostMapping(value = "/notice/update.do", params = { "noticeNum", "noticeTitle", "noticeContent"}) // URL 주소
	public String updateOK(MultipartHttpServletRequest mtf, Model model, @ModelAttribute("cri")SearchCriteria cri,
			@RequestParam String noticeNum, @RequestParam String noticeTitle, 
			@RequestParam String noticeContent) throws Exception{
		Date createDate = Calendar.getInstance().getTime();
		System.out.println(noticeNum + noticeTitle + noticeContent);
		NoticeModel updatenotice = new NoticeModel();
		updatenotice.setNoticeDate(createDate);
		updatenotice.setNoticeNum(Integer.parseInt(noticeNum));
		updatenotice.setNoticeTitle(noticeTitle);
		updatenotice.setNoticeContent(noticeContent);
		Service.update(updatenotice);
		
		Service.deleteFile(Integer.parseInt(noticeNum));
		
//		List<MultipartFile> file = mtf.getFiles("inFileName");
//		NoticeFileModel updateFile = new NoticeFileModel();
//		for(MultipartFile mf : file) {	
//			if(!mf.getOriginalFilename().equals("")) {
//				UUID uuid = UUID.randomUUID();
//				String path = NoticeController.class.getResource("").getPath();
//				path = URLDecoder.decode(path,"UTF-8");
//				path = path.split("/target")[0]+"/src/main/webapp/file";
//				String outFileName = uuid.toString() +"_"+mf.getOriginalFilename();
//				File infile = new File(path,outFileName);
//				mf.transferTo(infile);
//				int fileSize = (int) mf.getSize();
//				String inFileName = mf.getOriginalFilename();
//				updateFile.setNoticeNum(Integer.parseInt(noticeNum));
//				updateFile.setOutFileName("/file/"+outFileName);
//				updateFile.setFileSize(fileSize);
//				updateFile.setInFileName(inFileName);
//				Service.insertFile(updateFile);
//			}
//		}			
		return "redirect:/notice/list"; // JSP 파일명
	}
	
	@PostMapping(value = "/notice/delete.do", params = {"noticeNum"})
	public String deleteOK(Model model, @RequestParam String noticeNum) {
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
