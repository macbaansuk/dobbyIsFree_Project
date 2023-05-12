package com.dobby.project.soo;

import com.dobby.project.hoon.domain.AdminDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.AbstractDocument;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
//@RequestMapping("/admin/counsel")
public class AdminCounselController {
    @Autowired
    CounselService counselService;

    @PostMapping("/admin/counsel/write")
    public String answerWrite(@RequestParam Integer CNSL_ID, @RequestParam String CONTENT
            ,Model m,  RedirectAttributes rttr) throws Exception {

        try {
            AnswerDto answerDto = new AnswerDto(CNSL_ID, CONTENT);
            CounselDto counselDto = new CounselDto();
            counselDto.setCNSL_ID(CNSL_ID);
            counselDto.setSTUS("처리완료");
            counselDto.setANS_YN("Y");
            counselService.writeAnswerAndModifyStatus(answerDto, counselDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


        return "redirect:/admin/counsel/list";
    }



    @GetMapping("/admin/counsel/list")
        public String AdminCounselList (@RequestParam(defaultValue = "1") Integer page,
                @RequestParam(defaultValue = "10") Integer pageSize, Model m,
                HttpSession session, RedirectAttributes rattr) throws Exception {
            AdminDto adminDto = (AdminDto) session.getAttribute("admin");
            // 로그인 체크 유무 코드
            if (session.getAttribute("admin") == null) {
                rattr.addFlashAttribute("msg", "login_ERR");
                return "redirect:/admin/login";
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