package kr.ac.duce.model;

public class SliderSettingModel {
    String content;
    String btnContent;
    String btnUrl;
    String imgUrl;
    boolean isUse;
    boolean isBtnUse;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getBtnContent() {
        return btnContent;
    }

    public void setBtnContent(String btnContent) {
        this.btnContent = btnContent;
    }

    public String getBtnUrl() {
        return btnUrl;
    }

    public void setBtnUrl(String btnUrl) {
        this.btnUrl = btnUrl;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public boolean isUse() {
        return isUse;
    }

    public void setUse(boolean use) {
        isUse = use;
    }

    public boolean isBtnUse() {
        return isBtnUse;
    }

    public void setBtnUse(boolean btnUse) {
        isBtnUse = btnUse;
    }

}
