package kr.ac.duce.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;

import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import kr.ac.duce.service.impl.CustomAuthenticationFailure;
import kr.ac.duce.service.impl.CustomAuthenticationProvider;
import kr.ac.duce.service.impl.CustomAuthenticationSuccess;
import kr.ac.duce.service.impl.CustomUserDetailsService;



@Configuration
@EnableWebSecurity
//@EnableGlobalMethodSecurity(securedEnabled=true,prePostEnabled=true)
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean 
	AuthenticationSuccessHandler successHandler() {
		return new CustomAuthenticationSuccess("/");
	}
	
	@Autowired
	CustomUserDetailsService customUserDetailsService;
	
	@Autowired
	private CustomAuthenticationProvider caProvider;

	@Override
	protected void configure(HttpSecurity http) throws Exception{
		http.csrf().disable()
			.authorizeRequests()
			//공지사항 작성은 admin 권한이 있어야 접근 가능
			//여기서 페이지 권한설정을 하지 않고 jsp 파일 내부에서 sec:authorize 구문으로 제한을 걸어주면 
			//write 사이트는 들어가 지지만 sec:authorize를 걸어준 해당 폼은 보이지 않는 형식
			//accessdeniedhandler를 사용하지 않으려면 이를 사용하는게 편할지f도
			.antMatchers("/notice/write").hasAuthority("ROLE_admin")
			.antMatchers("/notice/*.do").hasAuthority("ROLE_admin")
			.antMatchers("/project/write", "/project/write.do").hasAnyAuthority("ROLE_user", "ROLE_admin")
			.anyRequest().permitAll() //권한을 설정한 페이지 이외에는 전부 허가
			.and()
		.formLogin()
			.loginPage("/member/login") //로그인 페이지
			.loginProcessingUrl("/login.do") //로그인 실행 url
			.successHandler(successHandler())
			.failureHandler(new CustomAuthenticationFailure())
			.usernameParameter("id") //파라미터 넘김
			.passwordParameter("password")
			.permitAll()
			.and()
		.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/")
			.invalidateHttpSession(true)
			.permitAll()
		.and()
			.authenticationProvider(caProvider); //인증 관리자 
	}
	
	//UserDetailsService를 이용한 로그인 처리
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customUserDetailsService).passwordEncoder(bCryptPasswordEncoder());
		
	}

	
}