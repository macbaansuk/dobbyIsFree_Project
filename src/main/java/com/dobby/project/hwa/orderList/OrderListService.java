package com.dobby.project.hwa.orderList;

import com.dobby.project.hwa.order.*;

import java.util.List;


public interface OrderListService {


    public List<OrdDto> getOrdInfo(String mbrId); // 주문내역(간단) 가져오기
}
