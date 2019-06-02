package kr.ac.duce.config;

import kr.ac.duce.handler.LoginSuccesHandler;
import kr.ac.duce.handler.LogoutSuccesHandler;
import kr.ac.duce.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
//
    @Bean
    public AuthenticationSuccessHandler loginSuccessHandler() {
        return new LoginSuccesHandler("/");
    }
    @Bean
    public LogoutSuccessHandler logoutSuccessHandler() {
        return new LogoutSuccesHandler("/");
    }
//    핸들러
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        return bCryptPasswordEncoder;
    }

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    LoginService LoginService;
/*
    admin: 관리자 권한
    user: 프로젝트글 작성을 허용받은 유저 권한
    none_auth: 글 쓰는 권한 미획득 유저(관리자 페이지에서 권한 설정을 해줌)
    anonymous: 비로그인 상태의 권한
 */
    @Override
    protected void configure(HttpSecurity http) throws Exception{
        http
            .authorizeRequests()
                .antMatchers("/notice/write", "/notice/update").access("hasAuthority('admin')")
                .antMatchers("/notice/*.do").access("hasAuthority('admin')")
                // 공지사항 게시판 권한: 관리자만
                .antMatchers("/faq/write", "/faq/update").access("hasAuthority('admin')")
                .antMatchers("/faq/*.do").access("hasAuthority('admin')")
                // FAQ 게시판 권한: 관리자만
                .antMatchers("/project/write", "/project/update").access("hasAnyAuthority('admin', 'user')")
                .antMatchers("/project/*.do").access("hasAnyAuthority('admin', 'user')")
                // 프로젝트 게시판 권한: 관리자와 유저만
            .anyRequest().permitAll()
                // 나머지 페이지 접근 권한은 자유
            .and()
        .formLogin()
            .loginPage("/login")
            .usernameParameter("id")
            .passwordParameter("password")
            .successHandler(loginSuccessHandler())
            .permitAll()
            .and() /* 3 */
        .logout()
            .logoutUrl("/logout")
            .logoutSuccessHandler(logoutSuccessHandler())
            .invalidateHttpSession(true)
            .permitAll()
            .and()
        .csrf().disable()

        ;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(LoginService).passwordEncoder(passwordEncoder);
    }
}
