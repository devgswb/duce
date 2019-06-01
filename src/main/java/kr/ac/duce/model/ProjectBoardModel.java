package kr.ac.duce.model;
import java.util.Date;

public class ProjectBoardModel {
	private int pNo;
	private String title;
	private String content;
	private String part; // 참여학생
	private String guide; // 담당교수
	private String period;
	private String branchNo;
	private String majorNo;
	private String id;
	private Date startDate;
	private Date finishDate;
	private Date pDate;
	private int hit;
	private String video;
	private String photo;
	private String addFile;
	private String reference;
	
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getGuide() {
		return guide;
	}
	public void setGuide(String guide) {
		this.guide = guide;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getBranchNo() {
		return branchNo;
	}
	public void setBranchNo(String branchNo) {
		this.branchNo = branchNo;
	}
	public String getMajorNo() {
		return majorNo;
	}
	public void setMajorNo(String majorNo) {
		this.majorNo = majorNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getAddFile() {
		return addFile;
	}
	public void setAddFile(String addFile) {
		this.addFile = addFile;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}

	public ProjectBoardModel() {
		
	}

	public ProjectBoardModel(ProjectBoardModel model) {
		this.pNo = model.pNo;
		this.title = model.title;
		this.content = model.content;
		this.part = model.part;
		this.guide = model.guide;
		this.period = model.period;
		this.branchNo = model.branchNo;
		this.majorNo = model.majorNo;
		this.id = model.id;
		this.startDate = model.startDate;
		this.finishDate = model.finishDate;
		this.pDate = model.pDate;
		this.hit = model.hit;
		this.video = model.video;
		this.photo = model.photo;
		this.addFile = model.addFile;
		this.reference = model.reference;
	}
}
