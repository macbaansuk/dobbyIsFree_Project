package com.dobby.project.soo;

import com.dobby.project.hoon.domain.AdminDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/notice")
public class AdminNoticeController {

    @Autowired
    NoticeService noticeService;

    @GetMapping("/modify")  // 수정하기 위해 기존 데이터 읽어오기
    public String adminNoticeModifyForm(@RequestParam(defaultValue ="1") Integer page,
                                        @RequestParam(defaultValue ="10") Integer pageSize,Integer NB_ID, Model m ) throws Exception {
//        System.out.println("NoticeController - NB_ID: " + NB_ID);
        try {
            NoticeDto noticeDto = noticeService.read(NB_ID);
            m.addAttribute("noticeDto",noticeDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
            // 수정상태
            m.addAttribute("mode", "mod");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/soo/admin-notice-read";
    }


    @PostMapping("/modify") // 수정 후 데이터 보내기
    public String adminNoticeModify(NoticeDto noticeDto, @RequestParam(defaultValue ="1") Integer page,
                                    @RequestParam(defaultValue ="10") Integer pageSize, RedirectAttributes rttr, Model m) throws Exception {
                                                                                        // redirect시 url 쿼리파라미터
        try {
            noticeService.modify(noticeDto);

            rttr.addAttribute("page", page);
            rttr.addAttribute("pageSize", pageSize);
            rttr.addAttribute("mode", "mod");
            // 해당 게시물이 포함되어있던 기존 페이지로 되돌아 감
            return "redirect:/admin/notice/list?page=" + page + "&pageSize=" + pageSize;
            // redirect => 클라이언트가 요청한 url에서 다른 url로 이동시키는 것
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
    public String adminNoticeRemove(Integer NB_ID, Integer page, Integer pageSize, Model m, RedirectAttributes rttr) throws Exception {
        // 나중에 String WRTR 추가하기, 관리자 계정(이름)
        try {
            noticeService.remove(NB_ID);
        } catch (Exception e) {
            e.printStackTrace();
            // 성공, 실패 메시지, 리다이렉트때 rattr쓰기
            // rttr=> param.msg , flash=>msg,
        }
           rttr.addAttribute("page", page);
           rttr.addAttribute("pageSize", pageSize);

        return "redirect:/admin/notice/list";
    }

    @GetMapping("/read") // 게시물 제목 누르면 읽기 전용
    public String adminNoticeRead(Integer page, Integer pageSize,Integer NB_ID, Model m , RedirectAttributes rttr) throws Exception {
        System.out.println("NoticeController - NB_ID: " + NB_ID);

        try {
            NoticeDto noticeDto = noticeService.read(NB_ID);
            m.addAttribute("noticeDto",noticeDto);  // Dto 제대로 넘어왔는지 확인하기, 여러의 경우, 테스트 확인해보기, DB
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
            m.addAttribute("mode", "read");
        } catch (Exception e) {
            e.printStackTrace();
            // 게시물 읽기 실패하면, 게시물 목록으로 돌아갈 때 이전 페이지 정보를 유지
            rttr.addAttribute("page", page);
            rttr.addAttribute("pageSize", pageSize);
            return "redirect:/admin/notice/list";
        }

        return "/soo/admin-notice-read";
    }

    @GetMapping("/write")   // 게시물 등록 폼
    public String adminNoticeWriteForm(Model m) throws Exception {

        try {
//            NoticeDto noticeDto = new NoticeDto(); ,화면에서 넘어온 값을 받는다 컨트롤러에서
            m.addAttribute("noticeDto", new NoticeDto());
            m.addAttribute("mode", "new");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "soo/admin-notice-read";

    }


    @PostMapping("/write")  // 게시물 등록 후 데이터 보내기, 성공, 실패 확인
    public String adminNoticeWrite(Model m, NoticeDto noticeDto, RedirectAttributes rttr) throws Exception {
        try {
            noticeService.write(noticeDto);
            rttr.addAttribute("mode", "new");

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
                                  @RequestParam(defaultValue = "10")Integer pageSize, Model m,
                                  HttpSession session , RedirectAttributes rattr) throws Exception {

        AdminDto adminDto = (AdminDto) session.getAttribute("admin");
        // 로그인 체크 유무 코드
        if (session.getAttribute("admin") == null) {
            rattr.addFlashAttribute("msg", "login_ERR");
            return "redirect:/admin/login";
        } else {
            try {
                int totalCnt = noticeService.getCount();
                m.addAttribute("totalCnt", totalCnt);

                PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);

                Map<String, Object> map = new HashMap<>();
                map.put("offset", (page - 1) * pageSize);
                map.put("pageSize", pageSize);

                List<NoticeDto> list = noticeService.getAllList(map);
                m.addAttribute("adminNoticeList", list);
                m.addAttribute("ph", pageHandler);

                System.out.println("adminNoticeList=" + m);
            } catch (Exception e) {
                e.printStackTrace();
            }

            return "/soo/admin-notice-list";
        }
    }
}
