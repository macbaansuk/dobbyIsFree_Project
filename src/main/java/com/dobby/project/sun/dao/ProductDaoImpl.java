package com.dobby.project.sun.dao;


import com.dobby.project.sun.domain.ProductCateDto;
import com.dobby.project.sun.domain.ProductDCDto;
import com.dobby.project.sun.domain.ProductDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ProductDaoImpl implements ProductDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.dobby.project.ProductMapper.";
//    @Override
//    public List<ProductDto> selectAllProducts() {
//        return sqlSession.selectList("selectAllProducts");
//    }


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
    public List<ProductCateDto> highPrice() {
        return session.selectList("highPrice");
    }

    @Override
    public List<ProductCateDto> lowPrice() {
        return session.selectList("lowPrice");
    }

    @Override
    public List<ProductCateDto> latest() {
        return session.selectList("lateset");
    }

    @Override
    public int countProducts(int category) {
        return session.selectOne("countProducts", category);
    }

    @Override
    public List<ProductCateDto> getProductList(int category) throws Exception {
        return session.selectList("getProductList", category);
    }

    @Override
    public List<ProductCateDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace+"selectPage",map);
    }
    @Override  // 게시물 전체 개수
    public int count() throws Exception {
        return session.selectOne(namespace+"count");
    }

}

