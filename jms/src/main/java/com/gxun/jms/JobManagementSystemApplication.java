package com.gxun.jms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableAutoConfiguration
public class JobManagementSystemApplication {

	public static void main(String[] args) {
		SpringApplication.run(JobManagementSystemApplication.class, args);
	}

}
