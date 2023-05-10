package com.dobby.project.hwa.order;


import com.dobby.project.hwa.cart.CartDto;
import com.dobby.project.hwa.cart.CartProdDto;

import java.util.List;

public interface OrderDao {

    public List<CartDto> selectCartOrder(List<Integer> cartIdList);  // 안씀

    public MbrDto selectMbrIdInfo(String mbrId); // 주문하는 회원 정보 가져오기


    public List<DlvDto> selectAddressByMbrId(String mbrId); //회원의 배송지 목록 불러오기

    public DlvDto selectAddressByDlvId(Integer dlvNmId); // 배송지 ID로 해당 배송지 정보 가져오기

    public int insertOrdInfo(OrdDto ordDto); // 주문 정보 저장

    public int insertOrderProd(OrdProdDto ordProdDto);  // 주문 상품 정보 저장

    public int insertDlvLog(DlvpnLogDto dPDto); // 배송지목록 신규입력 저장

    public int updateDlvDefault(String mbrId, Integer dlvpnId); // 기본배송지로 등록

    public void deleteCart(List<Integer> delCartIds); // 주문 후 장바구니 삭제

    public int insertPoint(PointDto pd); //적립금

    public List<CartProdDto> selectProdInfo(int productId); // 상품정보 가져오기

}
