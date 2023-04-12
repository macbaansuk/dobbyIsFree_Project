package com.dobby.project.soo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

//    @GetMapping("/list")
//    public String AdminNoticeList(Model m , HttpServletRequest request, SearchCondition sc) throws Exception {
//
//        try {
//            int totalCnt = noticeService.getSearchResultCnt(sc);
//            m.addAttribute("totalCnt", totalCnt);
//
//            PageHandler pageHandler = new PageHandler(totalCnt, sc);
//
//            List<NoticeDto> list = noticeService.getSearchResultPage(sc);
//            m.addAttribute("adminNoticeList", list);
//            m.addAttribute("ph", pageHandler);
//            System.out.println("adminNoticeList="+m);
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//
//        return "/soo/admin-notice-list";
//    }

    @GetMapping("/list")
    public String adminNoticeList(@RequestParam(defaultValue ="1") Integer page,
                             @RequestParam(defaultValue = "10") Integer pageSize,Model m, HttpServletRequest request) throws Exception {

        try {
            int totalCnt = noticeService.getCount();
            m.addAttribute("totalCnt", totalCnt);

            PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);
            if(page < 0 || page > pageHandler.getTotalPage())
                page = 1;
            if(pageSize < 0 || pageSize > 50)
                pageSize = 10;

            Map map = new HashMap();
            map.put("offset", (page-1)*pageSize);
            map.put("pageSize", pageSize);


            List<NoticeDto> list = noticeService.getPage(map);
            m.addAttribute("adminNoticeList", list);
            m.addAttribute("ph", pageHandler);

            System.out.println("adminNoticeList="+m);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "/soo/admin-notice-list";
    }
}
