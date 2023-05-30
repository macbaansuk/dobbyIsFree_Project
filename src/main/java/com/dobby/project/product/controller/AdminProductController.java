package com.dobby.project.product.controller;

import com.dobby.project.hoon.domain.AdminDto;
import com.dobby.project.soo.PageHandler;
import com.dobby.project.product.domain.*;
import com.dobby.project.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {

    @Autowired
    ProductService productService;


    @GetMapping("/read")
    public String read(int id, Integer page, Integer pageSize, Model model) {
        try {
            TotalDto totalDto = productService.getAdminProductsById(id);
            List<ProductDCDto> Products_DC = productService.Products_DC();


            model.addAttribute("totalDto", totalDto);
            model.addAttribute("Products_DC", Products_DC);
            model.addAttribute("page", page);
            model.addAttribute("pageSize", pageSize);
            model.addAttribute("mode", "readonly");



        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/product/admin-product-read";
    }

    //상품 목록
    @GetMapping("/list")
    public String adminProductList(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer pageSize, Model model, HttpSession session, RedirectAttributes rattr, Integer id) throws Exception {

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


                PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);

                Map map = new HashMap();
                map.put("offset", (page - 1) * pageSize);
                map.put("pageSize", pageSize);

                List<ProductCateDto> list = productService.getPage(map);


                model.addAttribute("adminProductList", list);
                model.addAttribute("ph", pageHandler);
                model.addAttribute("page", page);
                model.addAttribute("pageSize", pageSize);




            } catch (Exception e) {
                e.printStackTrace();
            }

            return "product/admin-product-list";
        }
    }

    //상품 등록 작성 빈화면
    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("mode", "register");


        return "/product/admin-product";

    }

    @PostMapping("/register")
    public String register(@ModelAttribute("totalDto") TotalDto totalDto, @RequestParam("file") MultipartFile file, @RequestParam("detailFile") MultipartFile detailFile, Model model) {

        try {
            // "/img/product/product-image/" 여기에 저장되는 각자 주소 넣으면 됩니다.
            String uploadFolder = "C:\\Users\\hntim\\IdeaProjects\\dobby_clone\\src\\main\\webapp\\resources\\img\\product\\product-image";

            // 대표 이미지 처리
            String fileRealName = file.getOriginalFilename();

            //서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
            String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));

            UUID uuid = UUID.randomUUID();

            String[] uuids = uuid.toString().split("-");
            String uniqueName = uuids[0];

            File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension);
            // 실제 파일 저장 메서드
            file.transferTo(saveFile);
            totalDto.setREP_IMG("/img/product/product-image/" + uniqueName + fileExtension);

            // 상세정보 이미지 처리

            String detailFileRealName = detailFile.getOriginalFilename();
            long size2 = detailFile.getSize(); //파일 사이즈




            String detailFileExtension = detailFileRealName.substring(detailFileRealName.lastIndexOf("."));


            UUID detailUuid = UUID.randomUUID();

            String[] uuids2 = detailUuid.toString().split("-");
            String detailUniqueName = uuids2[0];



            File detailSaveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension);
            detailFile.transferTo(detailSaveFile);
            totalDto.setFILE_PATH("/img/product/product-image/" + detailUniqueName + detailFileExtension);

            productService.register(totalDto);

            return "redirect:/admin/product/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "/product/admin-product";

        }
    }


    //    상품 판매페이지 미리보기
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


            model.addAttribute("adminProdRead", adminProdRead);
            model.addAttribute("Products_DC", Products_DC);
            model.addAttribute("ph", pageHandler);


        } catch (Exception e) {
            e.printStackTrace();
        }
        return "product/product-detail";
    }


    //    상품 삭제
    @PostMapping("/remove")
    public String remove(Integer id, Integer page, Integer pageSize, Model model) throws Exception {


        try {
//             1. 상품의 이미지 파일 경로를 얻는다.
            String imagePath = productService.getImgPath(id);
            String detailImagePath = productService.getDetailImgPath(id);


            String uploadFolder = "C:\\Users\\hntim\\IdeaProjects\\dobby_clone\\src\\main\\webapp\\resources";


            // 2. 해당 파일을 삭제한다.
            File file = new File(uploadFolder + imagePath);
            File file2 = new File(uploadFolder + detailImagePath);


            if (file.exists()) {
                file.delete();
            }
            if (file2.exists()) {
                file2.delete();
            }

            // 3. 데이터베이스에서 상품을 삭제한다.
            productService.remove(id);

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("page", page);
        model.addAttribute("pageSize", pageSize);

        return "redirect:/admin/product/list";
    }

    //수정하기 전 값 가져오기
    @GetMapping("/modify")
    public String modify(Integer id, Integer page, Integer pageSize, Model model) {
        try {
            model.addAttribute("mode", "modify");
            TotalDto totalDto = productService.getAdminProductsById(id);
            List<ProductDCDto> Products_DC = productService.Products_DC();


            model.addAttribute("totalDto", totalDto);
            model.addAttribute("Products_DC", Products_DC);
            model.addAttribute("page", page);
            model.addAttribute("pageSize", pageSize);



        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/product/admin-product-read";
    }

//     상품 수정
    @PostMapping("/modify")
    public String modify( TotalDto totalDto, @RequestParam(defaultValue ="1") Integer page,
                          @RequestParam(defaultValue ="10") Integer pageSize, RedirectAttributes rttr, Model model, @RequestParam("file") MultipartFile file,
                          @RequestParam("detailFile") MultipartFile detailFile) throws Exception {

        try {


            // 상품 정보를 수정합니다.
            productService.modify(totalDto);
            rttr.addAttribute("page", page);
            rttr.addAttribute("pageSize", pageSize);


            return "redirect:/admin/product/list?page=" + page + "&pageSize=" + pageSize;

        } catch (Exception e) {
            e.printStackTrace();

            model.addAttribute(totalDto);
            model.addAttribute("page", page);
            model.addAttribute("pageSize", pageSize);

            return "/product/admin-product-read";
        }
    }


}
