package com.dobby.project.soo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/notice")
public class AdminNoticeController {

    @Autowired
    NoticeService noticeService;


    @GetMapping("/modify")  // 수정하기 위해 기존 데이터 읽어오기
    public String adminNoticeModifyForm(Integer page, Integer pageSize,Integer NB_ID, Model m ) throws Exception {
//        System.out.println("NoticeController - NB_ID: " + NB_ID);

        try {
            NoticeDto noticeDto = noticeService.read(NB_ID);
            m.addAttribute("noticeDto",noticeDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
            m.addAttribute("mode", "mod");
        } catch (Exception e) {
            e.printStackTrace();

        }

        return "/soo/admin-notice-read";
    }


    @PostMapping("/modify") // 수정 후 데이터 보내기
    public String adminNoticeModify(NoticeDto noticeDto, Integer page, Integer pageSize, RedirectAttributes rattr, Model m) throws Exception {
        try {
            noticeService.modify(noticeDto);

            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);
            m.addAttribute("mode", "mod");
            return "redirect:/admin/notice/list?page=" + page + "&pageSize=" + pageSize;

        } catch (Exception e) {
            e.printStackTrace();
            // 예외가 발생하면, 사용자가 입력하던 내용을 그대로 보여줘야하기 때문에 Model에 noticeDto를 저장하고
            m.addAttribute(noticeDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
            // 뷰에 다시 전달
            return "soo/admin-notice-read";
        }
    }


    @PostMapping("/remove") // 게시물 수정 페이지에서의 삭제
    public String adminNoticeRemove(Integer NB_ID, Integer page, Integer pageSize, Model m) throws Exception {
        // 나중에 String WRTR 추가하기, 관리자 계정(이름)
        try {
            noticeService.remove(NB_ID);
        } catch (Exception e) {
            e.printStackTrace();
        }
           m.addAttribute("page", page);
           m.addAttribute("pageSize", pageSize);

        return "redirect:/admin/notice/list";
    }

    @GetMapping("/read") // 게시물 제목 누르면 읽기 전용
    public String adminNoticeRead(Integer page, Integer pageSize,Integer NB_ID, Model m , RedirectAttributes rattr) throws Exception {
        System.out.println("NoticeController - NB_ID: " + NB_ID);

        try {
            NoticeDto noticeDto = noticeService.read(NB_ID);
            m.addAttribute("noticeDto",noticeDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
            m.addAttribute("mode", "read");
        } catch (Exception e) {
            e.printStackTrace();
            // 게시물 읽기 실패하면, 게시물 목록으로 돌아갈 때 이전 페이지 정보를 유지
            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);
            return "redirect:/admin/notice/list";
        }

        return "/soo/admin-notice-read";
    }

    @GetMapping("/write")   // 게시물 등록 폼
    public String adminNoticeWriteForm(Model m) {

        try {
            NoticeDto noticeDto = new NoticeDto();
            m.addAttribute("noticeDto", new NoticeDto());
            m.addAttribute("mode", "new");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "soo/admin-notice-read";

    }


    @PostMapping("/write")  // 게시물 등록 후 데이터 보내기
    public String adminNoticeWrite(Model m, NoticeDto noticeDto) {
        try {
            noticeService.write(noticeDto);
            m.addAttribute("mode", "new");

        } catch (Exception e) {
            e.printStackTrace();
            // 사용자가 등록하던 내용을 다시 보여줘야함
            m.addAttribute(noticeDto);
            return "/soo/admin-notice-read";
        }
        return "redirect:/admin/notice/list";
    }


    @GetMapping("/list")    // 목록 읽어오기
    public String adminNoticeList(@RequestParam(defaultValue ="1") Integer page,
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
            m.addAttribute("adminNoticeList", list);
            m.addAttribute("ph", pageHandler);

            System.out.println("adminNoticeList="+m);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "/soo/admin-notice-list";
    }
}
