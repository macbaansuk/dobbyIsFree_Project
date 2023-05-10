package com.dobby.project.sun.domain;

public class ProductOptionDto {

    private Integer OPT_PROD_ID;
    private Integer PROD_ID;
    private Integer OPT_ID;
    private String OPT_QTY;
    private String OPT_NM;
    private String OPT_VAL;


    public ProductOptionDto() {
    }

    public ProductOptionDto(Integer OPT_PROD_ID, Integer PROD_ID, Integer OPT_ID, String OPT_QTY, String OPT_NM, String OPT_VAL) {
        this.OPT_PROD_ID = OPT_PROD_ID;
        this.PROD_ID = PROD_ID;
        this.OPT_ID = OPT_ID;
        this.OPT_QTY = OPT_QTY;
        this.OPT_NM = OPT_NM;
        this.OPT_VAL = OPT_VAL;
    }

    public Integer getOPT_PROD_ID() {
        return OPT_PROD_ID;
    }

    public void setOPT_PROD_ID(Integer OPT_PROD_ID) {
        this.OPT_PROD_ID = OPT_PROD_ID;
    }

    public Integer getPROD_ID() {
        return PROD_ID;
    }

    public void setPROD_ID(Integer PROD_ID) {
        this.PROD_ID = PROD_ID;
    }

    public Integer getOPT_ID() {
        return OPT_ID;
    }

    public void setOPT_ID(Integer OPT_ID) {
        this.OPT_ID = OPT_ID;
    }

    public String getOPT_QTY() {
        return OPT_QTY;
    }

    public void setOPT_QTY(String OPT_QTY) {
        this.OPT_QTY = OPT_QTY;
    }

    public String getOPT_NM() {
        return OPT_NM;
    }

    public void setOPT_NM(String OPT_NM) {
        this.OPT_NM = OPT_NM;
    }

    public String getOPT_VAL() {
        return OPT_VAL;
    }

    public void setOPT_VAL(String OPT_VAL) {
        this.OPT_VAL = OPT_VAL;
    }

    @Override
    public String toString() {
        return "ProductOptionDto{" +
                "OPT_PROD_ID=" + OPT_PROD_ID +
                ", PROD_ID=" + PROD_ID +
                ", OPT_ID=" + OPT_ID +
                ", OPT_QTY='" + OPT_QTY + '\'' +
                ", OPT_NM='" + OPT_NM + '\'' +
                ", OPT_VAL='" + OPT_VAL + '\'' +
                '}';
    }
}
