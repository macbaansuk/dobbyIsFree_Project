package com.dobby.project.sun.service;

import com.dobby.project.sun.dao.ProductDao;
import com.dobby.project.sun.domain.*;
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
//    @Override
//    public List<ProductDCDto> getProductsByCategoryAndSort(int category, String sort) {
//        return productDao.getProductsByCategoryAndSort(category, sort);
//   }
//
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
    public void register(RegisterDto registerDto) {
        productDao.insertProduct(registerDto);
//
//        // 할인 정보 저장
//        if ("Y".equals(registerDto.getDC_YN())) {
//            productDao.insertDiscount(registerDto);
//        }
//
//        // 이미지 파일 정보 저장
//        if (registerDto.getPATH() != null) {
//            productDao.insertFile(registerDto);
//        }
    }

    @Override
    public void modify(RegisterDto registerDto) {
         productDao.updateProduct(registerDto);
    }


//    @Override
////    public int register(ProductDto productDto, ProductDCDto productDCDto, ProductOptionDto productOptionDto, ProductHashtagDto productHashtagDto, ProductFileDto productFileDto) throws Exception {
//    public int register(ProductDto productDto) throws Exception {
////        int rowCnt = 0;
////        rowCnt +=productDao.insertProduct(productDto);
////        rowCnt +=productDao.insertDiscount(productDCDto);
////        rowCnt +=productDao.insertOption(productOptionDto);
////        rowCnt +=productDao.insertHashtag(productHashtagDto);
////        rowCnt +=productDao.insertFile(productFileDto);
////
////        return rowCnt;
////        int productId = productDao.insertProduct(productDto);
////        productDao.insertDiscount(productDCDto);
////        productDao.insertOption(productOptionDto);
////        productDao.insertHashtag(productHashtagDto);
////        productDao.insertFile(productFileDto);
////
////        return productId;
//
//        return productDao.insertProduct(productDto);
//    }


//    @Override
////    @Transactional
////    public void register(ProductDto productDto) throws Exception {
//    public void register(RegisterDto registerDto, MultipartFile repImg, MultipartFile[] detailImgs) throws Exception {
//
////        productDao.insertProduct(productDto);
//        productDao.insertProduct(registerDto);
//        productDao.insertDiscount(registerDto);
//
//        for (MultipartFile detailImg : detailImgs) {
//            RegisterDto file = new RegisterDto();
//            file.setPROD_ID(registerDto.getPROD_ID());
//            file.setFILE_NM(detailImg.getOriginalFilename());
//            file.setPATH("파일경로");
//            file.setKIND("상세");
//            productDao.insertFile(file);
////        productDao.insertOption(productOptionDto);
////        productDao.insertDiscount(registerDto);
////        productDao.insertHashtag(productHashtagDto);
////        productDao.insertFile(productFileDto);
////
////        if ("Y".equals(registerDto.getDC_YN())) {
////            productDao.insertDiscount(registerDto);
////        }
//        }
//    }


    // 이미지가 저장될 경로
//    private String uploadPath = "C:\\Users\\doswp\\Desktop\\pic";
//
//    @Override
//    public void register(RegisterDto registerDto, MultipartFile repImg, MultipartFile[] detailImgs) throws IOException, IOException {
//        // 대표 이미지 파일 저장
//        String repImgFileName = repImg.getOriginalFilename();
//        File repImgFile = new File(uploadPath, repImgFileName);
//        repImg.transferTo(repImgFile);
//
//        registerDto.setREP_IMG(repImgFileName);
//        productDao.insertProduct(registerDto);
//        productDao.insertDiscount(registerDto);
//
//        // 상세 정보 이미지 파일 저장
//        for (MultipartFile detailImg : detailImgs) {
//            String detailImgFileName = detailImg.getOriginalFilename();
//            File detailImgFile = new File(uploadPath, detailImgFileName);
//            detailImg.transferTo(detailImgFile);
//
//            RegisterDto file = new RegisterDto();
//            file.setPROD_ID(registerDto.getPROD_ID());
//            file.setFILE_NM(detailImgFileName);
//            file.setPATH(uploadPath);
//            file.setKIND("상세");
//            productDao.insertFile(file);
//        }
//    }
//


//    private String uploadPath = "C:\\Users\\doswp\\Desktop\\pic";
//
//    @Override
//    public void register(RegisterDto registerDto, MultipartFile imgFile) throws Exception {
//        productDao.insertProduct(registerDto);
//
//        String imageName = imgFile.getOriginalFilename();
//        File imageFile = new File(uploadPath, imageName);
//        imgFile.transferTo(imageFile);
//
//        RegisterDto productImage = new RegisterDto();
//        productImage.setPROD_ID(registerDto.getPROD_ID());
////        productImage.setImageNa(imageName);
//        productDao.insertFile(productImage);
//    }


}


