package com.dobby.project.sun;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {

    @Autowired
    ProductService productService;

    @GetMapping("/list")
    public String adminProductList(Model model) throws Exception {
        List<ProductDto> getAllProducts = productService.getAllProducts();
        List<ProductDCDto> Products_DC = productService.Products_DC();

        model.addAttribute("getAllProducts", getAllProducts);
        model.addAttribute("Products_DC", Products_DC);

//        System.out.println("hairBodyProducts"+hairBodyProducts);

        return "sun/admin-product-list";
    }







}
