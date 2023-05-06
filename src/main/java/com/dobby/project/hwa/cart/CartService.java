package com.dobby.project.hwa.cart;

import java.util.List;

public interface CartService {

    public int insertCart(Integer proKey, String userKey);

    public List<CartProdDto> getCartItemByUserKey(String userKey);




    public void deleteCart(List<Integer> cartIdList);

    public  CartProdDto  updateCartQty(Integer cartId, Integer quantity);

s
}
