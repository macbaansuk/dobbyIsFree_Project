package com.dobby.project.hwa.order;

public class OrdProdDto { //주문상품 TB

    private String ORD_PROD_NO;
    private String ORD_ID;
    private Integer PROD_ID;
    private String PROD_OPT;
    private String PROD_NM;
    private Integer PROD_AMT;
    private Integer PROD_INDV_QTY;  //상품 주문한 수량
    private String REP_IMG;
    private String DC_YN;

    public OrdProdDto (){}
    public OrdProdDto(String ORD_PROD_NO, String ORD_ID, Integer PROD_ID, String PROD_OPT, String PROD_NM, Integer PROD_AMT,
                      Integer PROD_INDV_QTY, String REP_IMG, String DC_YN) {
        this.ORD_PROD_NO = ORD_PROD_NO;
        this.ORD_ID = ORD_ID;
        this.PROD_ID = PROD_ID;
        this.PROD_OPT = PROD_OPT;
        this.PROD_NM = PROD_NM;
        this.PROD_AMT = PROD_AMT;
        this.PROD_INDV_QTY = PROD_INDV_QTY;
        this.REP_IMG = REP_IMG;
        this.DC_YN = DC_YN;
    }

    @Override
    public String toString() {
        return "OrdProdDto{" +
                "ORD_PROD_NO='" + ORD_PROD_NO + '\'' +
                ", ORD_ID='" + ORD_ID + '\'' +
                ", PROD_ID=" + PROD_ID +
                ", PROD_OPT='" + PROD_OPT + '\'' +
                ", PROD_NM='" + PROD_NM + '\'' +
                ", PROD_AMT=" + PROD_AMT +
                ", PROD_INDV_QTY=" + PROD_INDV_QTY +
                ", REP_IMG='" + REP_IMG + '\'' +
                ", DC_YN='" + DC_YN + '\'' +
                '}';
    }

    public String getORD_PROD_NO() {
        return ORD_PROD_NO;
    }

    public void setORD_PROD_NO(String ORD_PROD_NO) {
        this.ORD_PROD_NO = ORD_PROD_NO;
    }

    public String getORD_ID() {
        return ORD_ID;
    }

    public void setORD_ID(String ORD_ID) {
        this.ORD_ID = ORD_ID;
    }

    public Integer getPROD_ID() {
        return PROD_ID;
    }

    public void setPROD_ID(Integer PROD_ID) {
        this.PROD_ID = PROD_ID;
    }

    public String getPROD_OPT() {
        return PROD_OPT;
    }

    public void setPROD_OPT(String PROD_OPT) {
        this.PROD_OPT = PROD_OPT;
    }

    public String getPROD_NM() {
        return PROD_NM;
    }

    public void setPROD_NM(String PROD_NM) {
        this.PROD_NM = PROD_NM;
    }

    public Integer getPROD_AMT() {
        return PROD_AMT;
    }

    public void setPROD_AMT(Integer PROD_AMT) {
        this.PROD_AMT = PROD_AMT;
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
