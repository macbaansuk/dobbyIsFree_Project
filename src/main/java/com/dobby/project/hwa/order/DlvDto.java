package com.dobby.project.hwa.order;

public class DlvDto {

    private String DLVPN_ID;
    private String MBR_ID;
    private String ORD_ID;
    private String RCPR;
    private String DLVPN_NM;
    private String RCPR_MPNO;
    private String ZPCD;
    private String BASIC_ADDR;
    private String DTL_ADDR;
    private String REQ;
    private String BASIC_DLVPN_ADD;
    private String LIST_YN;


    public DlvDto(){}

    public DlvDto(String DLVPN_ID, String MBR_ID, String ORD_ID, String RCPR, String DLVPN_NM, String RCPR_MPNO, String ZPCD, String BASIC_ADDR, String DTL_ADDR, String REQ, String BASIC_DLVPN_ADD, String LIST_YN) {
        this.DLVPN_ID = DLVPN_ID;
        this.MBR_ID = MBR_ID;
        this.ORD_ID = ORD_ID;
        this.RCPR = RCPR;
        this.DLVPN_NM = DLVPN_NM;
        this.RCPR_MPNO = RCPR_MPNO;
        this.ZPCD = ZPCD;
        this.BASIC_ADDR = BASIC_ADDR;
        this.DTL_ADDR = DTL_ADDR;
        this.REQ = REQ;
        this.BASIC_DLVPN_ADD = BASIC_DLVPN_ADD;
        this.LIST_YN = LIST_YN;
    }


    @Override
    public String toString() {
        return "DlvDto{" +
                "DLVPN_ID='" + DLVPN_ID + '\'' +
                ", MBR_ID='" + MBR_ID + '\'' +
                ", ORD_ID='" + ORD_ID + '\'' +
                ", RCPR='" + RCPR + '\'' +
                ", DLVPN_NM='" + DLVPN_NM + '\'' +
                ", RCPR_MPNO='" + RCPR_MPNO + '\'' +
                ", ZPCD='" + ZPCD + '\'' +
                ", BASIC_ADDR='" + BASIC_ADDR + '\'' +
                ", DTL_ADDR='" + DTL_ADDR + '\'' +
                ", REQ='" + REQ + '\'' +
                ", BASIC_DLVPN_ADD='" + BASIC_DLVPN_ADD + '\'' +
                ", LIST_YN='" + LIST_YN + '\'' +
                '}';
    }

    public String getDLVPN_ID() {
        return DLVPN_ID;
    }

    public void setDLVPN_ID(String DLVPN_ID) {
        this.DLVPN_ID = DLVPN_ID;
    }

    public String getMBR_ID() {
        return MBR_ID;
    }

    public void setMBR_ID(String MBR_ID) {
        this.MBR_ID = MBR_ID;
    }

    public String getORD_ID() {
        return ORD_ID;
    }

    public void setORD_ID(String ORD_ID) {
        this.ORD_ID = ORD_ID;
    }

    public String getRCPR() {
        return RCPR;
    }

    public void setRCPR(String RCPR) {
        this.RCPR = RCPR;
    }

    public String getDLVPN_NM() {
        return DLVPN_NM;
    }

    public void setDLVPN_NM(String DLVPN_NM) {
        this.DLVPN_NM = DLVPN_NM;
    }

    public String getRCPR_MPNO() {
        return RCPR_MPNO;
    }

    public void setRCPR_MPNO(String RCPR_MPNO) {
        this.RCPR_MPNO = RCPR_MPNO;
    }

    public String getZPCD() {
        return ZPCD;
    }

    public void setZPCD(String ZPCD) {
        this.ZPCD = ZPCD;
    }

    public String getBASIC_ADDR() {
        return BASIC_ADDR;
    }

    public void setBASIC_ADDR(String BASIC_ADDR) {
        this.BASIC_ADDR = BASIC_ADDR;
    }

    public String getDTL_ADDR() {
        return DTL_ADDR;
    }

    public void setDTL_ADDR(String DTL_ADDR) {
        this.DTL_ADDR = DTL_ADDR;
    }

    public String getREQ() {
        return REQ;
    }

    public void setREQ(String REQ) {
        this.REQ = REQ;
    }

    public String getBASIC_DLVPN_ADD() {
        return BASIC_DLVPN_ADD;
    }

    public void setBASIC_DLVPN_ADD(String BASIC_DLVPN_ADD) {
        this.BASIC_DLVPN_ADD = BASIC_DLVPN_ADD;
    }

    public String getLIST_YN() {
        return LIST_YN;
    }

    public void setLIST_YN(String LIST_YN) {
        this.LIST_YN = LIST_YN;
    }
}
