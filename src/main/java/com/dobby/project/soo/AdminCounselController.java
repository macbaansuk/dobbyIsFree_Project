package com.dobby.project.soo;

import com.dobby.project.hoon.domain.AdminDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/counsel")
public class AdminCounselController {
    @Autowired
    CounselService counselService;



    @PostMapping("/write")
    public String AdminAnswerWrite () throws Exception {

        return "";
    }


    @PostMapping("/list")
    public String AdminCounselAnswer(Model m) throws Exception {

        return "/soo/admin_counsel_list";

    }

    @GetMapping("/list")
    public String AdminCounselList(@RequestParam(defaultValue = "1") Integer page,
                                   @RequestParam(defaultValue = "10") Integer pageSize, Model m,
                                   HttpSession session, RedirectAttributes rattr) throws Exception {
        AdminDto adminDto = (AdminDto) session.getAttribute("admin");
        // 로그인 체크 유무 코드
        if (session.getAttribute("admin") == null) {
            rattr.addFlashAttribute("msg", "login_ERR");
            return "redirect:/admin";
        } else {
            try {
                int totalCnt = counselService.getCountAllCounsel();
                m.addAttribute("totalCnt", totalCnt);

                PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);
                Map<String, Object> map = new HashMap<>();
                map.put("offset", (page - 1) * pageSize);
                map.put("pageSize", pageSize);

                List<CounselAnswerDto> list = counselService.getAllList(map);
                m.addAttribute("list", list);
                m.addAttribute("ph", pageHandler);

                System.out.println("adminCounselList = " + m);
            } catch (Exception e) {
                e.printStackTrace();
            }

            return "/soo/admin_counsel_list";
        }
    }
}
