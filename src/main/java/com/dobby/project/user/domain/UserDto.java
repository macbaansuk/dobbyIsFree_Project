package com.dobby.project.user.domain;

import java.util.Date;
import java.util.Objects;

public class UserDto {
    private String MBR_ID;
    private String PWD;
    private String MBR_NM;
    private String EMAIL;
    private String MPNO;
    private Date BD;
    private String SEX;
    private String AGRE_YN;
    private String MBR_GRD;
    private String MBR_TYPE_CD;
    private String MBR_STUS_CD;
    private String DLVPN_ID;
    private Integer MBR_PT;
    private String MBR_COUPN;
    private String COMMENT;
    private String SNS_YN;
    private Date SUBS_DTM;
    private Date MBR_GRD_DTM;
    private String CONN_TMS;
    private Date LAST_LOGIN_DTM;
    private Date FST_REG_DTM;
    private String FST_REGR_DCMT_NO;
    private Date LAST_UPD_DTM;
    private String LAST_UPDR_DCMT_NO;
    private Date SNS_DTM;

    public UserDto() {}
    public UserDto(String MBR_ID, String PWD, String MBR_NM, String EMAIL, String MPNO) {
        this.MBR_ID = MBR_ID;
        this.PWD = PWD;
        this.MBR_NM = MBR_NM;
        this.EMAIL = EMAIL;
        this.MPNO = MPNO;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserDto userDto = (UserDto) o;
        return MBR_ID.equals(userDto.MBR_ID) && PWD.equals(userDto.PWD) && MBR_NM.equals(userDto.MBR_NM) && EMAIL.equals(userDto.EMAIL) && MPNO.equals(userDto.MPNO);
    }

    @Override
    public int hashCode() {
        return Objects.hash(MBR_ID, PWD, MBR_NM, EMAIL, MPNO);
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "MBR_ID='" + MBR_ID + '\'' +
                ", PWD='" + PWD + '\'' +
                ", MBR_NM='" + MBR_NM + '\'' +
                ", EMAIL='" + EMAIL + '\'' +
                ", MPNO='" + MPNO + '\'' +
                ", BD=" + BD +
                ", SEX='" + SEX + '\'' +
                ", AGRE_YN='" + AGRE_YN + '\'' +
                ", MBR_GRD='" + MBR_GRD + '\'' +
                ", MBR_TYPE_CD='" + MBR_TYPE_CD + '\'' +
                ", MBR_STUS_CD='" + MBR_STUS_CD + '\'' +
                ", DLVPN_ID='" + DLVPN_ID + '\'' +
                ", MBR_PT=" + MBR_PT +
                ", MBR_COUPN='" + MBR_COUPN + '\'' +
                ", COMMENT='" + COMMENT + '\'' +
                ", SNS_YN='" + SNS_YN + '\'' +
                ", SUBS_DTM=" + SUBS_DTM +
                ", MBR_GRD_DTM=" + MBR_GRD_DTM +
                ", CONN_TMS='" + CONN_TMS + '\'' +
                ", LAST_LOGIN_DTM=" + LAST_LOGIN_DTM +
                ", FST_REG_DTM=" + FST_REG_DTM +
                ", FST_REGR_DCMT_NO='" + FST_REGR_DCMT_NO + '\'' +
                ", LAST_UPD_DTM=" + LAST_UPD_DTM +
                ", LAST_UPDR_DCMT_NO='" + LAST_UPDR_DCMT_NO + '\'' +
                ", SNS_DTM=" + SNS_DTM +
                '}';
    }

    public String getMBR_ID() {
        return MBR_ID;
    }

    public void setMBR_ID(String MBR_ID) {
        this.MBR_ID = MBR_ID;
    }

    public String getPWD() {
        return PWD;
    }

    public void setPWD(String PWD) {
        this.PWD = PWD;
    }



    public String getMBR_NM() {
        return MBR_NM;
    }

