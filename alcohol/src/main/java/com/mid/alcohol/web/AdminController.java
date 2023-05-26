package com.mid.alcohol.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {

    @GetMapping("/")
    public String adminPage() {
        log.info("adminPage()");
        
        return "AdministratorPage";
    }
    
}
