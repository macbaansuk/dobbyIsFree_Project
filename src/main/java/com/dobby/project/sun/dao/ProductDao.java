package com.dobby.project.sun.dao;

import com.dobby.project.sun.domain.*;

import java.util.List;
import java.util.Map;

public interface ProductDao {

    //메인화면 진열
    List<ProductDto> getMainProducts();

    //상품 할인만
    List<ProductDCDto> Products_DC()throws Exception;
    List<SortDto> Cate_Products_DC()throws Exception;

    //상품상세로 상품 아이디로 넘기기
    ProductDto getProductById(int id) throws Exception;

    //상품 목록에서 상품 개수 세기
    int countProducts(Integer CATE_CD);

    ///해당 카테고리의 상품 목록 불러오기
    List<ProductCateDto> getProductList(Integer CATE_CD) throws Exception;


    //페이징
    List<ProductCateDto> selectPage(Map map) throws Exception;
    // 게시물 전체 개수
    int count() throws Exception;
    //상품 목록 정렬버튼
//    List<ProductDCDto> getProductsByCategoryAndSort(int category, String sort);
    List<SortDto> getProductsByCategoryAndSort(int category, String sort);


    //관리자 상품 읽어오기
    TotalDto getAdminProductsById(Integer id);

    //관리자 상품 삭제
    int deleteProductOpt(Integer id);
    int deleteProductDc(Integer id);
    int deleteFile(Integer id);
    int deleteProductFinal(Integer id);
    int deleteProductHashtag(Integer id);



//    void insertProduct(ProductDto productDto);
    void insertProduct(RegisterDto registerDto);
    void insertDiscount(RegisterDto registerDto);
    void insertFile(RegisterDto registerDto);

    void updateProduct(RegisterDto registerDto);


//    void insertHashtag(ProductHashtagDto productHashtagDto);
//    void insertFile(ProductFileDto productFileDto);
//    void insertFile(ProductFileDto productFileDto);
//    void insertOption(ProductOptionDto productOptionDto);
}
