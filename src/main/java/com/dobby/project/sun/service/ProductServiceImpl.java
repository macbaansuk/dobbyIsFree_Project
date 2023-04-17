package com.dobby.project.sun.service;

import com.dobby.project.sun.dao.ProductDao;
import com.dobby.project.sun.domain.ProductCateDto;
import com.dobby.project.sun.domain.ProductDCDto;
import com.dobby.project.sun.domain.ProductDto;
import com.dobby.project.sun.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public ProductDto getProductById(int id) throws Exception {
        return productDao.getProductById(id);
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
    public List<ProductCateDto> highPrice() {
        return productDao.highPrice();
    }

    @Override
    public List<ProductCateDto> lowPrice() {
        return productDao.lowPrice();
    }

    @Override
    public List<ProductCateDto> latest() {
        return productDao.latest();
    }





}
