package com.dobby.project.order.dto;

public class PointDto { //적립금 TB
    private Integer PT_ID;
    private String MBR_ID;
    private String PT_STUS;
    private String SETL_DIV;
    private Integer AMT; //적립금
    private String PT_ID_ORGNL; //적립 ID 원본
    private String DEAL_DTM; //거래일시
    private String SETL_ID;
    private String REMN_EXPI_DT; //적립금 만료일시

    public PointDto(){}
    public PointDto(Integer PT_ID, String MBR_ID, String PT_STUS, String SETL_DIV, Integer AMT, String PT_ID_ORGNL,
                    String DEAL_DTM, String SETL_ID, String REMN_EXPI_DT) {
        this.PT_ID = PT_ID;
        this.MBR_ID = MBR_ID;
        this.PT_STUS = PT_STUS;
        this.SETL_DIV = SETL_DIV;
        this.AMT = AMT;
        this.PT_ID_ORGNL = PT_ID_ORGNL;
        this.DEAL_DTM = DEAL_DTM;
        this.SETL_ID = SETL_ID;
        this.REMN_EXPI_DT = REMN_EXPI_DT;
    }

    @Override
    public String toString() {
        return "PoingDto{" +
                "PT_ID=" + PT_ID +
                ", MBR_ID='" + MBR_ID + '\'' +
                ", PT_STUS='" + PT_STUS + '\'' +
                ", SETL_DIV='" + SETL_DIV + '\'' +
                ", AMT=" + AMT +
                ", PT_ID_ORGNL='" + PT_ID_ORGNL + '\'' +
                ", DEAL_DTM='" + DEAL_DTM + '\'' +
                ", SETL_ID='" + SETL_ID + '\'' +
                ", REMN_EXPI_DT='" + REMN_EXPI_DT + '\'' +
                '}';
    }

    public Integer getPT_ID() {
        return PT_ID;
    }

    public void setPT_ID(Integer PT_ID) {
        this.PT_ID = PT_ID;
    }

    public String getMBR_ID() {
        return MBR_ID;
    }

    public void setMBR_ID(String MBR_ID) {
        this.MBR_ID = MBR_ID;
    }

    public String getPT_STUS() {
        return PT_STUS;
    }

    public void setPT_STUS(String PT_STUS) {
        this.PT_STUS = PT_STUS;
    }

    public String getSETL_DIV() {
        return SETL_DIV;
    }

    public void setSETL_DIV(String SETL_DIV) {
        this.SETL_DIV = SETL_DIV;
    }

    public Integer getAMT() {
        return AMT;
    }

    public void setAMT(Integer AMT) {
        this.AMT = AMT;
    }

    public String getPT_ID_ORGNL() {
        return PT_ID_ORGNL;
    }

    public void setPT_ID_ORGNL(String PT_ID_ORGNL) {
        this.PT_ID_ORGNL = PT_ID_ORGNL;
    }

    public String getDEAL_DTM() {
        return DEAL_DTM;
    }

    public void setDEAL_DTM(String DEAL_DTM) {
        this.DEAL_DTM = DEAL_DTM;
    }

    public String getSETL_ID() {
        return SETL_ID;
    }

    public void setSETL_ID(String SETL_ID) {
        this.SETL_ID = SETL_ID;
    }

    public String getREMN_EXPI_DT() {
        return REMN_EXPI_DT;
    }

    public void setREMN_EXPI_DT(String REMN_EXPI_DT) {
        this.REMN_EXPI_DT = REMN_EXPI_DT;
    }
}
