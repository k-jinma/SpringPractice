package com.example.demo.lecture.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

  @GetMapping("/login")
  public String showLogin() {
    return "pages/login";
  }
  
}
