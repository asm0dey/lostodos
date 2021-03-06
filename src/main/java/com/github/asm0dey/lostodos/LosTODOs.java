package com.github.asm0dey.lostodos;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
@ComponentScan
public class LosTODOs {

    public static void main(String[] args) {
        SpringApplication.run(LosTODOs.class, args);
    }

}

@Configuration
@EnableJpaRepositories
@EnableJpaAuditing(auditorAwareRef = "springSecurityAuditorAware")
class DatabaseConf{}
