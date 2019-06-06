package kr.ac.duce.module;

import kr.ac.duce.model.BranchCodeModel;
import kr.ac.duce.model.MajorCodeModel;
import kr.ac.duce.model.ProjectBoardModel;
import kr.ac.duce.model.ProjectBoardViewModel;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BoardViewMaker {
    public static List<ProjectBoardViewModel> makeList(List<ProjectBoardModel> rawBoardList,
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
                try {
                    String thumbnail = appendEle.getPhoto().split(",")[0];
                    thumbnail = thumbnail.replace("project/", "project/thumb/");
                    appendEle.setViewThumbnail(thumbnail);
                } catch (Exception e) {
                    appendEle.setViewThumbnail(null);
                }
                // 썸네일 정보 생성
                boardList.add(appendEle);
            } catch (NullPointerException e) {
            }
        }
        return boardList;
    }
}
