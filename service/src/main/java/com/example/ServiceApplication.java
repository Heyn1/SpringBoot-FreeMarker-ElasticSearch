package com.example;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jackson.JacksonAutoConfiguration;

@MapperScan(basePackages = "com.example.dao")
@SpringBootApplication(
        exclude = {
            JacksonAutoConfiguration.class,
        }
)
public class ServiceApplication {

    public static void main(String[] args) {

        SpringApplication.run(ServiceApplication.class, args);
        System.out.println("http://localhost:8085/main");
    }

}
