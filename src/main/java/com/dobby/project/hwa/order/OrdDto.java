package com.dobby.project.hwa.order;

public class OrdDto {  // 주문 TB
    private String ORD_ID;
    private String MBR_ID;
    private String COU_ID;
    private String ORD_DTM;
    private String REP_PROD_NM; //대표상품명
    private Integer PROD_CNT; //상품수량
    private Integer SETL_AMT; //결제금액
    private Integer DEXP; //배송비
    private String DEXP_YN;
    private String PROD_OPT;  //상품옵션
    private String PROD_DC;
    private String USE_COUPN_NO;
    private Integer ORD_TAMT; //주문금액
    private String REVW_YN;
    private String ORD_STUS_CD;
    private String ORD_CNCL_YN;
    private String ORD_PROCR;
    private String ORD_RMK;
    private String RCPR_NM; //수령자이름
    private String RCPR_ZPCD; //수령자 우편번호
    private String RCPR_BASIC_ADDR; //수령자 기본주소
    private String RCPR_DTL_ADDR; //수령자 상세주소
    private String DLVPN_REQ; //배송요청사항
    private String RCPR_MPNO; //주문자 연락처
    private String BANK; //은행
    private String ACC_NO; //계좌번호
    private String DPOSR; //예금주
    private String ORDR_EMAIL; //주문자이메일
    private String ORDR; //주문자
    private String ORDR_NO; //주문자연락처

    public OrdDto() {}

    public OrdDto(String ORD_ID, String MBR_ID, String COU_ID, String ORD_DTM, String REP_PROD_NM, Integer PROD_CNT, Integer SETL_AMT,
                  Integer DEXP, String DEXP_YN, String PROD_OPT, String PROD_DC, String USE_COUPN_NO, Integer ORD_TAMT, String REVW_YN,
                  String ORD_STUS_CD, String ORD_CNCL_YN, String ORD_PROCR, String ORD_RMK, String RCPR_NM, String RCPR_ZPCD,
                  String RCPR_BASIC_ADDR, String RCPR_DTL_ADDR, String DLVPN_REQ, String RCPR_MPNO, String BANK, String ACC_NO,
                  String DPOSR, String ORDR_EMAIL, String ORDR, String ORDR_NO) {
        this.ORD_ID = ORD_ID;
        this.MBR_ID = MBR_ID;
        this.COU_ID = COU_ID;
        this.ORD_DTM = ORD_DTM;
        this.REP_PROD_NM = REP_PROD_NM;
        this.PROD_CNT = PROD_CNT;
        this.SETL_AMT = SETL_AMT;
        this.DEXP = DEXP;
        this.DEXP_YN = DEXP_YN;
        this.PROD_OPT = PROD_OPT;
        this.PROD_DC = PROD_DC;
        this.USE_COUPN_NO = USE_COUPN_NO;
        this.ORD_TAMT = ORD_TAMT;
        this.REVW_YN = REVW_YN;
        this.ORD_STUS_CD = ORD_STUS_CD;
        this.ORD_CNCL_YN = ORD_CNCL_YN;
        this.ORD_PROCR = ORD_PROCR;
        this.ORD_RMK = ORD_RMK;
        this.RCPR_NM = RCPR_NM;
        this.RCPR_ZPCD = RCPR_ZPCD;
        this.RCPR_BASIC_ADDR = RCPR_BASIC_ADDR;
        this.RCPR_DTL_ADDR = RCPR_DTL_ADDR;
        this.DLVPN_REQ = DLVPN_REQ;
        this.RCPR_MPNO = RCPR_MPNO;
        this.BANK = BANK;
        this.ACC_NO = ACC_NO;
        this.DPOSR = DPOSR;
        this.ORDR_EMAIL = ORDR_EMAIL;
        this.ORDR = ORDR;
        this.ORDR_NO = ORDR_NO;
    }

