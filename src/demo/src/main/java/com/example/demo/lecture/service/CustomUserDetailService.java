package com.example.demo.lecture.service;

import com.example.demo.lecture.config.AppConfig;
import java.util.Collections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailService implements UserDetailsService {

  @Autowired
  AppConfig appConfig;

  @Override
  public UserDetails loadUserByUsername(String username)
    throws UsernameNotFoundException {
      if (username.equals(appConfig.getUsername())) {
        var encoder = new BCryptPasswordEncoder();
        var pass = encoder.encode(appConfig.getPassword());
        return new User(username, pass, Collections.emptyList());
      }
      throw new UsernameNotFoundException("user not found");
  }
}
