package kr.ac.duce.service.impl;

import kr.ac.duce.service.FileIOService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

@Service
public class FileIOServiceImpl implements FileIOService {
    public boolean upload(MultipartFile file, String underResourcesPath) throws IOException {
        String path = FileIOServiceImpl.class.getResource("").getPath();
        path = URLDecoder.decode(path, "UTF-8");
        String imgpath = path.split("/target")[0] + "/src/main/resources" + underResourcesPath;
        if(!file.getOriginalFilename().equals("")) {
            String fileName = file.getOriginalFilename();
            File inputfile = new File(imgpath, fileName);
            file.transferTo(inputfile);
            return true;
        } else  {
            return false;
        }
    }

    public boolean delete(String filepath, String underResourcesPath) throws UnsupportedEncodingException {
        String path = FileIOServiceImpl.class.getResource("").getPath();
        path = URLDecoder.decode(path, "UTF-8");
        String imgpath = path.split("/target")[0] + "/src/main/resources" + underResourcesPath;
        String fileName = FilenameUtils.getName(filepath);
        File Deletefile = new File(imgpath, fileName);
        if ( Deletefile.exists() ) {
            if (Deletefile.delete()) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
}
