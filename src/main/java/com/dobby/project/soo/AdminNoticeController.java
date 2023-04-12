package com.dobby.project.soo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/notice")
public class AdminNoticeController {

    @Autowired
    NoticeService noticeService;

    @GetMapping("/write")
    public String adminNoticeWriteForm(Model m) {
        NoticeDto noticeDto = new NoticeDto();
        m.addAttribute("noticeDto", new NoticeDto());
        return "soo/admin-notice-write";

    }


    @PostMapping("/write")
    public String adminNoticeWrite(Model m, NoticeDto noticeDto) throws Exception {

        noticeService.write(noticeDto);
//        m.addAttribute(noticeDto);

            return "redirect:/cs/notice/list";
    }


}
