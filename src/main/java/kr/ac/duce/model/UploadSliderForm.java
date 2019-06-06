package kr.ac.duce.model;

import org.springframework.web.multipart.MultipartFile;

public class UploadSliderForm {
    private String sliderjson;
    private MultipartFile[] files;

    public String getSliderjson() {
        return sliderjson;
    }

    public void setSliderjson(String sliderjson) {
        this.sliderjson = sliderjson;
    }

    public MultipartFile[] getFiles() {
        return files;
    }

    public void setFiles(MultipartFile[] files) {
        this.files = files;
    }
}
