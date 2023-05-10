package com.dobby.project.hwa.cart;

public class CartProdDto { //장바구니에 담긴 상품 정보과 JOIN한 결과
    private Integer CART_ID;
    private String MBR_ID;
    private Integer PROD_ID;
    private String PROD_NM;
    private Integer AMT;
    private Integer PROD_INDV_QTY;
    private String REP_IMG;
    private String DC_YN;


    public  CartProdDto () {}
    public CartProdDto(Integer CART_ID, String MBR_ID, Integer PROD_ID, String PROD_NM, Integer AMT, Integer PROD_INDV_QTY, String REP_IMG, String DC_YN) {
        this.CART_ID = CART_ID;
        this.MBR_ID = MBR_ID;
        this.PROD_ID = PROD_ID;
        this.PROD_NM = PROD_NM;
        this.AMT = AMT;
        this.PROD_INDV_QTY = PROD_INDV_QTY;
        this.REP_IMG = REP_IMG;
        this.DC_YN = DC_YN;
    }


    @Override
    public String toString() {
        return "CartProdDto{" +
                "CART_ID=" + CART_ID +
                ", MBR_ID='" + MBR_ID + '\'' +
                ", PROD_ID=" + PROD_ID +
                ", PROD_NM='" + PROD_NM + '\'' +
                ", AMT=" + AMT +
                ", PROD_INDV_QTY=" + PROD_INDV_QTY +
                ", REP_IMG='" + REP_IMG + '\'' +
                ", DC_YN='" + DC_YN + '\'' +
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

    public Integer getPROD_ID() {
        return PROD_ID;
    }

    public void setPROD_ID(Integer PROD_ID) {
        this.PROD_ID = PROD_ID;
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

    public String getREP_IMG() {
        return REP_IMG;
    }

    public void setREP_IMG(String REP_IMG) {
        this.REP_IMG = REP_IMG;
    }

    public String getDC_YN() {
        return DC_YN;
    }

    public void setDC_YN(String DC_YN) {
        this.DC_YN = DC_YN;
    }
}
