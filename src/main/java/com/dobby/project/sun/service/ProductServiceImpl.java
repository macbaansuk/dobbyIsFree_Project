package com.dobby.project.sun.service;

import com.dobby.project.sun.dao.ProductDao;
import com.dobby.project.sun.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;


    @Override
    public List<ProductDto> getMainProducts() {
        return productDao.getMainProducts();
    }

    @Override
    public List<ProductDCDto> Products_DC() throws Exception {
        return productDao.Products_DC();
    }

    @Override
    public List<SortDto> Cate_Products_DC() throws Exception {
        return productDao.Cate_Products_DC();
    }

    @Override
    public ProductDto getProductById(int id) throws Exception {
        return productDao.getProductById(id);
    }

    @Override
    public ProductFileDto getDetailImage(int id) {
        return productDao.getDetailImage(id);
    }


    @Override
    public List<ProductCateDto> getProductList(int category) throws Exception {
        return productDao.getProductList(category);
    }

    public int countProducts(int category) {
        return productDao.countProducts(category);
    }

    @Override
    public List<ProductCateDto> getPage(Map map) throws Exception {
        return productDao.selectPage(map);
    }

    public int getCount() throws Exception {
        return productDao.count();
    }

    @Override
    public List<SortDto> getProductsByCategoryAndSort(int category, String sort) {
        return productDao.getProductsByCategoryAndSort(category, sort);
    }

    @Override
    public TotalDto getAdminProductsById(Integer id) {
        return productDao.getAdminProductsById(id);
    }




    @Override
    @Transactional
    public int remove(Integer id) throws Exception {
        int rowCnt = 0;
        rowCnt += productDao.deleteProductHashtag(id);
        rowCnt += productDao.deleteProductOpt(id);
        rowCnt += productDao.deleteProductDc(id);
        rowCnt += productDao.deleteFile(id);
        rowCnt += productDao.deleteProductFinal(id);

        return rowCnt;
    }


    @Override
    public String getImgPath(Integer id) {
        return productDao.getImgPath(id);
    }

    @Override
    public String getDetailImgPath(Integer id) {
        return productDao.getDetailImgPath(id);
    }


    @Override
    @Transactional
    public int register(TotalDto totalDto) {
        productDao.insertProduct(totalDto);
        int prod_id = totalDto.getPROD_ID();
        System.out.println("prod_id = " + prod_id);

        totalDto.setPROD_ID(prod_id);
        productDao.insertDetailFile(totalDto);
        return prod_id;
    }

    @Override
    @Transactional
    public int modify(TotalDto totalDto) {
        int result = productDao.updateProduct(totalDto);
        totalDto.setPROD_ID(totalDto.getPROD_ID());
        result += productDao.updateDetailFile(totalDto);

        return result;
    }

//    @Override
//    @Transactional
//    public int modify(ProductDto productDto,ProductFileDto productFileDto) {
//        int prod_id = productDao.updateProduct(productDto);
//        System.out.println("update prod_id = " + prod_id);
//
//        productFileDto.setPROD_ID(prod_id);
//        productDao.updateDetailFile(productFileDto);
//
//        return prod_id;
//    }



}


