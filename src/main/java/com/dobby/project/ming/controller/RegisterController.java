package com.dobby.project.ming.controller;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import com.dobby.project.ming.dao.UserDao;
import com.dobby.project.ming.domain.User;
import com.dobby.project.ming.domain.UserDto;
//import com.dobby.project.ming.domain.UserValidator;
import com.dobby.project.ming.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
@Controller // ctrl+shift+o 자동 import
@RequestMapping("/")
public class RegisterController {

   /* @InitBinder
    public void toDate(WebDataBinder binder) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(java.sql.Date.class, new CustomDateEditor(df, false));
        binder.setValidator(new UserValidator());
    }*/

    @Autowired
    UserDao userDao;

    final int FAIL = 0;

    @GetMapping("register")
    public String register() { return "ming/registerForm"; }

    @PostMapping("register")
    public String save(User user, UserDto userDto, BindingResult result, Model m) throws Exception {
        System.out.println("result=" + result);
        System.out.println("user=" + user);

        if (!result.hasErrors()) {
            int rowCnt = userDao.insertUser(userDto);
            if (rowCnt != FAIL) {
                return "ming/registerSuccess";
            }
        }
        return "ming/registerForm";
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