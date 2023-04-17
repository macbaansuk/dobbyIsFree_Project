package com.dobby.project.sun.controller;

import com.dobby.project.soo.PageHandler;
import com.dobby.project.sun.domain.ProductCateDto;
import com.dobby.project.sun.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {

    @Autowired
    ProductService productService;

    @GetMapping("/list")
    public String adminProductList(@RequestParam(defaultValue ="1") Integer page,  @RequestParam(defaultValue = "10") Integer pageSize, Model model) throws Exception {
//        List<ProductCateDto> getAllProducts = productService.getAllProducts();
//        List<ProductDCDto> Products_DC = productService.Products_DC();
//
//        model.addAttribute("getAllProducts", getAllProducts);
//        model.addAttribute("Products_DC", Products_DC);

        try {

            int totalCnt = productService.getCount();
            model.addAttribute("totalCnt", totalCnt);

            System.out.println("totalCnt = " + totalCnt);

            PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);
            if(page < 0 || page > pageHandler.getTotalPage())
                page = 1;
            if(pageSize < 0 || pageSize > 50)
                pageSize = 10;

            Map map = new HashMap();
            map.put("offset", (page-1)*pageSize);
            map.put("pageSize", pageSize);

           List<ProductCateDto> list = productService.getPage(map);
           model.addAttribute("adminProductList",list);
           model.addAttribute("ph", pageHandler);

            System.out.println("adminProductList="+model);



         } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "sun/admin-product-list";
    }

//    @PostMapping("/remove")
//    public String remove(Integer bno, Integer page, Integer pageSize, RedirectAttributes rattr, HttpSession session) {
//
//        String msg = "DEL_OK";
//
//        try {
//            if(ProductService.remove(bno, writer)!=1)
//                throw new Exception("Delete failed.");
//        } catch (Exception e) {
//            e.printStackTrace();
//            msg = "DEL_ERR";
//        }
//
//        rattr.addAttribute("page", page);
//        rattr.addAttribute("pageSize", pageSize);
//        rattr.addFlashAttribute("msg", msg);
//        return "redirect:/admin/product/list";
//    }








}
