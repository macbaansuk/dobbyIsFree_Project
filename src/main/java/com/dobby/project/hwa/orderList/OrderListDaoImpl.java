package com.dobby.project.hwa.orderList;

import com.dobby.project.hwa.order.OrdDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderListDaoImpl implements OrderListDao {

    @Autowired
    private SqlSession session;

    private static String namespace = "com.dobby.project.hwa.order.OrderListDao.";


    @Override
    public List<OrdDto> selectOrderInfo(String mbrId) {
        return session.selectList(namespace + "selectOrderInfo",mbrId);
    }
}
