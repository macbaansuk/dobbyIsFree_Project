package com.dobby.project.admin.controller;

import com.dobby.project.admin.domain.AdminDto;
import com.dobby.project.admin.service.AdminService;
import com.dobby.project.hwa.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {
    @Autowired
    AdminService adminService;
    @Autowired
    OrderService orderService;

    @GetMapping("")
    public String adminOrder(Model m, HttpServletRequest request , RedirectAttributes rattr, HttpSession session) {
        AdminDto adminDto = (AdminDto) session.getAttribute("admin");
        System.out.println("세션 저장"+adminDto);

        // 로그인 체크 유무 코드
        if (session.getAttribute("admin") == null) {
            rattr.addFlashAttribute("msg", "login_ERR");
            String prevUrl = request.getHeader("Referer");
            System.out.println("get prevUrl = " + prevUrl);
            return "redirect:/admin/login";
        } else { // 본인 페이지 원래 코드
            return "admin/adminOrder";
        }
    }

    @GetMapping("/list")
    public String AdminOrderList(Model model, HttpServletRequest request , RedirectAttributes rattr, HttpSession session) throws Exception {
        AdminDto adminDto = (AdminDto) session.getAttribute("admin");
        System.out.println("세션 저장"+adminDto);

        // 로그인 체크 유무 코드
        if (session.getAttribute("admin") == null) {
            rattr.addFlashAttribute("msg", "login_ERR");
            String prevUrl = request.getHeader("Referer");
            System.out.println("get prevUrl = " + prevUrl);
            return "redirect:/admin/login";
        } else { // 본인 페이지 원래 코드

            return "admin/adminorderDetailList";
        }
    }

}