    @Override
    public String toString() {
        return "OrdDto{" +
                "ORD_ID='" + ORD_ID + '\'' +
                ", MBR_ID='" + MBR_ID + '\'' +
                ", COU_ID='" + COU_ID + '\'' +
                ", ORD_DTM='" + ORD_DTM + '\'' +
                ", REP_PROD_NM='" + REP_PROD_NM + '\'' +
                ", PROD_CNT=" + PROD_CNT +
                ", SETL_AMT=" + SETL_AMT +
                ", DEXP=" + DEXP +
                ", DEXP_YN='" + DEXP_YN + '\'' +
                ", PROD_OPT='" + PROD_OPT + '\'' +
                ", PROD_DC='" + PROD_DC + '\'' +
                ", USE_COUPN_NO='" + USE_COUPN_NO + '\'' +
                ", ORD_TAMT=" + ORD_TAMT +
                ", REVW_YN='" + REVW_YN + '\'' +
                ", ORD_STUS_CD='" + ORD_STUS_CD + '\'' +
                ", ORD_CNCL_YN='" + ORD_CNCL_YN + '\'' +
                ", ORD_PROCR='" + ORD_PROCR + '\'' +
                ", ORD_RMK='" + ORD_RMK + '\'' +
                ", RCPR_NM='" + RCPR_NM + '\'' +
                ", RCPR_ZPCD='" + RCPR_ZPCD + '\'' +
                ", RCPR_BASIC_ADDR='" + RCPR_BASIC_ADDR + '\'' +
                ", RCPR_DTL_ADDR='" + RCPR_DTL_ADDR + '\'' +
                ", DLVPN_REQ='" + DLVPN_REQ + '\'' +
                ", RCPR_MPNO='" + RCPR_MPNO + '\'' +
                ", BANK='" + BANK + '\'' +
                ", ACC_NO='" + ACC_NO + '\'' +
                ", DPOSR='" + DPOSR + '\'' +
                ", ORDR_EMAIL='" + ORDR_EMAIL + '\'' +
                ", ORDR='" + ORDR + '\'' +
                ", ORDR_NO='" + ORDR_NO + '\'' +
                '}';
    }


    public String getORD_ID() {
        return ORD_ID;
    }

    public void setORD_ID(String ORD_ID) {
        this.ORD_ID = ORD_ID;
    }

    public String getMBR_ID() {
        return MBR_ID;
    }

    public void setMBR_ID(String MBR_ID) {
        this.MBR_ID = MBR_ID;
    }

    public String getCOU_ID() {
        return COU_ID;
    }

    public void setCOU_ID(String COU_ID) {
        this.COU_ID = COU_ID;
    }

    public String getORD_DTM() {
        return ORD_DTM;
    }

    public void setORD_DTM(String ORD_DTM) {
        this.ORD_DTM = ORD_DTM;
    }

    public String getREP_PROD_NM() {
        return REP_PROD_NM;
    }

    public void setREP_PROD_NM(String REP_PROD_NM) {
        this.REP_PROD_NM = REP_PROD_NM;
    }

    public Integer getPROD_CNT() {
        return PROD_CNT;
    }

    public void setPROD_CNT(Integer PROD_CNT) {
        this.PROD_CNT = PROD_CNT;
    }

    public Integer getSETL_AMT() {
        return SETL_AMT;
    }

    public void setSETL_AMT(Integer SETL_AMT) {
        this.SETL_AMT = SETL_AMT;
    }

    public Integer getDEXP() {
        return DEXP;
    }

    public void setDEXP(Integer DEXP) {
        this.DEXP = DEXP;
    }

    public String getDEXP_YN() {
        return DEXP_YN;
    }

    public void setDEXP_YN(String DEXP_YN) {
        this.DEXP_YN = DEXP_YN;
    }

    public String getPROD_OPT() {
        return PROD_OPT;
    }

    public void setPROD_OPT(String PROD_OPT) {
        this.PROD_OPT = PROD_OPT;
    }

    public String getPROD_DC() {
        return PROD_DC;
    }

