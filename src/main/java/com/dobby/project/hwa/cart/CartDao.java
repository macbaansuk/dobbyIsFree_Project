package com.dobby.project.hwa.cart;

import java.util.List;

public interface CartDao {

    public void insertCart(CartDto cartDto);

    public CartDto selectCartByProdIdAndMbrId(CartDto cartDto);


   public void updateCart(CartDto cartDto);

    List<CartProdDto> selectCartItemsByUserKey(String userKey);
//    List<Map<String,Object>> selectCartItemsByUserKey(String userKey);




    public void deleteCart(List<Integer> cartIdList);
}
