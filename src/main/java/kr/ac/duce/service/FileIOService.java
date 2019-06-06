package kr.ac.duce.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

public interface FileIOService {
    boolean upload(MultipartFile file, String underResourcesPath) throws IOException;
    boolean delete(String filepath, String underResourcesPath) throws UnsupportedEncodingException;
}
