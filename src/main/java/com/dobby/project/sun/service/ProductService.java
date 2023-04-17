package com.dobby.project.sun.service;

import com.dobby.project.sun.domain.ProductCateDto;
import com.dobby.project.sun.domain.ProductDCDto;
import com.dobby.project.sun.domain.ProductDto;

import java.util.List;
import java.util.Map;

public interface ProductService {




    List<ProductDto> getMainProducts();
    List<ProductDCDto> Products_DC() throws Exception;
    ProductDto getProductById(int id) throws Exception;
    List<ProductCateDto> getProductList(int category) throws Exception;
    int countProducts(int category);


    List<ProductCateDto> highPrice();
    List<ProductCateDto> lowPrice();
    List<ProductCateDto> latest();



    //페이징
    List<ProductCateDto> getPage(Map map) throws Exception;
    int getCount() throws Exception;
}
