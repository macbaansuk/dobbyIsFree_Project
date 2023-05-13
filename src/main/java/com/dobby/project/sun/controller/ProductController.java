package com.dobby.project.sun.controller;

import com.dobby.project.sun.domain.*;
import com.dobby.project.sun.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

//

    @GetMapping("/productDetail/{id}") // 상품 상세
    public String getProductById(@PathVariable("id") int id, Model model) throws Exception {
//        System.out.println("진입");

        ProductDto productDetail = productService.getProductById(id);
        List<ProductDCDto> Products_DC = productService.Products_DC(); // 제품에 관한 디스카운트만
        ProductFileDto getDetailImage = productService.getDetailImage(id);

//        System.out.println("여기");
        model.addAttribute("productDetail", productDetail);
        model.addAttribute("Products_DC", Products_DC);
        model.addAttribute("getDetailImage", getDetailImage);

        System.out.println("productDetail=>"+productDetail);
        return "sun/product-detail";
    }


    @GetMapping("/list/{category}") //상품 카테고리별 목록페이지
    public String category(@PathVariable("category") int category, Model model) throws Exception {
        System.out.println("카테고리 들어가자");
        List<ProductCateDto> productList = productService.getProductList(category);
        List<SortDto> Cate_Products_DC = productService.Cate_Products_DC();
        int countProducts = productService.countProducts(category); //사이즈써서 PRODUCTLIST.SIZE()

        System.out.println("카테고리 다음단계");
        model.addAttribute("productList", productList);
        model.addAttribute("Cate_Products_DC", Cate_Products_DC);
        model.addAttribute("countProducts", countProducts);

        System.out.println("productList = " + productList);


        return "sun/product-list";
    }//할인이랑 상품이랑 하나로 합칠 수 있을듯

    @GetMapping("/list/{category}/ajax")
    @ResponseBody
    public List<SortDto> productListAjax(@PathVariable("category") Integer category, @RequestParam(value = "sort", required = false) String sort) {
        System.out.println("에이젝스 실행해보자");
        return productService.getProductsByCategoryAndSort(category, sort);
    }






}
