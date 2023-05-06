package com.dobby.project.hwa.order;

import com.dobby.project.hwa.cart.CartDto;

import java.util.List;

public interface OrderService {
    public List<CartDto> selectCartOrder (List<Integer> cartIdList);

    public MbrDto getMbrInfoById(String mbrId);

    public List<DlvDto> getAddressByMbrId(String mbrId);

    public DlvDto getAddressDlvId(Integer dlvNmId);
    public int insertOrdInfo(OrdDto ordDto);


    public int insertOrderProd(OrdProdDto ordProdDto);

    public int  insertDlvLog(DlvpnLogDto dPDto);

    public int updateDlvDefault(String mbrId, Integer dlvpnId);

    public void deleteCart(List<Integer> delCartIds);
}
