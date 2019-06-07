package kr.ac.duce.service.impl;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;
import kr.ac.duce.model.UploadIntroForm;
import kr.ac.duce.service.FileIOService;
import kr.ac.duce.service.IntroSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Service
public class IntroSettingServiceImpl implements IntroSettingService {
    @Autowired
    FileIOService fileIOService;

    @Override
    public void updateIntro(UploadIntroForm introForm) throws IOException {
        String path = SliderSettingServiceImpl.class.getResource("").getPath();
        path = URLDecoder.decode(path, "UTF-8");
        String jsonpath = path.split("/target")[0] + "/src/main/resources/json/intro.json";
        String content = introForm.getContent();
        String img = introForm.getImg();
        MultipartFile file = introForm.getFile();
        Gson gson = new Gson();
        JsonReader reader = new JsonReader(new FileReader(jsonpath));
        JsonParser parser = new JsonParser();
        JsonObject jsonObj = (JsonObject) parser.parse(reader);
        if(!file.isEmpty()) {
            String formerImg = jsonObj.get("img").toString();
            formerImg = formerImg.replace("\"", "");
            fileIOService.delete(formerImg, "/images/notice/");
            fileIOService.upload(file, "/images/notice/");
        }
        try ( Writer writer = new FileWriter(jsonpath) ) {
            gson = new GsonBuilder().create();
            Map IntroJson = new HashMap<String, String>();
            IntroJson.put("content", content);
            IntroJson.put("img", img);
            gson.toJson(IntroJson, writer);
        }
    }
}
