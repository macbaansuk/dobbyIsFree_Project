package com.dobby.project.hwa.orderList;


import com.dobby.project.hwa.order.OrdDto;

import java.util.List;

public interface OrderListDao {


    public List<OrdDto> selectOrderInfo(String mbrId);
}
