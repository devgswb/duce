package kr.ac.duce.handler;
import org.springframework.ui.Model;

public class ErrorPageHandler { // model과 에러타입, 참조페이지를 받아 에러 페이지로 넘겨주는 핸들러
    public static String throwError(Model model, String errorType, String referPage) {
        model.addAttribute("error", errorType);
        model.addAttribute("referPage", referPage);
        return "/error";
    }
}
