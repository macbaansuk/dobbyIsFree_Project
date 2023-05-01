package com.dobby.project.hwa.order;

import com.dobby.project.hwa.cart.CartDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDaoImpl implements  OrderDao {

    @Autowired
    private SqlSession session;

    private static String namespace = "com.dobby.project.hwa.order.OrderDao.";

    @Override
    public List<CartDto> selectCartOrder(List<Integer> cartIdList) {
        return session.selectList(namespace + "selectCartOrder", cartIdList);
    }

    @Override
    public MbrDto selectMbrIdInfo(String mbrId) {

        return session.selectOne(namespace + "selectMbrIdInfo", mbrId);
    }

    @Override
    public List<DlvDto> selectAddressByMbrId(String mbrId) {
        return session.selectList(namespace + "selectAddressByMbrId", mbrId);
    }

    @Override
    public DlvDto selectAddressByDlvId(Integer dlvNmId) {
        return session.selectOne(namespace + "selectAddressByDlvId", dlvNmId);
    }


}