    public void setMBR_NM(String MBR_NM) {
        this.MBR_NM = MBR_NM;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

    public String getMPNO() {
        return MPNO;
    }

    public void setMPNO(String MPNO) {
        this.MPNO = MPNO;
    }

    public Date getBD() {
        return BD;
    }

    public void setBD(Date BD) {
        this.BD = BD;
    }

    public String getSEX() {
        return SEX;
    }

    public void setSEX(String SEX) {
        this.SEX = SEX;
    }

    public String getAGRE_YN() {
        return AGRE_YN;
    }

    public void setAGRE_YN(String AGRE_YN) {
        this.AGRE_YN = AGRE_YN;
    }

    public String getMBR_GRD() {
        return MBR_GRD;
    }

    public void setMBR_GRD(String MBR_GRD) {
        this.MBR_GRD = MBR_GRD;
    }

    public String getMBR_TYPE_CD() {
        return MBR_TYPE_CD;
    }

    public void setMBR_TYPE_CD(String MBR_TYPE_CD) {
        this.MBR_TYPE_CD = MBR_TYPE_CD;
    }

    public String getMBR_STUS_CD() {
        return MBR_STUS_CD;
    }

    public void setMBR_STUS_CD(String MBR_STUS_CD) {
        this.MBR_STUS_CD = MBR_STUS_CD;
    }
    public String getDLVPN_ID() {
        return DLVPN_ID;
    }

    public void setDLVPN_ID(String DLVPN_ID) {
        this.DLVPN_ID = DLVPN_ID;
    }

    public Integer getMBR_PT() {
        return MBR_PT;
    }

    public void setMBR_PT(Integer MBR_PT) {
        this.MBR_PT = MBR_PT;
    }

    public String getMBR_COUPN() {
        return MBR_COUPN;
    }

    public void setMBR_COUPN(String MBR_COUPN) {
        this.MBR_COUPN = MBR_COUPN;
    }

    public String getCOMMENT() {
        return COMMENT;
    }

    public void setCOMMENT(String COMMENT) {
        this.COMMENT = COMMENT;
    }

    public String getSNS_YN() {
        return SNS_YN;
    }

    public void setSNS_YN(String SNS_YN) {
        this.SNS_YN = SNS_YN;
    }

    public Date getSUBS_DTM() {
        return SUBS_DTM;
    }

    public void setSUBS_DTM(Date SUBS_DTM) {
        this.SUBS_DTM = SUBS_DTM;
    }

    public Date getMBR_GRD_DTM() {
        return MBR_GRD_DTM;
    }

    public void setMBR_GRD_DTM(Date MBR_GRD_DTM) {
        this.MBR_GRD_DTM = MBR_GRD_DTM;
    }

    public String getCONN_TMS() {
        return CONN_TMS;
    }

    public void setCONN_TMS(String CONN_TMS) {
        this.CONN_TMS = CONN_TMS;
    }

    public Date getLAST_LOGIN_DTM() {
        return LAST_LOGIN_DTM;
    }

    public void setLAST_LOGIN_DTM(Date LAST_LOGIN_DTM) {
        this.LAST_LOGIN_DTM = LAST_LOGIN_DTM;
    }

    public Date getFST_REG_DTM() {
        return FST_REG_DTM;
    }

    public void setFST_REG_DTM(Date FST_REG_DTM) {
        this.FST_REG_DTM = FST_REG_DTM;
    }

    public String getFST_REGR_DCMT_NO() {
        return FST_REGR_DCMT_NO;
    }

    public void setFST_REGR_DCMT_NO(String FST_REGR_DCMT_NO) {
        this.FST_REGR_DCMT_NO = FST_REGR_DCMT_NO;
    }

    public Date getLAST_UPD_DTM() {
        return LAST_UPD_DTM;
    }

    public void setLAST_UPD_DTM(Date LAST_UPD_DTM) {
        this.LAST_UPD_DTM = LAST_UPD_DTM;
    }

    public String getLAST_UPDR_DCMT_NO() {
        return LAST_UPDR_DCMT_NO;
    }

    public void setLAST_UPDR_DCMT_NO(String LAST_UPDR_DCMT_NO) {
        this.LAST_UPDR_DCMT_NO = LAST_UPDR_DCMT_NO;
    }

    public Date getSNS_DTM() {
        return SNS_DTM;
    }

    public void setSNS_DTM(Date SNS_DTM) {
        this.SNS_DTM = SNS_DTM;
    }

}

