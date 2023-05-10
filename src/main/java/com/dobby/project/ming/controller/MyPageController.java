package com.dobby.project.ming.controller;

import com.dobby.project.ming.dao.UserDao;
import com.dobby.project.ming.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

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

