package com.dobby.project.hwa.order;


import com.dobby.project.hwa.cart.CartDto;
import com.dobby.project.hwa.cart.CartProdDto;

import java.util.List;

public interface OrderDao {

    public List<CartDto> selectCartOrder(List<Integer> cartIdList);

    public MbrDto selectMbrIdInfo(String mbrId);


    public List<DlvDto> selectAddressByMbrId(String mbrId);

    public DlvDto selectAddressByDlvId(Integer dlvNmId);
    public int insertOrdInfo(OrdDto ordDto);


    public int insertOrderProd(OrdProdDto ordProdDto);

    public int insertDlvLog(DlvpnLogDto dPDto);

    public int updateDlvDefault(String mbrId, Integer dlvpnId);

    public void deleteCart(List<Integer> delCartIds);

    public int insertPoint(PointDto pd);

    public List<CartProdDto> selectProdInfo(int productId);
}
