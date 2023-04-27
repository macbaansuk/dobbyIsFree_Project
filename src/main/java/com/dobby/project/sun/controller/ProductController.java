package com.dobby.project.sun.controller;

import com.dobby.project.sun.service.ProductService;
import com.dobby.project.sun.domain.ProductCateDto;
import com.dobby.project.sun.domain.ProductDCDto;
import com.dobby.project.sun.domain.ProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

//

    @GetMapping("/productDetail/{id}")
    public String getProductById(@PathVariable("id") int id, Model model) throws Exception {
//        System.out.println("진입");
        ProductDto productDetail = productService.getProductById(id);
        List<ProductDCDto> Products_DC = productService.Products_DC();

//        System.out.println("여기");
        model.addAttribute("productDetail", productDetail);
        model.addAttribute("Products_DC", Products_DC);

//        System.out.println("productDetail=>"+productDetail);
        return "sun/product-detail";
    }

    @GetMapping("/list/{category}")
    public String category(@PathVariable("category") int category, Model model) throws Exception {
        System.out.println("카테고리 들어가자");
        List<ProductCateDto> productList = productService.getProductList(category);
        List<ProductDCDto> Products_DC = productService.Products_DC();
        int countProducts = productService.countProducts(category);

        System.out.println("카테고리 다음단계");
        model.addAttribute("productList", productList);
        model.addAttribute("Products_DC", Products_DC);
        model.addAttribute("countProducts", countProducts);

//        System.out.println("productList = " + productList);


        return "sun/product-list";
    }








}
