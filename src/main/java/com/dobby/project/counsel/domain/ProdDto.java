package com.dobby.project.counsel.domain;

public class ProdDto {
    Integer PROD_ID;
    String PROD_NM;

    public ProdDto(){}
    public ProdDto(Integer PROD_ID, String PROD_NM) {
        this.PROD_ID = PROD_ID;
        this.PROD_NM = PROD_NM;
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

    @Override
    public String toString() {
        return "ProdDto{" +
                "PROD_ID=" + PROD_ID +
                ", PROD_NM='" + PROD_NM + '\'' +
                '}';
    }
}
