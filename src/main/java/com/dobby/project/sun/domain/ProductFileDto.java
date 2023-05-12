package com.dobby.project.sun.domain;

import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

public class ProductFileDto {

        private Integer PROD_FILE_ID;
        private Integer PROD_ID;
        private String FILE_NM;
        private String PATH;
        private String KIND;
        private Date REG_DTM;
        private Date UPD_DTM;

    public ProductFileDto() {
    }

    public ProductFileDto(Integer PROD_FILE_ID, Integer PROD_ID, String FILE_NM, String PATH, String KIND, Date REG_DTM, Date UPD_DTM) {
        this.PROD_FILE_ID = PROD_FILE_ID;
        this.PROD_ID = PROD_ID;
        this.FILE_NM = FILE_NM;
        this.PATH = PATH;
        this.KIND = KIND;
        this.REG_DTM = REG_DTM;
        this.UPD_DTM = UPD_DTM;
    }

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

    public String getFILE_NM() {
        return FILE_NM;
    }

    public void setFILE_NM(String FILE_NM) {
        this.FILE_NM = FILE_NM;
    }

    public String getPATH() {
        return PATH;
    }

    public void setPATH(String PATH) {
        this.PATH = PATH;
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
                ", FILE_NM='" + FILE_NM + '\'' +
                ", PATH='" + PATH + '\'' +
                ", KIND='" + KIND + '\'' +
                ", REG_DTM=" + REG_DTM +
                ", UPD_DTM=" + UPD_DTM +
                '}';
    }
}
