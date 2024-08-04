package com.example.demo.lecture;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import com.example.demo.lecture.config.AppConfig;

@SpringBootApplication
@EnableJpaAuditing
@EnableConfigurationProperties(AppConfig.class)
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}
	

}
