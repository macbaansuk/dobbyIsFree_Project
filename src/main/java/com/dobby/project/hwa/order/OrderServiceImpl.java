package com.dobby.project.hwa.order;

import com.dobby.project.hwa.cart.CartDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements  OrderService{
    @Autowired
    OrderDao orderDao;

    @Override
    public List<CartDto> selectCartOrder(List<Integer> cartIdList) {
           return orderDao.selectCartOrder(cartIdList);
    }

    @Override
    public MbrDto getMbrInfoById(String mbrId) {
        return orderDao.selectMbrIdInfo(mbrId);
    }

    @Override
    public List<DlvDto> getAddressByMbrId(String mbrId) {
        return orderDao.selectAddressByMbrId(mbrId);
    }

    @Override
    public DlvDto getAddressDlvId(Integer dlvNmId) {
        return orderDao.selectAddressByDlvId(dlvNmId);
    }
    @Override
    public int insertOrdInfo(OrdDto ordDto) {
        return orderDao.insertOrdInfo(ordDto);
    }
}
