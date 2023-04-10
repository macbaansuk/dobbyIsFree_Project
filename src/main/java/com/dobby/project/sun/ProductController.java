package com.dobby.project.sun;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping("/skincare")
    public String skincare(Model model) throws Exception {
        List<ProductDto> skincareProducts = productService.getSkincareProducts();
        model.addAttribute("skincareProducts", skincareProducts);

        return "sun/product-skincare";
    }
    @RequestMapping("/makeup")
    public String makeup(Model model) throws Exception {
        List<ProductDto> makeupProducts = productService.getSkincareProducts();
        model.addAttribute("makeupProducts", makeupProducts);

        return "sun/product-makeup";
    }

    @RequestMapping("/men")
    public String men(Model model) throws Exception {
        List<ProductDto> menProducts = productService.getMenProducts();
        model.addAttribute("menProducts", menProducts);

        return "sun/product-men";
    }
    @RequestMapping("/hair-body")
    public String hairBody(Model model) throws Exception {
        List<ProductDto> hairBodyProducts = productService.getHairBodyProducts();
        model.addAttribute("hairBodyProducts", hairBodyProducts);
        System.out.println(hairBodyProducts);

        return "sun/product-hair-body";
    }



}
