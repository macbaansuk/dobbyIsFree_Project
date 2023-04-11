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
        List<ProductDCDto> Products_DC = productService.Products_DC();


        model.addAttribute("skincareProducts", skincareProducts);
        model.addAttribute("Products_DC", Products_DC);



        return "sun/product-skincare";
    }
    @RequestMapping("/makeup")
    public String makeup(Model model) throws Exception {
        List<ProductDto> makeupProducts = productService.getMakeupProducts();
        List<ProductDCDto> Products_DC = productService.Products_DC();

        model.addAttribute("makeupProducts", makeupProducts);
        model.addAttribute("Products_DC", Products_DC);

//        System.out.println("makeupProducts"+makeupProducts);

        return "sun/product-makeup";
    }

    @RequestMapping("/men")
    public String men(Model model) throws Exception {
        List<ProductDto> menProducts = productService.getMenProducts();
        List<ProductDCDto> Products_DC = productService.Products_DC();

        model.addAttribute("menProducts", menProducts);
        model.addAttribute("Products_DC", Products_DC);


        return "sun/product-men";
    }
    @RequestMapping("/hair-body")
    public String hairBody(Model model) throws Exception {
        List<ProductDto> hairBodyProducts = productService.getHairBodyProducts();
        List<ProductDCDto> Products_DC = productService.Products_DC();

        model.addAttribute("hairBodyProducts", hairBodyProducts);
        model.addAttribute("Products_DC", Products_DC);

//        System.out.println("hairBodyProducts"+hairBodyProducts);

        return "sun/product-hair-body";
    }



}
