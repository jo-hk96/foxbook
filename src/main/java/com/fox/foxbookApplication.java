package com.fox;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@MapperScan("com.fox.paging.mapper")
@MapperScan("com.fox.booklist.mapper")
@SpringBootApplication
public class foxbookApplication {

	
	public static void main(String[] args) {
		SpringApplication.run(foxbookApplication.class, args);
	}

}
