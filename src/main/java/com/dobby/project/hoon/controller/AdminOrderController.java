package com.dobby.project.hoon.controller;

import com.dobby.project.hoon.domain.AdminDto;
import com.dobby.project.hoon.service.AdminService;
import com.dobby.project.hwa.order.OrdDto;
import com.dobby.project.hwa.order.OrderService;
import com.dobby.project.hwa.orderList.OrdProdInfoDto;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {
    @Autowired
    AdminService adminService;
    @Autowired
    OrderService orderService;

    @GetMapping("")
    public String AdminOrder(Model m, HttpServletRequest request , RedirectAttributes rattr, HttpSession session) {
        AdminDto adminDto = (AdminDto) session.getAttribute("admin");
        System.out.println("세션 저장"+adminDto);

        // 로그인 체크 유무 코드
        if (session.getAttribute("admin") == null) {
            rattr.addFlashAttribute("msg", "login_ERR");
            String prevUrl = request.getHeader("Referer");
            System.out.println("get prevUrl = " + prevUrl);
            return "redirect:/admin/login";
        } else { // 본인 페이지 원래 코드
            return "hoon/AdminOrder";
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

            List<OrdProdInfoDto> opiDto = new ArrayList<>();
            OrdProdInfoDto opi = new OrdProdInfoDto();
            opi.setREP_IMG("/img/sun/product-image/skincare/derma_cream/derma_cream_main.jpg");
            opi.setPROD_NM("더마 그린티 프로바이오틱스 크림");
            opi.setPROD_INDV_QTY(1);
            opi.setPROD_AMT(25000);
            opi.setORD_STUS_CD("상품준비중");
            opi.setDC_YN("Y");
            opiDto.add(opi);

            List<OrdDto> ordDto = new ArrayList<>();
            OrdDto ord = new OrdDto();
            ord.setORD_ID("20230511163371");
            ord.setMBR_ID("test1");
            ord.setCOU_ID(null);
            ord.setORD_DTM("2023-05-11 14:04:35");
            ord.setREP_PROD_NM(null);
            ord.setPROD_CNT(null);
            ord.setSETL_AMT(22500);
            ord.setDEXP(0);
            ord.setDEXP_YN(null);
            ord.setPROD_OPT(null);
            ord.setPROD_DC(null);
            ord.setUSE_COUPN_NO(null);
            ord.setORD_TAMT(22500);
            ord.setREVW_YN(null);
            ord.setORD_STUS_CD("상품준비중");
            ord.setORD_CNCL_YN(null);
            ord.setORD_PROCR(null);
            ord.setORD_RMK(null);
            ord.setRCPR_NM("김도비");
            ord.setRCPR_ZPCD("13561");
            ord.setRCPR_BASIC_ADDR("경기도 성남시 분당구 정자일로 95");
            ord.setRCPR_DTL_ADDR("1층");
            ord.setDLVPN_REQ("");
            ord.setRCPR_MPNO("01012344321");
            ord.setBANK("은행을 선택해 주세요.");
            ord.setACC_NO("");
            ord.setDPOSR("");
            ord.setORDR_EMAIL("aaa@aaa.com");
            ord.setORDR("테스트1");
            ord.setORDR_NO("01012341234");
            ord.setPOINT_AMT(225);
            ord.setDC_AMT(0);
            ordDto.add(ord);

            // 값을 문자열로 변환하여 보내줌
            model.addAttribute("opiDto", new Gson().toJson(opiDto));
            model.addAttribute("ordDto", new Gson().toJson(ordDto));

            return "hoon/AdminorderDetailList";
        }
    }

}
