package com.dobby.project.hwa.cart;

import java.util.List;


public class DeleteDto {
    List<Integer> cartIdList;

    public List<Integer> getCartIdList() {
        return cartIdList;
    }

    public void setCartIdList(List<Integer> cartIdList) {
        this.cartIdList = cartIdList;
    }

    public DeleteDto() {
    }

    public DeleteDto(List<Integer> cartIdList) {
        this.cartIdList = cartIdList;
    }
}
