package com.dobby.project.hoon.controller;

import com.dobby.project.hoon.domain.AdminDto;
import com.dobby.project.hoon.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/statistics")
public class AdminAnalysisController {
    @Autowired
    AdminService adminService;

    @GetMapping("/sales")
    public String AdminSalesStatistics(Model m, HttpServletRequest request , RedirectAttributes rattr, HttpSession session) {
        AdminDto adminDto = (AdminDto) session.getAttribute("admin");
        System.out.println("세션 저장"+adminDto);

        // 로그인 체크 유무 코드
        if (session.getAttribute("admin") == null) {
            rattr.addFlashAttribute("msg", "login_ERR");
            String prevUrl = request.getHeader("Referer");
            System.out.println("get prevUrl = " + prevUrl);
            return "redirect:/admin/login";
        } else { // 본인 페이지 원래 코드
            return "hoon/AdminSalesStatistics";
        }
    }

    @GetMapping("/product")
    public String AdminProductStatistics(Model m, HttpServletRequest request , RedirectAttributes rattr, HttpSession session) {
        AdminDto adminDto = (AdminDto) session.getAttribute("admin");
        System.out.println("세션 저장"+adminDto);

        // 로그인 체크 유무 코드
        if (session.getAttribute("admin") == null) {
            rattr.addFlashAttribute("msg", "login_ERR");
            String prevUrl = request.getHeader("Referer");
            System.out.println("get prevUrl = " + prevUrl);
            return "redirect:/admin/login";
        } else { // 본인 페이지 원래 코드

        return "hoon/AdminProductStatistics";
        }
    }


}
