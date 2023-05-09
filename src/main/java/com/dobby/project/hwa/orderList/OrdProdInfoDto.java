package com.dobby.project.hwa.orderList;

public class OrdProdInfoDto {

    private String REP_IMG;
    private String PROD_NM;
    private Integer PROD_INDV_QTY;
    private Integer PROD_AMT;
    private String ORD_STUS_CD;
    private String DC_YN;

    public OrdProdInfoDto(){}

    public OrdProdInfoDto(String REP_IMG, String PROD_NM, Integer PROD_INDV_QTY, Integer PROD_AMT, String ORD_STUS_CD, String DC_YN) {
        this.REP_IMG = REP_IMG;
        this.PROD_NM = PROD_NM;
        this.PROD_INDV_QTY = PROD_INDV_QTY;
        this.PROD_AMT = PROD_AMT;
        this.ORD_STUS_CD = ORD_STUS_CD;
        this.DC_YN = DC_YN;
    }

    @Override
    public String toString() {
        return "OrdProdInfoDto{" +
                "REP_IMG='" + REP_IMG + '\'' +
                ", PROD_NM='" + PROD_NM + '\'' +
                ", PROD_INDV_QTY=" + PROD_INDV_QTY +
                ", PROD_AMT=" + PROD_AMT +
                ", ORD_STUS_CD='" + ORD_STUS_CD + '\'' +
                ", DC_YN='" + DC_YN + '\'' +
                '}';
    }

    public String getREP_IMG() {
        return REP_IMG;
    }

    public void setREP_IMG(String REP_IMG) {
        this.REP_IMG = REP_IMG;
    }

    public String getPROD_NM() {
        return PROD_NM;
    }

    public void setPROD_NM(String PROD_NM) {
        this.PROD_NM = PROD_NM;
    }

    public Integer getPROD_INDV_QTY() {
        return PROD_INDV_QTY;
    }

    public void setPROD_INDV_QTY(Integer PROD_INDV_QTY) {
        this.PROD_INDV_QTY = PROD_INDV_QTY;
    }

    public Integer getPROD_AMT() {
        return PROD_AMT;
    }

    public void setPROD_AMT(Integer PROD_AMT) {
        this.PROD_AMT = PROD_AMT;
    }

    public String getORD_STUS_CD() {
        return ORD_STUS_CD;
    }

    public void setORD_STUS_CD(String ORD_STUS_CD) {
        this.ORD_STUS_CD = ORD_STUS_CD;
    }

    public String getDC_YN() {
        return DC_YN;
    }

    public void setDC_YN(String DC_YN) {
        this.DC_YN = DC_YN;
    }
}
