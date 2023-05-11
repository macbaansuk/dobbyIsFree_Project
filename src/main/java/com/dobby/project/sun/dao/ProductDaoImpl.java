package com.dobby.project.sun.dao;


import com.dobby.project.sun.domain.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ProductDaoImpl implements ProductDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.dobby.project.ProductMapper.";

    @Override
    public List<ProductDto> getMainProducts() {

        return session.selectList("getMainProducts");
    }

    @Override
    public List<ProductDCDto> Products_DC() throws Exception {
        return session.selectList("Products_DC");
    }

    @Override
    public ProductDto getProductById(int id) throws Exception {
        return session.selectOne(namespace + "getProductById", id);
    }


    @Override
    public int countProducts(Integer CATE_CD) {
        return session.selectOne("countProducts", CATE_CD);
    }

    @Override
    public List<ProductCateDto> getProductList(Integer CATE_CD) throws Exception {
        return session.selectList("getProductList", CATE_CD);
    }

    @Override
    public List<ProductCateDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace + "selectPage", map);
    }

    @Override  // 게시물 전체 개수
    public int count() throws Exception {
        return session.selectOne(namespace + "count");
    }

//    @Override
//    public List<ProductDCDto> getProductsByCategoryAndSort(Integer CATE_CD, String sort) {
//        HashMap<String, Object> params = new HashMap<>();
//        params.put("CATE_CD", CATE_CD);
//        params.put("sort", sort);
//        return session.selectList("getProductsByCategoryAndSort", params);
//    }

//    @Override
//    public List<ProductDCDto> getProductsByCategoryAndSort(Integer CATE_CD, String sort) {
//        HashMap<String, Object> params = new HashMap<>();
//        params.put("category", CATE_CD);
//        params.put("sort", sort);
//        return session.selectList("getProductsByCategoryAndSort", params);
//    }

//    @Override
//    public List<ProductDCDto> getProductsByCategoryAndSort(Map<String, Object> map) {
//        return session.selectList("getProductsByCategoryAndSort", map);
//    }

    @Override
    public List<ProductDCDto> getProductsByCategoryAndSort(Integer category, String sort){
        Map<String, Object> map = new HashMap<>();
        map.put("category", category);
        map.put("sort", sort);
        return session.selectList("getProductsByCategoryAndSort", map);
    }

    @Override
    public TotalDto getAdminProductsById(Integer id) {
        return session.selectOne("getAdminProductsById", id);
    }


    //관리자 상품 삭제
    @Override
    public int deleteProductOpt(Integer id) {
        return session.delete(namespace + "deleteProductOpt", id);
    }

    @Override
    public int deleteProductDc(Integer id) {
        return session.delete(namespace + "deleteProductDc", id);
    }

    @Override
    public int deleteFile(Integer id) {
        return session.delete(namespace + "deleteFile", id);
    }

    @Override
    public int deleteProductFinal(Integer id) {
        return session.delete(namespace + "deleteProductFinal", id);
    }

    @Override
    public int deleteProductHashtag(Integer id) {
        return session.delete(namespace + "deleteProductHashtag", id);
    }


    //    @Override
//    public void insertProduct(ProductDto productDto) {
//        session.insert("insertProduct",productDto);
//    }
//
    @Override
    public void insertProduct(RegisterDto registerDto) {
        session.insert("insertProduct", registerDto);
    }

    @Override
    public void insertDiscount(RegisterDto registerDto) {
        session.insert("insertDiscount",registerDto);
    }

    @Override
    public void insertFile(RegisterDto registerDto) {
        session.insert("insertFile",registerDto);
    }

    @Override
    public void updateProduct(RegisterDto registerDto) {
        session.update("updateProduct",registerDto);
    }


}

