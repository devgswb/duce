package kr.ac.duce.service;

import kr.ac.duce.model.SliderSettingModel;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

public interface SliderSettingService {

    boolean modifySlider(ArrayList<SliderSettingModel> sliderList, MultipartFile[] files) throws IOException;
}
