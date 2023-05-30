package com.dobby.project.orderList.dao;

import com.dobby.project.order.dto.OrdDto;
import com.dobby.project.order.dto.OrdProdDto;
import com.dobby.project.orderList.dto.OrdProdInfoDto;
import com.dobby.project.orderList.dto.ProdCntDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class OrderListDaoImpl implements OrderListDao {

    @Autowired
    private SqlSession session;

    private static String namespace = "com.dobby.project.order.OrderListDao.";


    @Override
    public List<OrdDto> selectOrderInfo(String mbrId) {
        return session.selectList(namespace + "selectOrderInfo",mbrId);
    }

    @Override
    public List<OrdProdDto> selectProdNm(String ordId) {
        return session.selectList(namespace + "selectProdNm",ordId);
    }

    @Override
    public List<ProdCntDto> selectProdCnt(String mbrId, String ordId) {

        Map<String, Object> map = new HashMap<>();
        map.put("MBR_ID", mbrId);
        map.put("ORD_ID", ordId);

        return session.selectList(namespace + "selectProdCnt",map);
    }

    @Override
    public OrdDto selectOrderDetailList(String orderId) {
        return session.selectOne(namespace + "selectOrderDetailList",orderId);
    }

    @Override
    public List<OrdProdInfoDto> selectOrdProdInfo(String orderId) {
        return session.selectList(namespace + "selectOrdProdInfo",orderId);
    }




}
