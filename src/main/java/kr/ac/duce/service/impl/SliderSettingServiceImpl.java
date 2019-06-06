package kr.ac.duce.service.impl;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.stream.JsonReader;
import kr.ac.duce.model.SliderSettingModel;
import kr.ac.duce.module.JSArrayParser;
import kr.ac.duce.service.FileIOService;
import kr.ac.duce.service.SliderSettingService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
public class SliderSettingServiceImpl implements SliderSettingService {
    @Autowired
    FileIOService fileIOService;

    @Override
    public boolean modifySlider(ArrayList<SliderSettingModel> sliderList, MultipartFile[] files) throws IOException {
        try {
            String path = SliderSettingServiceImpl.class.getResource("").getPath();
            path = URLDecoder.decode(path, "UTF-8");
            String jsonpath = path.split("/target")[0] + "/src/main/resources/json/slide.json";
            JSArrayParser<SliderSettingModel> parser = new JSArrayParser<SliderSettingModel>();
            ArrayList<SliderSettingModel> formerSliderList = parser.fileparse(jsonpath, SliderSettingModel.class, "slides");
            ArrayList<String> formerFileList = new ArrayList<String>();
            ArrayList<String> currentFileList = new ArrayList<String>();
            for (SliderSettingModel formerSlider : formerSliderList) {
                formerFileList.add(formerSlider.getImgUrl());
            }
            for (SliderSettingModel slider : sliderList) {
                currentFileList.add(slider.getImgUrl());
            }
            for (int i = 0; i < formerFileList.size(); i++) {
                if (formerFileList.get(i).equals(currentFileList.get(i))) {
                    continue;
                }
                fileIOService.delete(formerFileList.get(i), "/images/slide/");
            }
            for (MultipartFile file : files) {
                fileIOService.upload(file, "/images/slide/");
            }
            try ( Writer writer = new FileWriter(jsonpath) ) {
                Gson gson = new GsonBuilder().create();
                Map SliderMap = new HashMap<String, ArrayList<SliderSettingModel>>();
                SliderMap.put("slides", sliderList);
                gson.toJson(SliderMap, writer);
            }
            return true;
        } catch (Exception ex) {
            throw ex;
        }
    }
}
