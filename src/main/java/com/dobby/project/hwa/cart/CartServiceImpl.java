package com.dobby.project.hwa.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    CartDao cartDao;



    @Override
    public int insertCart(Integer proKey, String userKey) {

        CartDto cartDto = new CartDto();
        cartDto.setPROD_ID(proKey);
        cartDto.setMBR_ID(userKey);
        CartDto resultCartDto = cartDao.selectCartByProdIdAndMbrId(cartDto);

        if (resultCartDto == null) {
            cartDto.setPROD_INDV_QTY(1);
            cartDao.insertCart(cartDto);
        } else {
//            // 수량이 하나 더 증가
//            int qty = resultCartDto.getPROD_INDV_QTY() + 1;
//            cartDto.setPROD_INDV_QTY(qty);
//            cartDao.updateCart(cartDto);
//-------------------------------------------------위에 ) 원래 수량이 1개씩 증가하는 코드 but 수량 제한이 없다

            int qty = resultCartDto.getPROD_INDV_QTY();
            if (qty < 10) { //10개까지만 담을 수 있다
                qty++;
                cartDto.setPROD_INDV_QTY(qty);
                cartDao.updateCart(cartDto);
            }
        }

        return 1;

    }




    @Override
    public List<CartProdDto> getCartItemByUserKey(String userKey) {
        return cartDao.selectCartItemsByUserKey(userKey);
    }


    @Override
    public void deleteCart(List<Integer> cartIdList) {
//        System.out.println("delete service 진입");
        cartDao.deleteCart(cartIdList);
    }


    @Override
    public CartProdDto updateCartQty(Integer cartId, Integer quantity) {
//        CartDto cartDto = new CartDto();
//        cartDto.setCART_ID(cartId);
//        cartDto.setPROD_INDV_QTY(quantity);

        return cartDao.updateCartQty(cartId,quantity);
    }




}
