package kr.ac.duce.config;

import org.apache.commons.lang3.SystemUtils;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class AdditionalResourceWebConfiguration implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(final ResourceHandlerRegistry registry) {
        String ProjectPath = "";
        if (SystemUtils.IS_OS_WINDOWS) {
            ProjectPath += "file:///";
        } else {
            ProjectPath += "file:";
        }
        ProjectPath += System.getProperty("user.dir").replaceAll("\\\\", "/");
        ProjectPath += "/src/main/resources";
        System.out.println(ProjectPath);
        registry.addResourceHandler("/img/**").addResourceLocations(ProjectPath + "/images/");
        registry.addResourceHandler("/file/**").addResourceLocations(ProjectPath + "/files/");
    }
/*
    리눅스일 경우와 윈도우즈일 경우의 ProjectPath를 분리해서 연결
*/
}
