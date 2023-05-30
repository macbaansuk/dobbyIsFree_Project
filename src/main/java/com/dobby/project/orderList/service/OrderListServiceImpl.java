package com.dobby.project.orderList.service;

//import com.dobby.project.hwa.order.*;
import com.dobby.project.order.dto.OrdDto;
import com.dobby.project.order.dto.OrdProdDto;
import com.dobby.project.orderList.dto.OrdProdInfoDto;
import com.dobby.project.orderList.dto.ProdCntDto;
import com.dobby.project.orderList.dao.OrderListDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderListServiceImpl implements OrderListService {
    @Autowired
    OrderListDao orderListDao;


    @Override
    public List<OrdDto>  getOrdInfo(String mbrId) {

        return orderListDao.selectOrderInfo(mbrId);
    }

    @Override
    public List<OrdProdDto> getProdNm(String ordId) {
        return orderListDao.selectProdNm(ordId);
    }

    @Override
    public List<ProdCntDto> getProdCnt(String mbrId, String ordId) {
        return orderListDao.selectProdCnt(mbrId,ordId);
    }

    @Override
    public OrdDto getOrdDetailList(String orderId) {
        return orderListDao.selectOrderDetailList(orderId);
    }

    @Override
    public List<OrdProdInfoDto> getOrdProdInfo(String orderId) {
        return orderListDao.selectOrdProdInfo(orderId);
    }


}
