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


    //수정된 게시물 저장
    @PostMapping("/modify")
    public String Modify(RegisterDto registerDto) {
        try {
            System.out.println("수정 하자 ");
            productService.modify(registerDto);
            System.out.println("수정 완료 ");
//            model.addAttribute("register", register);
            return "redirect:/admin/product/list";


        } catch (Exception e) {
            e.printStackTrace();

            System.out.println("수정 실패");

            return "/sun/admin-product-read";
        }
    }




    //상품 등록 작성 빈화면
    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("mode", "register");
        System.out.println("등록 저장 빈화면 가자");

        return "/sun/admin-product";
    }

    @PostMapping("/register")
//    public String register(RegisterDto registerDto, @RequestParam("REP_IMG") MultipartFile mainImage, @RequestParam("PATH") MultipartFile detailImage, HttpServletRequest request) {
    public String register(RegisterDto registerDto) {
        try {
//            // 이미지 파일 저장
//            String mainImagePath = saveImage(mainImage, request);
//            String detailImagePath = saveImage(detailImage, request);
//
//            if (mainImagePath != null) {
//                registerDto.setREP_IMG(mainImagePath);
//            }
//            if (detailImagePath != null) {
//                registerDto.setPATH(detailImagePath);
//            }

            // 상품 정보 및 이미지 저장
            productService.register(registerDto);


            return "redirect:/admin/product/list";
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
            return "/sun/admin-product";
//            return "error";
        }
    }

//    private String saveImage(MultipartFile image, HttpServletRequest request) throws IOException, IOException {
//        if (image != null && !image.isEmpty()) {
////            String uploadDir = request.getServletContext().getRealPath("/upload/");
//            String uploadDir = "C:\\Users\\doswp\\Desktop\\pic";
//            String originalFileName = image.getOriginalFilename();
//            String saveFileName = UUID.randomUUID().toString() + "_" + originalFileName;
//
//            File file = new File(uploadDir, saveFileName);
//            image.transferTo(file);
//
//            return "/upload/" + saveFileName;
//        }
//
//        return null;
//    }

//        상품 등록한거 저장
//    @PostMapping("/register")
////    public String register(RedirectAttributes rattr, Model model, ProductDto productDto, ProductDCDto productDCDto, ProductOptionDto productOptionDto, ProductHashtagDto productHashtagDto, ProductFileDto productFileDto) {
////    public String register(RedirectAttributes rattr, Model model,ProductDto productDto) {
//    public String register(RedirectAttributes rattr, Model model,RegisterDto registerDto, MultipartFile imgFile) {
//        System.out.println("등록저장 가자");
//
//            try {
////                productService.register(productDto);
//                productService.register(registerDto, imgFile);
////                    throw new Exception("Write failed.");
//                model.addAttribute("registerDto",registerDto);
//                System.out.println("register = " +registerDto);
//
//                rattr.addFlashAttribute("msg", "WRT_OK");
//                return "redirect:/admin/product/list";
//            } catch (Exception e) {
////                model.addAttribute("productDto",productDto);
//                System.out.println("register = " +registerDto);
//
//                model.addAttribute("registerDto",registerDto);
////                System.out.println("productDto = " +productDto);
//                System.out.println("register = " +registerDto);
//
//                return "/sun/admin-product";
//            }
//
//        }


    //    상품 등록한거 저장
