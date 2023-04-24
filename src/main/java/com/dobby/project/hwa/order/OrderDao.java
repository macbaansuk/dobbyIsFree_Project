package com.dobby.project.hwa.order;


import com.dobby.project.hwa.cart.CartDto;

import java.util.List;

public interface OrderDao {

    public List<CartDto> selectCartOrder(List<Integer> cartIdList);

    public MbrDto selectMbrIdInfo(String mbrId);


}
