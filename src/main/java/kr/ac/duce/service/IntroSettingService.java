package kr.ac.duce.service;

import kr.ac.duce.model.UploadIntroForm;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

public interface IntroSettingService
{
    void updateIntro(UploadIntroForm introForm) throws IOException;
}
