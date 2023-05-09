package com.dobby.project.soo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/counsel")
public class AdminCounselController {
    @Autowired
    CounselService counselService;

    @PostMapping("/list")
    public String AdminCounselAnswer(Model m) throws Exception {


        return "/soo/admin_counsel_list";

    }
    @GetMapping("/list")
    public String AdminCounselList(@RequestParam(defaultValue ="1") Integer page,
                                   @RequestParam(defaultValue = "10")Integer pageSize, Model m) throws Exception {

        try {
            int totalCnt = counselService.getCountAllCounsel();
            m.addAttribute("totalCnt", totalCnt);

            PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);
            Map<String, Object> map = new HashMap<>();
            map.put("offset", (page-1)*pageSize);
            map.put("pageSize", pageSize);

            List<CounselAnswerDto> list = counselService.getAllList(map);
            m.addAttribute("list", list);
            m.addAttribute("ph",pageHandler);

            System.out.println("adminCounselList = " +m );
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "/soo/admin_counsel_list";
    }
}
