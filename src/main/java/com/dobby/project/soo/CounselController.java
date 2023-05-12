package com.dobby.project.soo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class CounselController {

    @Autowired
    CounselService counselService;

    @GetMapping("/cs/counsel/main") // 고객센터 1:1 상담 안내
    public String counselMain() throws Exception {

        return "soo/cs_counsel";
    }

    @PostMapping("/mypage/counsel/remove")
    public String counselRemove(Integer cnslId, Model m) throws Exception{
        counselService.removeCounsel(cnslId);
        return "redirect:/mypage/counsel/list";
    }

    @GetMapping("/mypage/counsel/write") // 1:1 상담 작성 폼(글쓰기)
    public String counselWriteForm(Model m, HttpServletRequest request, RedirectAttributes rttr) throws Exception {


            // 로그인 체크
            // session에 저장된게 없을 때
            HttpSession session = request.getSession();
            // 로그인되어 있지 않으면
            if (session == null || session.getAttribute("MBR_ID") == null) {
                // 이전 페이지 정보를 세션에 저장
                session.setAttribute("toURL", "/mypage/counsel/write");
                return "redirect:/login"; // 로그인 페이지로 이동
            }
            // 회원 이름, 전화번호 미리 불러오기
            // 세션에서 MBR_ID를 가져옴
            String mbrId = (String) session.getAttribute("MBR_ID");

            try {
            // 회원 이름, 전화번호 미리 불러오기
            MemberDto memberDto = counselService.getMember(mbrId);
            m.addAttribute("memberDto", memberDto);
            System.out.println("memberDto="+m);

        } catch (Exception e) {
            e.printStackTrace();
                return "redirect:/mypage/counsel/write";
        }

        return "soo/mypage_counsel_write";
    }

    @GetMapping("/mypage/counsel/write/prodPop")
    public String prodPopGET(@RequestParam(defaultValue ="1") Integer page,
                           @RequestParam(defaultValue = "10") Integer pageSize,Model m) throws Exception{

        // 상품 총 개수
        int totalCnt = counselService.getCountProd();
        m.addAttribute("totalCnt", totalCnt);

        PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);
        Map<String, Object> map = new HashMap<>();
        map.put("offset",(page-1)*pageSize);
        map.put("pageSize", pageSize);

        List<ProdDto> list = counselService.getProdList(map);
        m.addAttribute("prodList", list);
        m.addAttribute("ph", pageHandler);
        System.out.println("CounselController/prodPop - m" + m);

        return "soo/mypage_counsel_prodPop";
    }

    @PostMapping("/mypage/counsel/write")   // 1:1 상담 작성 후 데이터 전달
    public String counselWrite(Model m, CounselDto counselDto, RedirectAttributes rttr){

        try {
            counselService.writeCounsel(counselDto);
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(counselDto);

            return "soo/mypage_counsel_write";
        }
        System.out.println("counselDto="+counselDto);

        return "redirect:/mypage/counsel/list";
    }


    @GetMapping("/mypage/counsel/list") // 1:1 상담 작성 리스트 조회
    public String counselList(@RequestParam(defaultValue ="1") Integer page, HttpServletRequest request,
                              @RequestParam(defaultValue = "10") Integer pageSize, Model m) throws Exception {

        try {
            HttpSession session = request.getSession();
            if (session == null) {
                // 세션이 없는 경우에 대한 예외 처리
                throw new IllegalStateException("세션이 존재하지 않습니다.");
            }
            String mbrId = (String) session.getAttribute("MBR_ID");
            if (mbrId == null) {
                // MBR_ID가 세션에 저장되어 있지 않은 경우에 대한 예외 처리
                throw new IllegalStateException("MBR_ID가 세션에 저장되어 있지 않습니다.");
            }

            System.out.println("세션 아이디 :" + mbrId);


            List<CounselAnswerDto> list = counselService.getListByMember(mbrId);
            m.addAttribute("list", list);
            System.out.println("상담 목록 조회 : "+m);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "soo/mypage_counsel_list";
    }
}
