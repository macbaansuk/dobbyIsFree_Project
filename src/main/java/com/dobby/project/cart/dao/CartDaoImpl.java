package com.dobby.project.cart.dao;

import com.dobby.project.cart.dto.CartDto;
import com.dobby.project.cart.dto.CartProdDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CartDaoImpl implements CartDao {

    @Autowired
    private SqlSession session;

    private static String namespace = "com.dobby.project.cart.dao.CartDao.";


    @Override
    public void insertCart(CartDto cartDto) {
        session.insert(namespace + "insert", cartDto);
    }

    @Override
    public CartDto selectCartByProdIdAndMbrId(CartDto cartDto) {
        return session.selectOne(namespace + "selectCart", cartDto);
    }


    @Override
    public void updateCart(CartDto cartDto) {
        session.update(namespace + "update", cartDto);
    }


   @Override
    public List<CartProdDto> selectCartItemsByUserKey(String userKey) {
       return session.selectList(namespace + "selectCartItemsByUserKey", userKey);
    }


    @Override
    public void deleteCart(List<Integer> cartIdList) {
//        System.out.println("delete dao");
        session.delete(namespace + "deleteCart",  cartIdList);
    }

    @Override
    public CartProdDto  updateCartQty(int cartId, int quantity) {

        Map<String, Object> map = new HashMap<>();
        map.put("CART_ID", cartId);
        map.put("PROD_INDV_QTY", quantity);
//        System.out.println("serviceImp카트아이디 : " + cartId);

        session.update(namespace + "updateCartQty", map);


        return getCartProductById(cartId);


    }

    @Override
    public CartProdDto getCartProductById(int cartId) {
        return session.selectOne(namespace+"getCartProductById",cartId);
    }



    @Override
    public int insertCartQty(CartDto cartDto) {
        return session.insert(namespace+"insert",cartDto);
    }

    @Override
    public void updateCartQtyProdPage(CartDto cartDto) {
        session.update(namespace + "update", cartDto);
    }


}
