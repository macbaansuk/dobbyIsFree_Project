package com.dobby.project.counsel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

    @RequestMapping("/mypage")
    public String mypage(){
        return "/mypage";
    }
}
