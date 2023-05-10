package com.dobby.project.hwa.orderList;

public class ProdCntDto { //주문id의 상품목록 Count
    private String ORD_ID;
    private int Prod_Cnt;

    public ProdCntDto(){}

    public ProdCntDto(String ORD_ID, int prod_Cnt) {
        this.ORD_ID = ORD_ID;
        Prod_Cnt = prod_Cnt;
    }

    @Override
    public String toString() {
        return "ProdCntDto{" +
                "ORD_ID='" + ORD_ID + '\'' +
                ", Prod_Cnt=" + Prod_Cnt +
                '}';
    }

    public String getORD_ID() {
        return ORD_ID;
    }

    public void setORD_ID(String ORD_ID) {
        this.ORD_ID = ORD_ID;
    }

    public int getProd_Cnt() { // cnt 하나빼기
            return Prod_Cnt;
    }

    public void setProd_Cnt(int prod_Cnt) {
        Prod_Cnt = prod_Cnt;
    }
}
