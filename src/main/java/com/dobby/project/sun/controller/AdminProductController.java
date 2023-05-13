package com.dobby.project.sun.controller;

import com.dobby.project.hoon.domain.AdminDto;
import com.dobby.project.soo.PageHandler;
import com.dobby.project.sun.domain.*;
import com.dobby.project.sun.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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



    @GetMapping("/read")
    public String read( int id,Integer page, Integer pageSize, Model model) {
        try {
            model.addAttribute("mode", "read");
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
//                model.addAttribute("timestamp", System.currentTimeMillis());

                System.out.println("adminProductList=" + model);


            } catch (Exception e) {
                e.printStackTrace();
            }

            return "sun/admin-product-list";
        }
    }



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
    public String register(TotalDto totalDto, @RequestParam("file")MultipartFile file, @RequestParam("detailFile")MultipartFile detailFile) {
        try {

            String uploadFolder = "C:\\upload\\";

            // 대표 이미지 처리
            String fileRealName = file.getOriginalFilename();
            long size = file.getSize(); //파일 사이즈

            System.out.println("파일명 : " + fileRealName);
            System.out.println("용량크기(byte) : " + size);

            //서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
            String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));

            UUID uuid = UUID.randomUUID();
            System.out.println("uuid = " + uuid);

            String[] uuids = uuid.toString().split("-");
            String uniqueName = uuids[0];

            System.out.println("생성된 고유문자열 uniqueName =" + uniqueName);
            System.out.println("확장자명 fileExtension = " + fileExtension);


            File saveFile = new File(uploadFolder + uniqueName + fileExtension + fileRealName);
            // 실제 파일 저장 메서드
            file.transferTo(saveFile);
//            totalDto.setREP_IMG("/img/product/" + uniqueName + fileExtension);
            totalDto.setREP_IMG(uniqueName + fileExtension + fileRealName);

            // 상세정보 이미지 처리

            String detailFileRealName = detailFile.getOriginalFilename();
            long size2 = detailFile.getSize(); //파일 사이즈

            System.out.println("상세 파일명 : " + detailFileRealName);
            System.out.println("상세 용량크기(byte) : " + size2);

            String detailFileExtension = detailFileRealName.substring(detailFileRealName.lastIndexOf("."));


            UUID detailUuid = UUID.randomUUID();

            String[] uuids2 = detailUuid.toString().split("-");
            String detailUniqueName = uuids2[0];

            System.out.println("생성된 고유문자열 detailUniqueName =" + detailUniqueName);
            System.out.println("확장자명 detailFileExtension = " + detailFileExtension);

            File detailSaveFile = new File(uploadFolder + detailUniqueName + detailFileExtension + detailFileRealName);
            detailFile.transferTo(detailSaveFile);
            totalDto.setFILE_PATH(detailUniqueName + detailFileExtension + detailFileRealName);

            productService.register(totalDto);

            return "redirect:/admin/product/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "/sun/admin-product";
        }
    }

//    }  @PostMapping("/register")
//    public String register(TotalDto totalDto) {
//        try {
//
//            // 대표 이미지 처리
//            MultipartFile file = totalDto.getFile();
//            String fileRealName = file.getOriginalFilename();
//            String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));
//            UUID uuid = UUID.randomUUID();
//            String uniqueName = uuid.toString().split("-")[0];
////            String uploadFolder = "C:\\Users\\doswp\\IdeaProjects\\dobby_clone\\src\\main\\webapp\\resources\\img\\product";
//            String uploadFolder = "C:\\upload";
//
//            File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension);
//            file.transferTo(saveFile);
////            totalDto.setREP_IMG("/img/product/" + uniqueName + fileExtension);
//            totalDto.setREP_IMG( uniqueName + fileExtension);
//
//            // 상세정보 이미지 처리
//            MultipartFile detailFile = totalDto.getDetailFile();
//            String detailFileRealName = detailFile.getOriginalFilename();
//            String detailFileExtension = detailFileRealName.substring(detailFileRealName.lastIndexOf("."));
//            UUID detailUuid = UUID.randomUUID();
//            String detailUniqueName = detailUuid.toString().split("-")[0];
////            String uploadFolder2 = "C:\\Users\\doswp\\IdeaProjects\\dobby_clone\\src\\main\\webapp\\resources\\img\\product-detail";
//            String uploadFolder2 = "C:\\upload";
//
//            File detailSaveFile = new File(uploadFolder2 + "\\" + detailUniqueName + detailFileExtension);
//            detailFile.transferTo(detailSaveFile);
////            totalDto.setFILE_PATH("/img/product-detail/" + detailUniqueName + detailFileExtension);
//            totalDto.setFILE_PATH( detailUniqueName + detailFileExtension);
//
//            productService.register(totalDto);
//
//            return "redirect:/admin/product/list";
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "/sun/admin-product";
//        }
//    }

    //    상품 삭제
    @PostMapping("/remove")
    public String remove( Integer id, Integer page, Integer pageSize, Model model) throws Exception {


        try {
            // 1. 상품의 이미지 파일 경로를 얻는다.
            String imagePath = productService.getImgPath(id);
            String detailImagePath = productService.getDetailImgPath(id);

            System.out.println("imagePath = " + imagePath);

            String uploadFolder = "C:\\Users\\doswp\\IdeaProjects\\dobby_clone\\src\\main\\webapp\\resources\\";
            String uploadFolder2 = "C:\\Users\\doswp\\IdeaProjects\\dobby_clone\\src\\main\\webapp\\resources\\";

            // 2. 해당 파일을 삭제한다.
            File file = new File(uploadFolder + imagePath);
            File file2 = new File(uploadFolder2 + detailImagePath);

            System.out.println("file = " + file);

            if (file.exists() ) {
                file.delete();
            }
            if (file2.exists() ) {
                file2.delete();
            }

            // 3. 데이터베이스에서 상품을 삭제한다.
            productService.remove(id);

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("page", page);
        model.addAttribute("pageSize", pageSize);

        return  "redirect:/admin/product/list";
    }


    @PostMapping("/modify")
    public String modify(Integer id, TotalDto totalDto, @RequestParam("file") MultipartFile file, @RequestParam("detailFile") MultipartFile detailFile) throws IOException {
        try {
            // 이미지가 업로드되었는지 확인합니다.
            if (file != null && !file.isEmpty()) {
                // 기존 이미지 파일 경로를 얻어옵니다.
                String imagePath = productService.getImgPath(id);

                // 기존 이미지 파일을 삭제합니다.
                if (imagePath != null) {
                    // 기존 이미지 파일을 삭제합니다.
                    File oldFile = new File(imagePath);
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }
                }

                // 새로운 이미지 파일을 저장합니다.
                String fileRealName = file.getOriginalFilename();
                String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));
                UUID uuid = UUID.randomUUID();
                String uniqueName = uuid.toString().split("-")[0];
//                String uploadFolder = "C:\\Users\\doswp\\IdeaProjects\\dobby_clone\\src\\main\\webapp\\resources\\img\\product";
                String uploadFolder = "C:\\upload";
                File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension);
                file.transferTo(saveFile);

                // DTO에 새로운 이미지 파일 경로를 설정합니다.
