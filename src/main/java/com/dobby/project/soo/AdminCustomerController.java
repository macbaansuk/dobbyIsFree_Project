package com.dobby.project.soo;

import org.springframework.web.bind.annotation.RequestMapping;

public class AdminCustomerController {
    @RequestMapping("/admin-notice")
    public String adminNotice(){
        return "admin-notice";
    }

}
