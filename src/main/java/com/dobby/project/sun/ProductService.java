package com.dobby.project.sun;

import java.util.List;

public interface ProductService {
    List<ProductDto> getMainProducts();
    List<ProductDCDto> Products_DC() throws Exception;
    List<ProductDto> getSkincareProducts();
    List<ProductDto> getMakeupProducts();
    List<ProductDto> getMenProducts();
    List<ProductDto> getHairBodyProducts();
    ProductDto getProductById(int id) throws Exception;
    List<ProductDto> getAllProducts();


    List<ProductDto> orderByRegDate();
    List<ProductDto> orderByPriceAsc();
    List<ProductDto> orderByPriceDesc();

    ProductDto getProductList(String category) throws Exception;



//    int countProducts();
//    List<ProductDto> getProductList(String category);
}
