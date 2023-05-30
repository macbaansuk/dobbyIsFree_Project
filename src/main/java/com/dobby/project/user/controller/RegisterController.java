package com.dobby.project.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dobby.project.user.dao.UserDao;
import com.dobby.project.user.domain.User;
import com.dobby.project.user.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
@Controller
@RequestMapping("/")
public class RegisterController {

    @Autowired
    UserDao userDao;

    final int FAIL = 0;

    @GetMapping("register")
    public String register() { return "user/registerForm"; }

    @PostMapping("register")
    public String save(User user, UserDto userDto, BindingResult result, Model m) throws Exception {

        if (!result.hasErrors()) {
            int rowCnt = userDao.insertUser(userDto);
            if (rowCnt != FAIL) {
                return "user/registerSuccess";
            }
        }
        return "user/registerForm";
    }

    @PostMapping("register/dbCheck")
    public String dbCheck(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {

        String dbcheck=userDao.memberDbcheck(id);
        String idDouble="NO";

        if (dbcheck!=null) {
            idDouble="YES";
        }
        response.getWriter().print(idDouble);
        return null;
    }

    private boolean isValid(User user) {
        return true;
    }
}