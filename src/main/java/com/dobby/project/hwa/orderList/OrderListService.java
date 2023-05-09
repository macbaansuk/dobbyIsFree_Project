package com.dobby.project.hwa.orderList;

import com.dobby.project.hwa.order.*;

import java.util.List;


public interface OrderListService {


    public List<OrdDto> getOrdInfo(String mbrId); // 주문내역(간단) 가져오기

    public List<OrdProdDto> getProdNm(String ordId); //상품명 불러오기 주문번호로

    public List<ProdCntDto> getProdCnt(String mbrId, String ordId);
}
