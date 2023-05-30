package com.dobby.project.product.controller;

import com.dobby.project.product.domain.*;
import com.dobby.project.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;


    @GetMapping("/productDetail/{id}") // 상품 상세
    public String getProductById(@PathVariable("id") int id, Model model) throws Exception {


        ProductDto productDetail = productService.getProductById(id);
        List<ProductDCDto> Products_DC = productService.Products_DC(); // 제품에 관한 디스카운트만
        ProductFileDto getDetailImage = productService.getDetailImage(id);


        model.addAttribute("productDetail", productDetail);
        model.addAttribute("Products_DC", Products_DC);
        model.addAttribute("getDetailImage", getDetailImage);


        return "product/product-detail";
    }


    @GetMapping("/list/{category}") //상품 카테고리별 목록페이지
    public String category(@PathVariable("category") int category, Model model) throws Exception {

        List<ProductCateDto> productList = productService.getProductList(category);
        List<SortDto> Cate_Products_DC = productService.Cate_Products_DC();
        int countProducts = productService.countProducts(category); //사이즈써서 PRODUCTLIST.SIZE()


        model.addAttribute("productList", productList);
        model.addAttribute("Cate_Products_DC", Cate_Products_DC);
        model.addAttribute("countProducts", countProducts);




        return "product/product-list";
    }

    @GetMapping("/list/{category}/ajax")
    @ResponseBody
    public List<SortDto> productListAjax(@PathVariable("category") Integer category, @RequestParam(value = "sort", required = false) String sort) {

        return productService.getProductsByCategoryAndSort(category, sort);
    }






}
