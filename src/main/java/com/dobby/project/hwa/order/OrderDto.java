package com.dobby.project.hwa.order;


import java.util.List;

public class OrderDto {
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
