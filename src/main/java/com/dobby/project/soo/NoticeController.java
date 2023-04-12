package com.dobby.project.soo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/cs/notice")
public class NoticeController {
    @Autowired
    NoticeService noticeService;

    @Autowired
    NoticeDao noticeDao;

    @GetMapping("/read")
    public String noticeRead(Integer NB_ID, Model m, SearchCondition sc ) throws Exception {
        System.out.println("NB_ID: " + NB_ID);

        try {
            NoticeDto noticeDto = noticeService.read(NB_ID);
            m.addAttribute("noticeDto",noticeDto);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "/soo/cs-notice-view";
    }
    @GetMapping("/list")
    public String noticeList(Model m, SearchCondition sc ,HttpServletRequest request) throws Exception {

        try {
            int totalCnt = noticeService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt", totalCnt);

            PageHandler pageHandler = new PageHandler(totalCnt, sc);

//            NoticeDao noticeDao = noticeService.getCount(noticeDto);

            List<NoticeDto> list = noticeService.getSearchResultPage(sc);
            m.addAttribute("noticeList", list);
            m.addAttribute("ph", pageHandler);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "/soo/cs-notice";
    }
}