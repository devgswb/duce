package kr.ac.duce.model;

public class ProjectBoardViewModel extends ProjectBoardModel {
    private String major;
    private String branch;
    private String year;
    private String viewContent;
    private String viewThumbnail;
    private String viewPartStudents;
    private String viewPartGuides;
    public String getViewThumbnail() {
        return viewThumbnail;
    }

    public String getViewPartGuides() {
        return viewPartGuides;
    }

    public void setViewPartGuides(String viewPartGuides) {
        this.viewPartGuides = viewPartGuides;
    }

    public void setViewThumbnail(String viewThumbnail) {
        this.viewThumbnail = viewThumbnail;
    }
    public String getViewPartStudents() {
        return viewPartStudents;
    }

    public void setViewPartStudents(String viewPartStudents) {
        this.viewPartStudents = viewPartStudents;
    }

    public ProjectBoardViewModel(ProjectBoardModel model) {
        super(model);
    }

    public String getViewContent() {
        return viewContent;
    }

    public void setViewContent(String viewContent) {
        this.viewContent = viewContent;
    }


    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }
}
