package com.dobby.project.hoon.controller;

import com.dobby.project.hoon.domain.InvDto;
import com.dobby.project.hoon.domain.PageHandler;
import com.dobby.project.hoon.domain.invSearchCondition;
import com.dobby.project.hoon.service.InvService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    InvService invService;


    //현재 페이지의 모든 게시물을 가져오는 메서드
//    @GetMapping("/modify")
//    @ResponseBody
//    public  ResponseEntity<List<InvDto>> list() throws Exception {
//
//        System.out.println("작동완료");
//        List<InvDto> list = null;
//
//        try {
//            list = (List<InvDto>) invService.getInv();
//            return new ResponseEntity<List<InvDto>>(list, HttpStatus.OK); // 200
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<List<InvDto>>(HttpStatus.BAD_REQUEST); // 400
//
//        }
//    }
    @GetMapping("/modify/{prodId}") // 체크박스에 체크된 prodID의  바꾸는 메서드
    @ResponseBody
    public InvDto getInv(@PathVariable Integer prodId) throws Exception {
        System.out.println("작동완료");
        InvDto invDto = invService.getInv(prodId);
        System.out.println("prodId = " + prodId);
        System.out.println("invDto = " + invDto);
        return invDto;
    }

    @ResponseBody
    @PostMapping("/modify") //재고관리에 나오는 값들 중 선택한 값은  DB에서 update 한다.
    public String modify(InvDto invDto, Integer page, Integer pageSize, RedirectAttributes rattr, Model m, HttpSession session)  throws Exception{
//

        try {
            System.out.println("invDto 1 = " + invDto);
            if (invService.InvModify(invDto) != 1) // 소문자로 메서드명 변경할 것.
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
            return "hoon/inv"; // 등록하려던 내용을 보여줘야 함.
        }
    }




    @GetMapping("/list")  // 모든 게시물을 페이지로 나눠서 보여주는 메서드  //list

    public String list(invSearchCondition sc,Model m, HttpServletRequest request) {


//페이지가 0일때 에러난다. null과 0일때 1로 변경할것.
//        if(page==null) page=1;
//        if(pageSize==null) pageSize=10;

        try {
            int toatlCnt = invService.getInvSearchResultCnt(sc); // 테이블의 전체 레코드 수를 반환 한다. 전체 게시물의 개수
            PageHandler pageHandler = new PageHandler(toatlCnt, sc);

            List<InvDto> list = invService.getInvSearchResultPage(sc);
            m.addAttribute("list", list);
            m.addAttribute("ph",pageHandler);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "hoon/inv"; // 로그인을 한 상태이면, 게시판 화면으로 이동
    }
}
