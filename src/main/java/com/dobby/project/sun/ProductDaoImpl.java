package com.dobby.project.sun;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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
    public List<ProductDto> getSkincareProducts() {
        return session.selectList("getSkincareProducts");
    }

    @Override
    public List<ProductDto> getMakeupProducts() {
        return session.selectList("getMakeupProducts");
    }

    @Override
    public List<ProductDto> getMenProducts() {
        return session.selectList("getMenProducts");
    }

    @Override
    public List<ProductDto> getHairBodyProducts() {
        return session.selectList("getHairBodyProducts");
    }

    @Override
    public ProductDto getProductById(int id) throws Exception {
        return session.selectOne(namespace + "getProductById", id);
    }



//    public int countProducts() {
//        return session.selectOne("countProducts");
//    }

//    @Override
//    public List<ProductDto> getProductList() {
//        return session.selectOne("getProductList");
//    }
}

