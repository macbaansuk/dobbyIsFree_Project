package com.dobby.project.hwa.cart;

import java.util.Date;

public class CartDto {

    private Integer CART_ID;
    private String PROD_ID;
    private String MBR_ID;
    private Integer PROD_INDV_QTY;
    private Date CART_INPUT_DT;


    public CartDto(){}

    public CartDto(Integer CART_ID, String PROD_ID, String MBR_ID, Integer PROD_INDV_QTY, Date CART_INPUT_DT) {
        this.CART_ID = CART_ID;
        this.PROD_ID = PROD_ID;
        this.MBR_ID = MBR_ID;
        this.PROD_INDV_QTY = PROD_INDV_QTY;
        this.CART_INPUT_DT = CART_INPUT_DT;
    }


    @Override
    public String toString() {
        return "CartDto{" +
                "CART_ID=" + CART_ID +
                ", PROD_ID='" + PROD_ID + '\'' +
                ", MBR_ID='" + MBR_ID + '\'' +
                ", PROD_INDV_QTY=" + PROD_INDV_QTY +
                ", CART_INPUT_DT=" + CART_INPUT_DT +
                '}';
    }

    public Integer getCART_ID() {
        return CART_ID;
    }

    public void setCART_ID(Integer CART_ID) {
        this.CART_ID = CART_ID;
    }

    public String getPROD_ID() {
        return PROD_ID;
    }

    public void setPROD_ID(String PROD_ID) {
        this.PROD_ID = PROD_ID;
    }

    public String getMBR_ID() {
        return MBR_ID;
    }

    public void setMBR_ID(String MBR_ID) {
        this.MBR_ID = MBR_ID;
    }

    public Integer getPROD_INDV_QTY() {
        return PROD_INDV_QTY;
    }

    public void setPROD_INDV_QTY(Integer PROD_INDV_QTY) {
        this.PROD_INDV_QTY = PROD_INDV_QTY;
    }

    public Date getCART_INPUT_DT() {
        return CART_INPUT_DT;
    }

    public void setCART_INPUT_DT(Date CART_INPUT_DT) {
        this.CART_INPUT_DT = CART_INPUT_DT;
    }
}
