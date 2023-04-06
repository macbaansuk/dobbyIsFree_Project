package com.dobby.project.controller.sun;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
    @RequestMapping("/product-skincare")
    public String skincare(){
        return "sun/product-skincare";
    }

    @RequestMapping("/product-makeup")
    public String makeup(){
        return "sun/product-makeup";
    }

    @RequestMapping("/product-men")
    public String men(){
        return "sun/product-men";
    }

    @RequestMapping("/product-hair-body")
    public String hairBody(){
        return "sun/product-hair-body";
    }






}
