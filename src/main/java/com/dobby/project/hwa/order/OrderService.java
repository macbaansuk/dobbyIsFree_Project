package com.dobby.project.hwa.order;

import com.dobby.project.hwa.cart.CartDto;

import java.util.List;

public interface OrderService {
    public List<CartDto> selectCartOrder (List<Integer> cartIdList);

    public MbrDto getMbrInfoById(String mbrId);

}