//                totalDto.setREP_IMG("/img/product/" + uniqueName + fileExtension);
                totalDto.setREP_IMG( uniqueName + fileExtension);
            }

            // 상세정보 이미지 처리
            if (detailFile != null && !detailFile.isEmpty()) {
                // 기존 상세 이미지 파일 경로를 얻어옵니다.
                String detailImagePath = productService.getDetailImgPath(id);

                // 기존 상세 이미지 파일을 삭제합니다.
                if (detailImagePath != null) {
                    // 기존 이미지 파일을 삭제합니다.
                    File oldDetailFile = new File(detailImagePath);
                    if (oldDetailFile.exists()) {
                        oldDetailFile.delete();
                    }
                }

                String detailFileRealName = detailFile.getOriginalFilename();
                String detailFileExtension = detailFileRealName.substring(detailFileRealName.lastIndexOf("."));
                UUID detailUuid = UUID.randomUUID();
                String detailUniqueName = detailUuid.toString().split("-")[0];
//                String uploadFolder2 = "C:\\Users\\doswp\\IdeaProjects\\dobby_clone\\src\\main\\webapp\\resources\\img\\product-detail";
                String uploadFolder2 ="C:\\upload";

                File detailSaveFile = new File(uploadFolder2 + "\\" + detailUniqueName + detailFileExtension);
                detailFile.transferTo(detailSaveFile);
//                totalDto.setFILE_PATH("/img/product-detail/" + detailUniqueName + detailFileExtension);
                totalDto.setFILE_PATH(detailUniqueName + detailFileExtension);
            }

            // 상품 정보를 수정합니다.
            productService.modify(totalDto);

            return "redirect:/admin/product/list";

        } catch (Exception e) {
            e.printStackTrace();
            return "/sun/admin-product-read";
        }
    }


























//    @PostMapping("/modify")
//    public String modify(Integer id, ProductDto productDto, @RequestParam("file") MultipartFile file) {
//        try {
//            // 이미지가 업로드되었는지 확인합니다.
//            if (!file.isEmpty()) {
//                // 기존 이미지 파일 경로를 얻어옵니다.
////                String imagePath  = productService.getImgPath(registerDto.getPROD_ID());
//                String imagePath = productService.getImgPath(id);
//                String path = "C:\\Users\\doswp\\IdeaProjects\\dobby_clone\\src\\main\\webapp\\resources\\";
//
//
//                // 기존 이미지 파일을 삭제합니다.
//                File oldFile = new File(path + imagePath);
//                System.out.println("oldFile = " + oldFile);
//
//
//                if(oldFile.exists()) {
//                    oldFile.delete();
//                }
//
//                // 새로운 이미지 파일을 저장합니다.
//                String fileRealName = file.getOriginalFilename();
//                String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
//                String uploadFolder = "C:\\Users\\doswp\\IdeaProjects\\dobby_clone\\src\\main\\webapp\\resources\\img\\sun\\product-image";
//                UUID uuid = UUID.randomUUID();
//                String uniqueName = uuid.toString().split("-")[0];
//                File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension);
//                file.transferTo(saveFile);
//
//                // DTO에 새로운 이미지 파일 경로를 설정합니다.
//                productDto.setREP_IMG(uploadFolder + "\\" + uniqueName + fileExtension);
//            }
//
//            // 상품 정보를 수정합니다.
//            productService.modify(productDto);
//            return "redirect:/admin/product/list";
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "/sun/admin-product-read";
//        }
//    }
//
//
//
//


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








}
