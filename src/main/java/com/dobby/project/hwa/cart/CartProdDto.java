package com.dobby.project.hwa.cart;

public class CartProdDto {
    private Integer CART_ID;
    private String MBR_ID;
    private String PROD_NO;
    private String PROD_NM;
    private Integer AMT;
    private Integer PROD_INDV_QTY;

    public CartProdDto(){}

    public CartProdDto(Integer CART_ID, String MBR_ID, String PROD_NO, String PROD_NM, Integer AMT, Integer PROD_INDV_QTY) {
        this.CART_ID = CART_ID;
        this.MBR_ID = MBR_ID;
        this.PROD_NO = PROD_NO;
        this.PROD_NM = PROD_NM;
        this.AMT = AMT;
        this.PROD_INDV_QTY = PROD_INDV_QTY;
    }

    @Override
    public String toString() {
        return "CartProdDto{" +
                "CART_ID=" + CART_ID +
                ", MBR_ID='" + MBR_ID + '\'' +
                ", PROD_NO='" + PROD_NO + '\'' +
                ", PROD_NM='" + PROD_NM + '\'' +
                ", AMT=" + AMT +
                ", PROD_INDV_QTY=" + PROD_INDV_QTY +
                '}';
    }


    public Integer getCART_ID() {
        return CART_ID;
    }

    public void setCART_ID(Integer CART_ID) {
        this.CART_ID = CART_ID;
    }

    public String getMBR_ID() {
        return MBR_ID;
    }

    public void setMBR_ID(String MBR_ID) {
        this.MBR_ID = MBR_ID;
    }

    public String getPROD_NO() {
        return PROD_NO;
    }

    public void setPROD_NO(String PROD_NO) {
        this.PROD_NO = PROD_NO;
    }

    public String getPROD_NM() {
        return PROD_NM;
    }

    public void setPROD_NM(String PROD_NM) {
        this.PROD_NM = PROD_NM;
    }

    public Integer getAMT() {
        return AMT;
    }

    public void setAMT(Integer AMT) {
        this.AMT = AMT;
    }

    public Integer getPROD_INDV_QTY() {
        return PROD_INDV_QTY;
    }

    public void setPROD_INDV_QTY(Integer PROD_INDV_QTY) {
        this.PROD_INDV_QTY = PROD_INDV_QTY;
    }
}
