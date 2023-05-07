package com.dobby.project.hwa.order;

import com.dobby.project.hwa.cart.CartDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public int insertOrdInfo(OrdDto ordDto) {
        return session.insert(namespace + "insertOrdInfo", ordDto);
    }



    @Override
    public int insertOrderProd(OrdProdDto ordProdDto) {
        return session.insert(namespace + "insertOrderProd",ordProdDto);
    }

    @Override
    public int insertDlvLog(DlvpnLogDto dPDto) {
        return session.insert(namespace + "insertDlvLog",dPDto);
    }

    @Override
    public int updateDlvDefault(String mbrId, Integer dlvpnId) {
        Map<String, Object> map = new HashMap<>();
        map.put("MBR_ID", mbrId);
        map.put("DLVPN_ID", dlvpnId);

        return session.update(namespace + "updateDlvDefault",map);
    }

    @Override
    public void deleteCart(List<Integer> delCartIds) {
        Map<String, Object> map = new HashMap<>();
        map.put("delCartIds", delCartIds);
        session.delete(namespace + "deleteCart", map);
    }

    @Override
    public int insertPoint(PointDto pd) {
        return session.insert(namespace + "insertPoint",pd);
    }
}
