package com.dobby.project.controller.hoon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @RequestMapping("/admin")
    public String admin(){
        return "hoon/admin";
    }
}
