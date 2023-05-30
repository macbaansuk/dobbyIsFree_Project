package com.dobby.project.user.controller;

import com.dobby.project.user.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class MyPageController {

    @Autowired
    UserDao userDao;

    @GetMapping("mypage")
    public String mypage(HttpServletRequest request) {
        if(!loginCheck(request)) {
            return "redirect:/login";
        }
        return "mypage";
    }

    private boolean loginCheck(HttpServletRequest request) {

        HttpSession session = request.getSession();
        return session.getAttribute("MBR_ID")!=null;
    }
}