//    @PostMapping("/register")
////    public String register(RedirectAttributes rattr, Model model, ProductDto productDto, ProductDCDto productDCDto, ProductOptionDto productOptionDto, ProductHashtagDto productHashtagDto, ProductFileDto productFileDto) {
////    public String register(RedirectAttributes rattr, Model model,ProductDto productDto) {
//    public String register(RedirectAttributes rattr, Model model,RegisterDto registerDto) {
//        System.out.println("등록저장 가자");
//
//            try {
////                productService.register(productDto);
//                productService.register(registerDto);
////                    throw new Exception("Write failed.");
//                model.addAttribute("registerDto",registerDto);
//                System.out.println("register = " +registerDto);
//
//                rattr.addFlashAttribute("msg", "WRT_OK");
//                return "redirect:/admin/product/list";
//            } catch (Exception e) {
////                model.addAttribute("productDto",productDto);
//                System.out.println("register = " +registerDto);
//
//                model.addAttribute("registerDto",registerDto);
////                System.out.println("productDto = " +productDto);
//                System.out.println("register = " +registerDto);
//
//                return "/sun/admin-product";
//            }
//
//        }
//        @PostMapping("/register")
////    public String register(RedirectAttributes rattr, Model model, ProductDto productDto, ProductDCDto productDCDto, ProductOptionDto productOptionDto, ProductHashtagDto productHashtagDto, ProductFileDto productFileDto) {
////    public String register(RedirectAttributes rattr, Model model,ProductDto productDto) {
//    public String register(RedirectAttributes rattr, Model model,RegisterDto registerDto, MultipartFile mainImg , MultipartFile detailImg
//                         ) {
//        System.out.println("등록저장 가자");
//
//            try {
//
//
//
////
////                productService.register(productDto);
//                productService.register(registerDto, repImg, detailImgs);
////                    throw new Exception("Write failed.");
//                model.addAttribute("registerDto",registerDto);
//                System.out.println("register = " +registerDto);
//
//                rattr.addFlashAttribute("msg", "WRT_OK");
//                return "redirect:/admin/product/list";
//            } catch (Exception e) {
////                model.addAttribute("productDto",productDto);
//                System.out.println("register = " +registerDto);
//
//                model.addAttribute("registerDto",registerDto);
////                System.out.println("productDto = " +productDto);
//                System.out.println("register = " +registerDto);
//
//                return "/sun/admin-product";
//            }
//
//        }
//
//    @PostMapping("/register")
//    @ResponseBody
//    public String addProduct(@RequestBody RegisterDto registerDto) throws Exception {
//        // 전송받은 데이터를 이용하여 데이터베이스에 새로운 상품 추가
//        boolean result = productService.register(registerDto);
//
//        if (result) {
//            // 성공적으로 상품이 등록되었을 경우
//            return "success";
//        } else {
//            // 상품 등록에 실패했을 경우
//            return "fail";
//        }
//    }



//    상품 등록한거 저장
//    @PostMapping("/register")
////    public String register(RedirectAttributes rattr, Model model, ProductDto productDto, ProductDCDto productDCDto, ProductOptionDto productOptionDto, ProductHashtagDto productHashtagDto, ProductFileDto productFileDto) {
//    public String register(RedirectAttributes rattr, Model model, ProductDto productDto ,ProductOptionDto productOptionDto) {
//        System.out.println("등록저장 가자");
//
//
//
//            try {
//                if (productService.register(productDto,productOptionDto) != 1)
//                    throw new Exception("Write failed.");
//
//                rattr.addFlashAttribute("msg", "WRT_OK");
//                return "redirect:/admin/product/list";
//            } catch (Exception e) {
//                model.addAttribute("productDto", productDto);
//                System.out.println("productDto = " + productDto);
//
//                return "/sun/admin-product";
//            }
//
//        }

//        @PostMapping("/register")
//        public String registerProduct(Model model,ProductDCDto productDCDto, ProductDto productDto, ProductOptionDto productOptionDto, RedirectAttributes redirectAttributes) {
////
////
////              MultipartFile productImage = productFileDto.getPROD_IMG();
////            String fileName = productImage.getOriginalFilename();
////            File file = new File("C:/images/" + fileName);
//            try {
//                        System.out.println("등록저장 가자");
//
////                productImage.transferTo(file);
////                productFileDto.setFILE_NM(fileName);
//                productService.register(productDto,  productOptionDto,productDCDto);
//
//
//
//                redirectAttributes.addFlashAttribute("message", "상품 등록 성공");
//            } catch (Exception e) {
//                e.printStackTrace();
//                redirectAttributes.addFlashAttribute("message", "상품 등록 실패");
//
//
//            }
//            return "redirect:/admin/product/list";
//        }
//@PostMapping("/register")
//public String registerProduct(@ModelAttribute ProductDto productDto,
//                              @ModelAttribute ProductDCDto productDCDto,
//                              @ModelAttribute ProductHashtagDto productHashtagDto,
//                              @ModelAttribute ProductOptionDto productOptionDto,
//                              RedirectAttributes redirectAttributes) {
//    try {
//        productService.register(productDto, productDCDto, productOptionDto, productHashtagDto);
//        redirectAttributes.addFlashAttribute("message", "상품 등록 성공");
//    } catch (Exception e) {
//        e.printStackTrace();
//        redirectAttributes.addFlashAttribute("message", "상품 등록 실패");
//    }
//    return "redirect:/admin/product/list";
//}




//                productService.registerProduct(productDto);
//                productService.registerDiscount(productDCDto);
//                productService.registerHashtag(productHashtagDto);
//                productService.registerFile(productFileDto);
//                productService.registerOption(productOptionDto);
//       model.addAttribute("productDto", productDto);
//                System.out.println("productDto = " + productDto);
//                System.out.println("productHashtagDto = " + productHashtagDto);
//                System.out.println("productDCDto = " + productDCDto);
//                System.out.println("productHashtagDto = " + productHashtagDto);
//                System.out.println("productOptionDto = " + productOptionDto);




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
            return "redirect:/admin";
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
