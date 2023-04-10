package com.dobby.project.sun;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDaoImpl implements ProductDao {
    @Autowired
    private SqlSession sqlSession;
    private static String namespace = "com.dobby.project.ProductMapper";
//    @Override
//    public List<ProductDto> selectAllProducts() {
//        return sqlSession.selectList("selectAllProducts");
//    }


    @Override
    public List<ProductDto> getMainProducts() {
        return sqlSession.selectList("getMainProducts");
    }

    @Override
    public List<ProductDCDto> Products_DC() throws Exception {
        return sqlSession.selectList("Products_DC");
    }

    @Override
    public List<ProductDto> getSkincareProducts() {
        return sqlSession.selectList("getSkincareProducts");
    }

    @Override
    public List<ProductDto> getMakeupProducts() {
        return sqlSession.selectList("getMakeupProducts");
    }

    @Override
    public List<ProductDto> getMenProducts() {
        return sqlSession.selectList("getMenProducts");
    }

    @Override
    public List<ProductDto> getHairBodyProducts() {
        return sqlSession.selectList("getHairBodyProducts");
    }


}

