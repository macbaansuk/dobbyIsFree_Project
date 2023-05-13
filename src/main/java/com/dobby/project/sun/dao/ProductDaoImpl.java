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
    public List<SortDto> Cate_Products_DC() throws Exception {
        return session.selectList("Cate_Products_DC");
    }

    @Override
    public ProductDto getProductById(int id) throws Exception {
        return session.selectOne(namespace + "getProductById", id);
    }

    @Override
    public ProductFileDto getDetailImage(int id) {
        return session.selectOne("getDetailImage", id);
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

    @Override
    public List<SortDto> getProductsByCategoryAndSort(int category, String sort){
        Map<String, Object> map = new HashMap<>();
        map.put("category", category);
        map.put("sort", sort);
        return session.selectList("getProductsByCategoryAndSort", map);
    }

    @Override
    public TotalDto getAdminProductsById(Integer id) {
        return session.selectOne("getAdminProductsById", id);
    }

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


// 상품 등록
//    @Override
//    public int insertProduct(RegisterDto registerDto) {
//        return session.insert("insertProduct", registerDto);
//    }
//
//    @Override
//    public int insertDetailFile(RegisterDto registerDto) {
//        return session.insert("insertDetailFile",registerDto);
//    }
   @Override
    public int insertProduct(TotalDto totalDto) {
        return session.insert("insertProduct",  totalDto);
    }

    @Override
    public int insertDetailFile(TotalDto totalDto) {
        return session.insert("insertDetailFile", totalDto);
    }



    //    @Override
//    public void insertDiscount(RegisterDto registerDto) {
//        session.insert("insertDiscount",registerDto);

//    }

    //상품 수정
//    @Override
//    public int updateProduct(ProductDto productDto) {
//        return session.update("updateProduct",productDto);
//    }
//
//    @Override
//    public int updateDetailFile(ProductFileDto productFileDto) {
//        return session.update("updateDetailFile", productFileDto);
//    }

    @Override
    public int updateProduct(TotalDto totalDto) {
        return session.update("updateProduct",totalDto);
    }

    @Override
    public int updateDetailFile(TotalDto totalDto) {
        return session.update("updateDetailFile", totalDto);
    }


    @Override
    public String getImgPath(Integer id)  {
        return session.selectOne("getImgPath", id);
    }

    @Override
    public String getDetailImgPath(Integer id) {
        return session.selectOne("getDetailImgPath", id);
    }

    //    @Override
//    public void insertOption(ProductOptionDto productOptionDto) {
//        session.insert("insertOption", productOptionDto);

//    }


//    @Override
//    public void insertHashtag(ProductHashtagDto productHashtagDto) {
//             session.insert("insertHashtag", productHashtagDto);
//
//    }
//    @Override
//    public void insertFile(ProductFileDto productFileDto) {
//        session.insert("insertFile", productFileDto);
//    }


}

