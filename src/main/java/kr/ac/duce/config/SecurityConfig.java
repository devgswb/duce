package kr.ac.duce.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import kr.ac.duce.service.impl.CustomAuthenticationFailure;
import kr.ac.duce.service.impl.CustomAuthenticationProvider;
import kr.ac.duce.service.impl.CustomAuthenticationSuccess;
import kr.ac.duce.service.impl.CustomUserDetailsService;



@Configuration
//@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled=true,prePostEnabled=true)
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
	public void configure(WebSecurity web) throws Exception{
		web.ignoring().antMatchers("/resources/**");
		
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception{
		http.csrf().disable()
			.authorizeRequests()
			.antMatchers("/**", "/notice/list", "/member/**").permitAll()
			.antMatchers("/notice/**").hasAuthority("ROLE_admin")
			.antMatchers("/notice/*.do").hasAuthority("ROLE_admin")
			.anyRequest().authenticated()
			.and()
		.formLogin()
			.loginPage("/member/login")
			.loginProcessingUrl("/login.do")
			.successHandler(successHandler())
			.failureHandler(new CustomAuthenticationFailure())
			.usernameParameter("id")
			.passwordParameter("password")
			.permitAll()
			.and()
		.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/")
			.invalidateHttpSession(true)
			.permitAll()
		.and()
			.authenticationProvider(caProvider);
	}
	
	//UserDetailsService를 이용한 로그인 처리
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customUserDetailsService).passwordEncoder(bCryptPasswordEncoder());
		
	}

	
}