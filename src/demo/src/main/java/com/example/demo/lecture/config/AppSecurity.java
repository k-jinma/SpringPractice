package com.example.demo.lecture.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class AppSecurity {

  @Bean
  public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }

  @Bean
  public SecurityFilterChain filterChain(HttpSecurity httpSecurity)
    throws Exception {
    httpSecurity
      .authorizeHttpRequests(authz ->
        authz
          .requestMatchers("css/**", "js/**", "webjars/**")
          .permitAll()
          .requestMatchers("/login")
          .permitAll()
          .anyRequest()
          .authenticated()
      )
      .formLogin(form ->
        form.loginPage("/login").defaultSuccessUrl("/", true)
      )
      .logout(logout -> logout.logoutSuccessUrl("/login?logout"));
    return httpSecurity.build();
  }
}
