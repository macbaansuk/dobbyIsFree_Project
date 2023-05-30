package com.dobby.project.orderList.dao;


import com.dobby.project.order.dto.OrdDto;
import com.dobby.project.order.dto.OrdProdDto;
import com.dobby.project.orderList.dto.OrdProdInfoDto;
import com.dobby.project.orderList.dto.ProdCntDto;

import java.util.List;

public interface OrderListDao {


    public List<OrdDto> selectOrderInfo(String mbrId);// 주문내역(간단) 가져오기

    public List<OrdProdDto> selectProdNm(String ordId); //상품명 불러오기 주문번호로

    public List<ProdCntDto> selectProdCnt(String mbrId, String ordId); // 주문id에 해당하는 상품목록 count

    public OrdDto selectOrderDetailList(String orderId);//주문내역 가져오기


    public List<OrdProdInfoDto> selectOrdProdInfo(String orderId); //주문상품 정보 가져오기
}
