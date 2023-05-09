package com.dobby.project.hoon.controller;

import com.dobby.project.hoon.domain.AdminDto;
import com.dobby.project.hoon.domain.InvDto;
import com.dobby.project.hoon.domain.PageHandler;
import com.dobby.project.hoon.domain.invSearchCondition;
import com.dobby.project.hoon.service.InvService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/admin/inv")
public class AdminInvController {
    @Autowired
    InvService invService;



    @GetMapping("/modify/{prodId}") // 체크박스에 체크된 prodID의  바꾸는 메서드
    @ResponseBody
    public InvDto getInv(@PathVariable Integer prodId) throws Exception {
        System.out.println("작동완료");
        InvDto invDto = invService.getInv(prodId);
        System.out.println("prodId = " + prodId);
        System.out.println("invDto = " + invDto);
        return invDto;
    }


    @PostMapping("/modify")
    @ResponseBody
    public String modify(@RequestBody List<InvDto> invDtoList, RedirectAttributes rattr, Model m) throws Exception {
        try {

            for (InvDto invDto : invDtoList) {
                Integer prodId = invDto.getPROD_ID();
                System.out.println(invDtoList);
//                invDto.setUPD_DTM(new Date());
                if (invService.InvModify(invDto) != 1) {
                    throw new Exception("Modify failed for prodId: " + prodId);
                }
            }

            rattr.addFlashAttribute("msg", "MOD_OK");

            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "MOD_ERR");
            return "error";
        }
    }
//    @GetMapping("/list")
    @PatchMapping("/list")

    public ResponseEntity<Map<String, Object>> test(@RequestBody invSearchCondition sc, Model m, HttpServletRequest request, RedirectAttributes rattr) {

        System.out.println("sc PatchMapping = " + sc);

        try {
            int totalCnt = invService.getInvSearchResultCnt(sc);
            PageHandler pageHandler = new PageHandler(totalCnt, sc);
            List<InvDto> list = invService.getInvSearchResultPage(sc);
            System.out.println("list = " + list);
            System.out.println("pageHandler = " + pageHandler);
            Map<String, Object> response = new HashMap<>();
            response.put("list", list);
            response.put("ph", pageHandler);
            return ResponseEntity.ok(response);

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/list")  // 모든 게시물을 페이지로 나눠서 보여주는 메서드  // /admin/list?page=1&pageSize=10&option=&keyword=

    public String list(invSearchCondition sc, Model m, HttpServletRequest request , RedirectAttributes rattr, HttpSession session) {
        AdminDto adminDto = (AdminDto) session.getAttribute("admin");
        System.out.println("세션 저장"+adminDto);
        System.out.println("sc GetMapping = " + sc);

        // 로그인 체크 유무 코드
        if (session.getAttribute("admin") == null) {
            rattr.addFlashAttribute("msg", "login_ERR");
            String prevUrl = request.getHeader("Referer");
            System.out.println("get prevUrl = " + prevUrl);
            return "redirect:/admin/login";
        } else { // 본인 페이지 원래 코드
//
            try {
                int toatlCnt = invService.getInvSearchResultCnt(sc); // 테이블의 전체 레코드 수를 반환 한다. 전체 게시물의 개수
                PageHandler pageHandler = new PageHandler(toatlCnt, sc);
                List<InvDto> list = invService.getInvSearchResultPage(sc);
                m.addAttribute("list", list);
                m.addAttribute("ph",pageHandler);
                rattr.addAttribute("pageSize", sc.getPageSize());
                rattr.addFlashAttribute("msg", "LIST_OK");

                return "hoon/inv";

            } catch (Exception e) {
                e.printStackTrace();
                m.addAttribute("pageSize", sc.getPageSize());
                m.addAttribute("msg", "LIST_ERR");
                return "hoon/inv";
            }
        }
//        return "hoon/inv"; // 로그인을 한 상태이면, 게시판 화면으로 이동
    }
}
