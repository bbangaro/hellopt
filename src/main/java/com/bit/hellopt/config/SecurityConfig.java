package com.bit.hellopt.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.bit.hellopt.service.user.CustomUserDetailService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	CustomUserDetailService customUserDetailService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
			.userDetailsService(customUserDetailService).passwordEncoder(passwordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
				.antMatchers("/", "/main").permitAll()
				.antMatchers("/user/**").permitAll()
				.antMatchers("/admin/**").hasRole("ADMIN")
				.antMatchers("/resources/**").permitAll()
				.antMatchers("/file/**").permitAll()
				.antMatchers("/meetingWrite").authenticated() //로그인이 되어있어야..
				.antMatchers("/classlist").authenticated()
				.antMatchers("/meal").authenticated() //로그인시에만 사용 가능
				.antMatchers("/auth/**").authenticated()
				
		    //.anyRequest().authenticated()
			.and()
				.formLogin()
				.loginPage("/login")
				.defaultSuccessUrl("/main")
				.failureUrl("/login?error=true")
				.permitAll()
			.and()
				.logout()
				.logoutSuccessUrl("/main")
				.deleteCookies("JSESSIONID")
				//.invalidateHttpSession(true)
				.permitAll()
			.and()
				.rememberMe().key("uniqueAndSecret").rememberMeParameter("remember-me")
			.and()
				.csrf().disable();
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
