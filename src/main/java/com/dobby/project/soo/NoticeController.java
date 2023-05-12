package com.dobby.project.soo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("/cs/notice")
public class NoticeController {
    @Autowired
    NoticeService noticeService;

    @GetMapping("/read")    // 게시물 읽기
    public String noticeRead(@RequestParam(defaultValue ="1") Integer page,
                             @RequestParam(defaultValue ="10") Integer pageSize,
                             @RequestParam(required = true) Integer NB_ID, Model m,
                             RedirectAttributes rttr) throws Exception {
        System.out.println("NoticeController - NB_ID = " + NB_ID);

        try {
            // 게시물 번호로 읽어오기
            NoticeDto noticeDto = noticeService.read(NB_ID);
            m.addAttribute("noticeDto", noticeDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);

            System.out.println("NoticeController - page = " + page);
            System.out.println("NoticeController - pageSize = " + pageSize);
            System.out.println("NoticeController - m = " + m);

        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "readError");
        }
        return "/soo/cs-notice-view";  // jsp 파일명 변경하기
    }



    @GetMapping("/list")    // 게시물 목록 조회
    public String noticeList(@RequestParam(defaultValue ="1") Integer page, SearchCondition sc,
                             @RequestParam(defaultValue = "10") Integer pageSize, Model m) throws Exception {

        try {
            // 총 게시물의 개수를 저장
            int totalCnt = noticeService.getCount();
            m.addAttribute("totalCnt", totalCnt);
            // pageHandler 객체 생성
            PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);

            Map<String, Object> map = new HashMap<>();
            // offset => 조회를 시작할 위치 지정
            map.put("offset", (page-1)*pageSize);
            // 첫번째 페이지는 offset = 0, 두번째 페이지는 offset = 10
            map.put("pageSize", pageSize);

            // offset, pageSize 정보가 저장된 map을 이용하여 게시물 목록을 조회
            List<NoticeDto> list = noticeService.getAllList(map); //getAlllist(),이름 수정
            m.addAttribute("noticeList", list);
            m.addAttribute("ph", pageHandler);
            System.out.println("NoticeController/list - m = " + m);
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "listError");
        }

        return "soo/cs-notice";
    }
}
