package com.dobby.project.order.dao;

import com.dobby.project.cart.dto.CartDto;
import com.dobby.project.cart.dto.CartProdDto;
import com.dobby.project.order.dto.OrdProdDto;
import com.dobby.project.order.dto.PointDto;
import com.dobby.project.order.dto.DlvDto;
import com.dobby.project.order.dto.DlvpnLogDto;
import com.dobby.project.order.dto.MbrDto;
import com.dobby.project.order.dto.OrdDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class OrderDaoImpl implements OrderDao {

    @Autowired
    private SqlSession session;

    private static String namespace = "com.dobby.project.order.dao.OrderDao.";

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

    @Override
    public List<CartProdDto> selectProdInfo(int productId) {
        return session.selectList(namespace+"selectProdInfo",productId);
    }


}
