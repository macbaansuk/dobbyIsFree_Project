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
    public String noticeRead(Integer page, Integer pageSize,Integer NB_ID, Model m) throws Exception {
        System.out.println("NoticeController - NB_ID: " + NB_ID);

        try {
            NoticeDto noticeDto = noticeService.read(NB_ID);
            m.addAttribute("noticeDto",noticeDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);

        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg","readError");
        }

        return "/soo/cs-notice-view";
    }


    @GetMapping("/list/{BBS_CATE}")
    public String noticeListByCate(@RequestParam(defaultValue ="1") Integer page, String BBS_CATE,
                                   @RequestParam(defaultValue = "10") Integer pageSize,Model m) throws Exception {
        // 카테고리별 게시물 개수 변수에 저장
        int totalCnt = noticeService.getCountByCate(BBS_CATE);
        // 게시물 개수 모델에 저장
        m.addAttribute("totalCnt", totalCnt);

        PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);
        if(page < 0 || page > pageHandler.getTotalPage())
            page = 1;
        if(pageSize < 0 || pageSize > 50)
            pageSize = 10;

        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * pageSize);
        map.put("pageSize", pageSize);
        map.put("BBS_CATE", BBS_CATE);

        List<NoticeDto> list = noticeService.getListByCate(BBS_CATE);
        m.addAttribute("noticeList", list);
        m.addAttribute("ph", pageHandler);

        return "notice/list";
    }


    @GetMapping("/list")
    public String noticeList(@RequestParam(defaultValue ="1") Integer page,
                             @RequestParam(defaultValue = "10") Integer pageSize,Model m) throws Exception {

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
            e.printStackTrace();
            m.addAttribute("msg", "listError");
        }

        return "/soo/cs-notice";
    }
}