package com.dobby.project.sun.controller;

import com.dobby.project.hoon.domain.AdminDto;
import com.dobby.project.soo.PageHandler;
import com.dobby.project.sun.domain.*;
import com.dobby.project.sun.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {

    @Autowired
    ProductService productService;


    //상품 판매페이지 미리보기
    @GetMapping("/read/{id}")
    public String adminProductRead(@PathVariable("id") int id, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer pageSize, Model model) throws Exception {
        try {
            ProductDto adminProdRead = productService.getProductById(id);
            List<ProductDCDto> Products_DC = productService.Products_DC();
            PageHandler pageHandler = new PageHandler(page, pageSize);
            if (page < 0 || page > pageHandler.getTotalPage())
                page = 1;
            if (pageSize < 0 || pageSize > 50)
                pageSize = 10;

            Map map = new HashMap();
            map.put("offset", (page - 1) * pageSize);
            map.put("pageSize", pageSize);


//        System.out.println("여기");
            model.addAttribute("adminProdRead", adminProdRead);
            model.addAttribute("Products_DC", Products_DC);
            model.addAttribute("ph", pageHandler);


        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/sun/admin-product-detail";
    }



    //상품 등록 작성 빈화면
    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("mode", "register");
        System.out.println("등록 저장 빈화면 가자");

        return "/sun/admin-product";



    }

    @PostMapping("/register")
    public String register(RegisterDto registerDto, @RequestParam("file") MultipartFile file) {
        try {

            String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
            long size = file.getSize(); //파일 사이즈

            System.out.println("파일명 : "  + fileRealName);
            System.out.println("용량크기(byte) : " + size);

            //서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
            String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
            String uploadFolder = "C:\\Users\\doswp\\IdeaProjects\\dobby_clone\\src\\main\\webapp\\resources\\img\\sun\\product-image\\";


            UUID uuid = UUID.randomUUID();
            System.out.println("uuid = " + uuid);
            String[] uuids = uuid.toString().split("-");

            String uniqueName = uuids[0];
            System.out.println("생성된 고유문자열 uniqueName = " + uniqueName);
            System.out.println("확장자명 fileExtension = " + fileExtension);

            File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
            try {
                file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
                registerDto.setREP_IMG(uniqueName + fileExtension); // 고유한 파일명과 확장자를 DTO의 REP_IMG 필드에 저장
                // 이거 추가한거임

                productService.register(registerDto); // 데이터베이스에 이미지 경로를 포함하여 값을 저장


            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

            return "redirect:/admin/product/list";
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
            return "/sun/admin-product";
        }
    }


    //수정된 게시물 저장

//    @PostMapping("/modify")
//    public String modify(RegisterDto registerDto, @RequestParam("file") MultipartFile file) {
//        try {
//
//            String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
//            long size = file.getSize(); //파일 사이즈
//
//            System.out.println("파일명 : "  + fileRealName);
//            System.out.println("용량크기(byte) : " + size);
//
//            //서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
//            String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
////            String uploadFolder = "C:\\upload";
//            String uploadFolder = "C:\\Users\\doswp\\IdeaProjects\\dobby_clone\\src\\main\\webapp\\resources\\img\\sun\\product-image\\";
//
//
//            UUID uuid = UUID.randomUUID();
//            System.out.println("uuid = " + uuid);
//            String[] uuids = uuid.toString().split("-");
//
//            String uniqueName = uuids[0];
//            System.out.println("생성된 고유문자열 uniqueName = " + uniqueName);
//            System.out.println("확장자명 fileExtension = " + fileExtension);
//
//            File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
//            try {
//                file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
//                registerDto.setREP_IMG(uniqueName + fileExtension); // 고유한 파일명과 확장자를 DTO의 REP_IMG 필드에 저장
//                // 이거 추가한거임
//
//                productService.modify(registerDto);
//
//            } catch (IllegalStateException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//
//            return "redirect:/admin/product/list";
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "/sun/admin-product-read";
//        }
//    }










//
//    String uploadFolder = "C:\\Users\\doswp\\IdeaProjects\\dobby_clone\\src\\main\\webapp\\resources\\img\\sun\\product-image\\";
//
//    @PostMapping("/modify")
//    public String modify(RegisterDto registerDto, @RequestParam("file") MultipartFile file) {
//        try {
//
////            productService.modify(registerDto);
//            String oldFilePath = uploadFolder + registerDto.getOldFilePath();
//            File oldFile = new File(oldFilePath);
//
//            // 이미지 파일이 제출되었는지 확인
//            if (!file.isEmpty()) {
//                // 기존 파일이 존재하면 삭제
//                if (oldFile.exists()) {
//                    oldFile.delete();
//                }
//
//                String uploadedFileName = uploadFile(file);
//                registerDto.setREP_IMG(uploadedFileName);
//                productService.modify(registerDto);
//            } else {
//                // 이미지 파일이 제출되지 않았다면 기존 파일명을 사용
//                registerDto.setREP_IMG(oldFile.getName());
//                productService.modify(registerDto);
//            }
//
//
//            return "redirect:/admin/product/list";
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "/sun/admin-product-read";
//        }
//    }
//
//    private String uploadFile(MultipartFile file) throws IOException {
//        String fileRealName = file.getOriginalFilename();
//        long size = file.getSize();
//
//        System.out.println("파일명 : "  + fileRealName);
//        System.out.println("용량크기(byte) : " + size);
//
//        String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
//
//        UUID uuid = UUID.randomUUID();
//        System.out.println("uuid = " + uuid);
//        String[] uuids = uuid.toString().split("-");
//
//        String uniqueName = uuids[0];
//        System.out.println("생성된 고유문자열 uniqueName = " + uniqueName);
//        System.out.println("확장자명 fileExtension = " + fileExtension);
//
//        File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension);
//        file.transferTo(saveFile);
//
//        return uniqueName + fileExtension;
//    }
//



    //상품 읽기
    @GetMapping("/read")
    public String read( int id,Integer page, Integer pageSize, Model model) {
        try {
            TotalDto read = productService.getAdminProductsById(id);
            List<ProductDCDto> Products_DC = productService.Products_DC();


            model.addAttribute("read", read);
            model.addAttribute("Products_DC", Products_DC);
            model.addAttribute("page", page);
            model.addAttribute("pageSize", pageSize);
            model.addAttribute("mode", "read");



            System.out.println("read = " + read);

        } catch (Exception e) {
            e.printStackTrace();
        }
    return "/sun/admin-product-read";
    }

    //상품 목록
    @GetMapping("/list")
    public String adminProductList(@RequestParam(defaultValue ="1") Integer page, @RequestParam(defaultValue = "10") Integer pageSize, Model model, HttpSession session , RedirectAttributes rattr) throws Exception {

        AdminDto adminDto = (AdminDto) session.getAttribute("admin");
        // 로그인 체크 유무 코드
        if (session.getAttribute("admin") == null) {
            rattr.addFlashAttribute("msg", "login_ERR");
            return "redirect:/admin/login";
        } else { // 본인 페이지 원래 코드


            if (page == null) page = 1;
            if (pageSize == null) pageSize = 10;

            try {

                int totalCnt = productService.getCount();
                model.addAttribute("totalCnt", totalCnt);

                System.out.println("totalCnt = " + totalCnt);

                PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);

                Map map = new HashMap();
                map.put("offset", (page - 1) * pageSize);
                map.put("pageSize", pageSize);

                List<ProductCateDto> list = productService.getPage(map);
                model.addAttribute("adminProductList", list);
                model.addAttribute("ph", pageHandler);
                model.addAttribute("page", page);
                model.addAttribute("pageSize", pageSize);

                System.out.println("adminProductList=" + model);


            } catch (Exception e) {
                e.printStackTrace();
            }

            return "sun/admin-product-list";
        }
    }
    //상품 삭제
    @PostMapping("/remove")
    public String remove(Integer id, Integer page, Integer pageSize, Model model) throws Exception {


        try {
            productService.remove(id);

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("page", page);
        model.addAttribute("pageSize", pageSize);

        return  "redirect:/admin/product/list";
    }




}
