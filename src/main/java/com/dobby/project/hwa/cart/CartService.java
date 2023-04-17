package com.dobby.project.hwa.cart;

import java.util.List;

public interface CartService {

    public int insertCart(Integer proKey, String userKey);

    public List<CartProdDto> getCartItemByUserKey(String userKey);




    public void deleteCart(List<Integer> cartIdList);

//    public  void updateCartQty(Integer cartId, Integer quantity);  //원래 업데이트 카트
    public  CartProdDto  updateCartQty(Integer cartId, Integer quantity);


//    public void updateCartQuantity(String userKey, Integer cartId, Integer quantity);



}
