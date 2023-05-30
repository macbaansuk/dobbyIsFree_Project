package com.dobby.project.product.service;

import com.dobby.project.product.dao.ProductDao;
import com.dobby.project.product.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    public void register(TotalDto totalDto) {

        productDao.insertProduct(totalDto);


        if ("Y".equals(totalDto.getDC_YN())) {
            productDao.insertDiscount(totalDto);
        }
        productDao.insertDetailFile(totalDto);
    }


    @Override
    public void modify(TotalDto totalDto) {
       productDao.updateProduct(totalDto);
        System.out.println("totalDto.getDC_YN = " + totalDto.getDC_YN());

        if ("Y".equals(totalDto.getDC_YN())) {
            productDao.updateDiscount(totalDto);
        }
    }




}


