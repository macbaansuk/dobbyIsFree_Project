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
public class LoginController {

    @Autowired
    UserDao userDao;

    @GetMapping("login")
    public String loginForm() {
        return "ming/loginForm";
    }

    @GetMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @PostMapping("login")
    public String login(String MBR_ID, String PWD, String toURL, boolean saveid,
                        HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //id pwd 확인
        if (!loginCheck(MBR_ID, PWD)) {
            String msg = URLEncoder.encode("⚠️아이디 또는 비밀번호가 일치하지 않습니다.", "utf-8");
            return "redirect:/login?msg=" + msg;
        }

        HttpSession session = req.getSession();
        session.setAttribute("MBR_ID", MBR_ID);
        session.setMaxInactiveInterval(1800);
        if (saveid) {
            Cookie c = new Cookie("MBR_ID", MBR_ID);
            resp.addCookie(c);
        } else {
            Cookie c = new Cookie("MBR_ID", MBR_ID);
            c.setMaxAge(0);
            resp.addCookie(c);
        }
        toURL = toURL == null || toURL.equals("") ? "/" : toURL;
        return "redirect:" + toURL;
    }


    private boolean loginCheck(String MBR_ID, String PWD) throws Exception {
        UserDto userDto = userDao.selectUser(MBR_ID);
        if (userDto == null) return false;
        return userDto.getPWD().equals(PWD);
    }

    @RequestMapping("/findID")
    public String findID() {
        return "ming/findID";
    }

    @RequestMapping("/findPWD")
    public String findPWD() {
        return "ming/findPWD";
    }

    @RequestMapping("/findIDResult")
    public String findIDResult() {
        return "ming/findIDResult";
    }
}

