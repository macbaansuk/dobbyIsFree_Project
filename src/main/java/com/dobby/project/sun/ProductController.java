package com.dobby.project.sun;

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

    @GetMapping("/skincare")
    public String skincare(Model model) throws Exception {
        List<ProductDto> skincareProducts = productService.getSkincareProducts();
        List<ProductDCDto> Products_DC = productService.Products_DC();


        model.addAttribute("skincareProducts", skincareProducts);
        model.addAttribute("Products_DC", Products_DC);



        return "sun/product-skincare";
    }
    @GetMapping("/makeup")
    public String makeup(Model model) throws Exception {
        List<ProductDto> makeupProducts = productService.getMakeupProducts();
        List<ProductDCDto> Products_DC = productService.Products_DC();

        model.addAttribute("makeupProducts", makeupProducts);
        model.addAttribute("Products_DC", Products_DC);

//        System.out.println("makeupProducts"+makeupProducts);

        return "sun/product-makeup";
    }

    @GetMapping("/men")
    public String men(Model model) throws Exception {
        List<ProductDto> menProducts = productService.getMenProducts();
        List<ProductDCDto> Products_DC = productService.Products_DC();

        model.addAttribute("menProducts", menProducts);
        model.addAttribute("Products_DC", Products_DC);


        return "sun/product-men";
    }
    @GetMapping("/hair-body")
    public String hairBody(Model model) throws Exception {
        List<ProductDto> hairBodyProducts = productService.getHairBodyProducts();
        List<ProductDCDto> Products_DC = productService.Products_DC();

        model.addAttribute("hairBodyProducts", hairBodyProducts);
        model.addAttribute("Products_DC", Products_DC);

//        System.out.println("hairBodyProducts"+hairBodyProducts);

        return "sun/product-hair-body";
    }

    @GetMapping("/{id}")
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








//      이거 상품목록 간략하게 만들기 보류
//    @GetMapping("/{category}")
//    public String productList(@PathVariable("category") String category, Model model) throws Exception {
//        List<ProductDto> productList = productService.getProductList(category);
//        List<ProductDCDto> Products_DC = productService.Products_DC();
//
//        model.addAttribute("category", category);
//        model.addAttribute("productList", productList);
//        model.addAttribute("Products_DC", Products_DC);
//
//        return "product-list";
//    }

}
