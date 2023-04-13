//package com.dobby.project.ming.controller;
//
//import com.dobby.project.ming.domain.User;
//import org.springframework.beans.propertyeditors.CustomDateEditor;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.WebDataBinder;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.InitBinder;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import javax.validation.Valid;
//import java.text.SimpleDateFormat;
//
//@RequestMapping("/register")
//@Controller
//public class RegisterController {
//
//@InitBinder
//    public void toDate(WebDataBinder binder) {
//        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//        binder.registerCustomEditor(Date.class, new CustomDateEditor(df, false));
//        binder.setValidator(new UserValidator()); // UserValidator를 WebDataBinder의 로컬 validator로 등록
//            //	List<Validator> validatorList = binder.getValidators();
//            //	System.out.println("validatorList="+validatorList);
//        }
//
//@GetMapping("/add")
//    public String register() {
//        return "ming/register"; // WEB-INF/views/registerForm.jsp
//        }
//
//@PostMapping("/add")
//    public String save(@Valid User user, BindingResult result, Model m) throws Exception {
//        System.out.println("result="+result);
//        System.out.println("user="+user);
//
//        // User객체를 검증한 결과 에러가 있으면, registerForm을 이용해서 에러를 보여줘야 함.
//         if(result.hasErrors()) {
//             return "ming/register";
//         }
//
//            // 2. DB에 신규회원 정보를 저장
//            return "registerInfo";
//        }
//
//        private boolean isValid(User user) {
//            return true;
//        }
//    }
//
