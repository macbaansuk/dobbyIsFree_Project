package com.dobby.project.sun.service;

import com.dobby.project.sun.domain.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ProductService {


    //상품 메인 페이지
    List<ProductDto> getMainProducts();

    //상품 할인만
    List<ProductDCDto> Products_DC() throws Exception;

    List<SortDto> Cate_Products_DC() throws Exception;

    //상품상세로 상품 아이디로 넘기기
    ProductDto getProductById(int id) throws Exception;
    ProductFileDto getDetailImage(int id);

    ///해당 카테고리의 상품 목록 불러오기
    List<ProductCateDto> getProductList(int category) throws Exception;

    //상품 목록에서 상품 개수 세기
    int countProducts(int category);


    //페이징
    List<ProductCateDto> getPage(Map map) throws Exception;

    // 게시물 전체 개수
    int getCount() throws Exception;

    // 상품 카테로리 페이지 정렬버튼
    List<SortDto> getProductsByCategoryAndSort(int category, String sort);


    //관리자 페이지 상품 읽기
    TotalDto getAdminProductsById(Integer id) throws Exception;

    //관리자 상품 삭제
    int remove(Integer id) throws Exception;

    //이미지 주소 스트링으로
    String getImgPath(Integer id);
    String getDetailImgPath(Integer id);

    //관리자 상품 등록
//    int register(RegisterDto registerDto);
    int register(TotalDto totalDto);


    // 관리자 상품 수정
//    int modify(ProductDto productDto, ProductFileDto productFileDto);
    int modify(TotalDto totalDto);
}