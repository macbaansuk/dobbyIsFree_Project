package com.dobby.project.hoon.controller;

import com.dobby.project.hoon.domain.AdminDto;
import com.dobby.project.hoon.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {
    @Autowired
    AdminService adminService;

    @GetMapping("/login")
    public String adminLoginPage() {
        return "hoon/AdminLogin";
    }

    @PostMapping("/login")
    public String adminLogin(@RequestParam String id, @RequestParam String pwd, HttpSession session, RedirectAttributes rttr) throws Exception {
     //로그인 체크
        AdminDto adminDto = adminService.AdminloginCheck(id,pwd);
        System.out.println("adminDto = " + adminDto);
        if (adminDto == null) { // select 할 정보가 없으니까 null
            rttr.addFlashAttribute("msg", "login_ERR");
            // 정보 불일치면 다시 admin
            return "redirect:/admin";
        } else {
            session.setAttribute("admin", adminDto);
            return "redirect:/admin/inv/list";

        }
    }

    @GetMapping("/main") // 미구현
    public String adminMainPage(HttpSession session) throws Exception {
//        if (session.getAttribute("admin") == null) {
//            return "redirect:/admin/login";
//        } else {
            return "hoon/AdminMain";
//        }
    }

    @GetMapping("/logout")
    public String adminLogout(HttpSession session) throws Exception {
        session.invalidate();
        return "redirect:/admin/login";
    }
}
