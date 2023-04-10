package com.dobby.project.hwa.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    CartDao cartDao;

    @Override
    public int insertCart(String proKey, String userKey) {

        CartDto cartDto = new CartDto();
        cartDto.setPROD_NO(proKey);
        cartDto.setMBR_ID(userKey);
        CartDto resultCartDto = cartDao.selectCartByProdIdAndMbrId(cartDto);

        if (resultCartDto == null) {
            cartDto.setPROD_INDV_QTY(1);
            cartDao.insertCart(cartDto);
        } else {
//            // 수량이 하나 더 증가
            int qty = resultCartDto.getPROD_INDV_QTY() + 1;
            cartDto.setPROD_INDV_QTY(qty);
            cartDao.updateCart(cartDto);

        }

        return 1;

    }

    @Override
    public List<CartProdDto> getCartItemByUserKey(String userKey) {
        return cartDao.selectCartItemsByUserKey(userKey);
    }




    @Override
    public void deleteCart(List<Integer> cartIdList) {
        System.out.println("delete service 진입");
        cartDao.deleteCart(cartIdList);
    }


}
