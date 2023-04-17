package com.dobby.project.sun.dao;

import com.dobby.project.soo.NoticeDto;
import com.dobby.project.sun.domain.ProductCateDto;
import com.dobby.project.sun.domain.ProductDCDto;
import com.dobby.project.sun.domain.ProductDto;

import java.util.List;
import java.util.Map;

public interface ProductDao {

    List<ProductDto> getMainProducts();
    List<ProductDCDto> Products_DC()throws Exception;

    ProductDto getProductById(int id) throws Exception;

    List<ProductCateDto> highPrice();
    List<ProductCateDto> lowPrice();
    List<ProductCateDto> latest();

    int countProducts(int category);

    List<ProductCateDto> getProductList(int category) throws Exception;


    //페이징
    List<ProductCateDto> selectPage(Map map) throws Exception;
    // 게시물 전체 개수
    int count() throws Exception;


}
