package kr.ac.duce.model;

import org.springframework.web.multipart.MultipartFile;

public class UploadIntroForm {
    private String content;
    private String img;
    private MultipartFile file;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
