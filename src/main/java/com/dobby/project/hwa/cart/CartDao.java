package com.dobby.project.hwa.cart;

import java.util.List;

public interface CartDao {

    public void insertCart(CartDto cartDto); // 장바구니에 insert

    public int insertCartQty(CartDto cartDto); //상세에서 장바구니에 insert
    public CartDto selectCartByProdIdAndMbrId(CartDto cartDto); // 상품id,회원id로 장바구니 조회 (해당 상품이 장바구니에  들어가져있는지 확인)


   public void updateCart(CartDto cartDto); // 장바구니에서 사용자가 수량 수정 반영

    List<CartProdDto> selectCartItemsByUserKey(String userKey); // 장바구니 조회


    public void deleteCart(List<Integer> cartIdList); // 장바구니 삭제

    public CartProdDto  updateCartQty(int cartId, int quantity); // 상품상세에서

    public CartProdDto getCartProductById(int cartId); //카트 ID에 해당하는 장바구니 상품 조회 (상품TB과 조인)


    public void updateCartQtyProdPage(CartDto cartDto); //상세에서 장바구니 담을 때 수량 반영
}