    public void setPROD_DC(String PROD_DC) {
        this.PROD_DC = PROD_DC;
    }

    public String getUSE_COUPN_NO() {
        return USE_COUPN_NO;
    }

    public void setUSE_COUPN_NO(String USE_COUPN_NO) {
        this.USE_COUPN_NO = USE_COUPN_NO;
    }

    public Integer getORD_TAMT() {
        return ORD_TAMT;
    }

    public void setORD_TAMT(Integer ORD_TAMT) {
        this.ORD_TAMT = ORD_TAMT;
    }

    public String getREVW_YN() {
        return REVW_YN;
    }

    public void setREVW_YN(String REVW_YN) {
        this.REVW_YN = REVW_YN;
    }

    public String getORD_STUS_CD() {
        return ORD_STUS_CD;
    }

    public void setORD_STUS_CD(String ORD_STUS_CD) {
        this.ORD_STUS_CD = ORD_STUS_CD;
    }

    public String getORD_CNCL_YN() {
        return ORD_CNCL_YN;
    }

    public void setORD_CNCL_YN(String ORD_CNCL_YN) {
        this.ORD_CNCL_YN = ORD_CNCL_YN;
    }

    public String getORD_PROCR() {
        return ORD_PROCR;
    }

    public void setORD_PROCR(String ORD_PROCR) {
        this.ORD_PROCR = ORD_PROCR;
    }

    public String getORD_RMK() {
        return ORD_RMK;
    }

    public void setORD_RMK(String ORD_RMK) {
        this.ORD_RMK = ORD_RMK;
    }

    public String getRCPR_NM() {
        return RCPR_NM;
    }

    public void setRCPR_NM(String RCPR_NM) {
        this.RCPR_NM = RCPR_NM;
    }

    public String getRCPR_ZPCD() {
        return RCPR_ZPCD;
    }

    public void setRCPR_ZPCD(String RCPR_ZPCD) {
        this.RCPR_ZPCD = RCPR_ZPCD;
    }

    public String getRCPR_BASIC_ADDR() {
        return RCPR_BASIC_ADDR;
    }

    public void setRCPR_BASIC_ADDR(String RCPR_BASIC_ADDR) {
        this.RCPR_BASIC_ADDR = RCPR_BASIC_ADDR;
    }

    public String getRCPR_DTL_ADDR() {
        return RCPR_DTL_ADDR;
    }

    public void setRCPR_DTL_ADDR(String RCPR_DTL_ADDR) {
        this.RCPR_DTL_ADDR = RCPR_DTL_ADDR;
    }

    public String getDLVPN_REQ() {
        return DLVPN_REQ;
    }

    public void setDLVPN_REQ(String DLVPN_REQ) {
        this.DLVPN_REQ = DLVPN_REQ;
    }

    public String getRCPR_MPNO() {
        return RCPR_MPNO;
    }

    public void setRCPR_MPNO(String RCPR_MPNO) {
        this.RCPR_MPNO = RCPR_MPNO;
    }

    public String getBANK() {
        return BANK;
    }

    public void setBANK(String BANK) {
        this.BANK = BANK;
    }

    public String getACC_NO() {
        return ACC_NO;
    }

    public void setACC_NO(String ACC_NO) {
        this.ACC_NO = ACC_NO;
    }

    public String getDPOSR() {
        return DPOSR;
    }

    public void setDPOSR(String DPOSR) {
        this.DPOSR = DPOSR;
    }

    public String getORDR_EMAIL() {
        return ORDR_EMAIL;
    }

    public void setORDR_EMAIL(String ORDR_EMAIL) {
        this.ORDR_EMAIL = ORDR_EMAIL;
    }

    public String getORDR() {
        return ORDR;
    }

    public void setORDR(String ORDR) {
        this.ORDR = ORDR;
    }

    public String getORDR_NO() {
        return ORDR_NO;
    }

    public void setORDR_NO(String ORDR_NO) {
        this.ORDR_NO = ORDR_NO;
    }
}
