package com.dobby.project.hwa.order;


import java.util.List;

public class OrderDto { //장바구니에서 넘긴 상품 LIST
    List<Integer> cartIdList;

    public List<Integer> getCartIdList() {
        return cartIdList;
    }

    public void setCartIdList(List<Integer> cartIdList) {

        this.cartIdList = cartIdList;
    }

    public OrderDto() {}

    public OrderDto(List<Integer> cartIdList) {
        this.cartIdList = cartIdList;
    }
}
