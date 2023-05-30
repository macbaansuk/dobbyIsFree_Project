package com.dobby.project.cart.service;

import com.dobby.project.cart.dto.CartProdDto;

import java.util.List;

public interface CartService {

    public int insertCart(Integer proKey, String userKey); // 장바구니 담기

    public List<CartProdDto> getCartItemByUserKey(String userKey); //회원id로 카트 목록 조회 상품TB와 join해서 조회

    public void deleteCart(List<Integer> cartIdList); // 장바구니 삭제 (카트id로)

    public  CartProdDto  updateCartQty(Integer cartId, Integer quantity); // 장바구니 상품 수량 수정

    public int insertCartQty(Integer key, String mbrId, Integer quantity); //상세에서 장바구니 담기
}
