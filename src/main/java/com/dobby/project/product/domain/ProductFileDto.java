package com.dobby.project.product.domain;

import java.util.Date;

public class ProductFileDto {

        private Integer PROD_FILE_ID;
        private Integer PROD_ID;
        private String FILE_PATH;
        private String KIND;
        private Date REG_DTM;
        private Date UPD_DTM;



    public Integer getPROD_FILE_ID() {
        return PROD_FILE_ID;
    }

    public void setPROD_FILE_ID(Integer PROD_FILE_ID) {
        this.PROD_FILE_ID = PROD_FILE_ID;
    }

    public Integer getPROD_ID() {
        return PROD_ID;
    }

    public void setPROD_ID(Integer PROD_ID) {
        this.PROD_ID = PROD_ID;
    }


    public String getFILE_PATH() {
        return FILE_PATH;
    }

    public void setFILE_PATH(String FILE_PATH) {
        this.FILE_PATH = FILE_PATH;
    }

    public String getKIND() {
        return KIND;
    }

    public void setKIND(String KIND) {
        this.KIND = KIND;
    }

    public Date getREG_DTM() {
        return REG_DTM;
    }

    public void setREG_DTM(Date REG_DTM) {
        this.REG_DTM = REG_DTM;
    }

    public Date getUPD_DTM() {
        return UPD_DTM;
    }

    public void setUPD_DTM(Date UPD_DTM) {
        this.UPD_DTM = UPD_DTM;
    }

    @Override
    public String toString() {
        return "ProductFileDto{" +
                "PROD_FILE_ID=" + PROD_FILE_ID +
                ", PROD_ID=" + PROD_ID +
                ", FILE_PATH='" + FILE_PATH + '\'' +
                ", KIND='" + KIND + '\'' +
                ", REG_DTM=" + REG_DTM +
                ", UPD_DTM=" + UPD_DTM +
                '}';
    }
}
