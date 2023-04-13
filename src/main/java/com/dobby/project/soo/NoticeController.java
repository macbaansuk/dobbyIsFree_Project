package com.dobby.project.soo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cs/notice")
public class NoticeController {
    @Autowired
    NoticeService noticeService;

    @Autowired
    NoticeDao noticeDao;

    @GetMapping("/read")
    public String noticeRead(Integer page, Integer pageSize,Integer NB_ID, Model m, SearchCondition sc ) throws Exception {
        System.out.println("NoticeController - NB_ID: " + NB_ID);

        try {
            NoticeDto noticeDto = noticeService.read(NB_ID);
            m.addAttribute("noticeDto",noticeDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "/soo/cs-notice-view";
    }
//    @GetMapping("/list")
//    public String noticeList(Model m, SearchCondition sc ,HttpServletRequest request) throws Exception {
//
//        try {
//            int totalCnt = noticeService.getSearchResultCnt(sc);
//            m.addAttribute("totalCnt", totalCnt);
//
//            PageHandler pageHandler = new PageHandler(totalCnt, sc);
//
////            NoticeDao noticeDao = noticeService.getCount(noticeDto);
//
//            List<NoticeDto> list = noticeService.getSearchResultPage(sc);
//            m.addAttribute("noticeList", list);
//            m.addAttribute("ph", pageHandler);
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//
//        return "/soo/cs-notice";
//    }
    @GetMapping("/list")
    public String noticeList(@RequestParam(defaultValue ="1") Integer page,
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
            m.addAttribute("noticeList", list);
            m.addAttribute("ph", pageHandler);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "/soo/cs-notice";
    }
}