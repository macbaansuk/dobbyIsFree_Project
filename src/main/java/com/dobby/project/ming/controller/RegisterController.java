package com.dobby.project.ming.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import com.dobby.project.ming.dao.UserDao;
import com.dobby.project.ming.domain.User;
import com.dobby.project.ming.domain.UserValidator;
import org.springframework.validation.Validator;
import org.springframework.beans.propertyeditors.StringArrayPropertyEditor;
import org.springframework.core.convert.ConversionService;
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

    @InitBinder
    public void toDate(WebDataBinder binder) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//        binder.registerCustomEditor(Date.class, new CustomDateEditor(df, false));
        binder.registerCustomEditor(java.sql.Date.class, new CustomDateEditor(df, false));
        binder.setValidator(new UserValidator()); // UserValidator를 WebDataBinder의 로컬 validator로 등록
        //	List<Validator> validatorList = binder.getValidators();
        //	System.out.println("validatorList="+validatorList);
    }

    @Autowired
    UserDao userDao;

    final int FAIL = 0;

    @GetMapping("register")
    public String register() {
        return "ming/registerForm"; // WEB-INF/views/ming/registerForm.jsp
    }

    @PostMapping("register")
    public String save(@Valid User user, BindingResult result, Model m) throws Exception {
        System.out.println("result=" + result);
        System.out.println("user=" + user);

        // User객체를 검증한 결과 에러가 없으면 저장하고 에러가 있으면 registerForm을 이용해 에러를 보여주기
        if (!result.hasErrors()) {
        // 2. DB에 신규회원 정보를 저장
            int rowCnt = userDao.insertUser(user);
            if (rowCnt != FAIL) {
                return "ming/registerForm";
                }
        }
        return "ming/registerInfo";
    }

    private boolean isValid(User user) {
        return true;
    }
}


