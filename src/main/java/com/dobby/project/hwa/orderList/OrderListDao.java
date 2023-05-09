package com.dobby.project.hwa.orderList;


import com.dobby.project.hwa.order.OrdDto;
import com.dobby.project.hwa.order.OrdProdDto;

import java.util.List;

public interface OrderListDao {


    public List<OrdDto> selectOrderInfo(String mbrId);

    public List<OrdProdDto> selectProdNm(String ordId);

    public List<ProdCntDto> selectProdCnt(String mbrId, String ordId);
}
