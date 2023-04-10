package com.dobby.project.hoon.controller;

import com.dobby.project.hoon.domain.InvDto;
import com.dobby.project.hoon.domain.PageHandler;
import com.dobby.project.hoon.service.InvService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    InvService invService;

    @PostMapping("/modify")
    public String modify(InvDto invDto, Integer page, Integer pageSize, RedirectAttributes rattr, Model m, HttpSession session) {

        String writer = (String)session.getAttribute("id");


        try {
            if (invService.modify(invDto)!= 1)
                throw new Exception("Modify failed.");

            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);
            rattr.addFlashAttribute("msg", "MOD_OK");

            return "redirect:/admin/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(invDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
            m.addAttribute("msg", "MOD_ERR");
            return "Inv"; // 등록하려던 내용을 보여줘야 함.
        }
    }
    
    @GetMapping("/list")  // 2차 개발시에 세분화 해서 사용할 예정
    public String list(Integer page, Integer pageSize, Model m, HttpServletRequest request) {



        if(page==null) page=1;
        if(pageSize==null) pageSize=10;

        try {
            int toatlCnt = invService.getCount();
            PageHandler pageHandler = new PageHandler(toatlCnt, page, pageSize);

            Map map = new HashMap();
            map.put("offset", (page-1)*pageSize);
            map.put("pageSize",pageSize);

            List<InvDto> list = invService.getPage(map);
            m.addAttribute("list", list);
            m.addAttribute("ph",pageHandler);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "hoon/admin"; // 로그인을 한 상태이면, 게시판 화면으로 이동
    }
}
