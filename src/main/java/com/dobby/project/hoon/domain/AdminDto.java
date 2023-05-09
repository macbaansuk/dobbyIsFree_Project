package com.dobby.project.hoon.domain;

import java.util.Date;
import java.util.Objects;

public class AdminDto {

    private String MNGR_ID;
    private String MNGR_PWD;
    private String MNGR_NM;
    private String MNGR_DCMT_NO;
    private Date FST_REG_DTM;
    private String FST_REGR_DCMT_NO;
    private Date LAST_UPD_DTM;
    private String LAST_UPDR_DCMT_NO;

    public AdminDto() {}

    public AdminDto(String MNGR_ID, String MNGR_PWD, String MNGR_NM, String MNGR_DCMT_NO) {

        this.MNGR_ID = MNGR_ID;
        this.MNGR_PWD = MNGR_PWD;
        this.MNGR_NM = MNGR_NM;
        this.MNGR_DCMT_NO = MNGR_DCMT_NO;
    }
    @Override
    public String toString() {
        return "AdminDto{" +
                "MNGR_ID='" + MNGR_ID + '\'' +
                ", MNGR_PWD='" + MNGR_PWD + '\'' +
                ", MNGR_NM='" + MNGR_NM + '\'' +
                ", MNGR_DCMT_NO='" + MNGR_DCMT_NO + '\'' +
                ", FST_REG_DTM=" + FST_REG_DTM +
                ", FST_REGR_DCMT_NO='" + FST_REGR_DCMT_NO + '\'' +
                ", LAST_UPD_DTM=" + LAST_UPD_DTM +
                ", LAST_UPDR_DCMT_NO='" + LAST_UPDR_DCMT_NO + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AdminDto adminDto = (AdminDto) o;
        return Objects.equals(MNGR_ID, adminDto.MNGR_ID) && Objects.equals(MNGR_PWD, adminDto.MNGR_PWD) && Objects.equals(MNGR_NM, adminDto.MNGR_NM) && Objects.equals(MNGR_DCMT_NO, adminDto.MNGR_DCMT_NO) && Objects.equals(FST_REGR_DCMT_NO, adminDto.FST_REGR_DCMT_NO) && Objects.equals(LAST_UPDR_DCMT_NO, adminDto.LAST_UPDR_DCMT_NO);
    }

    @Override
    public int hashCode() {
        return Objects.hash(MNGR_ID, MNGR_PWD, MNGR_NM, MNGR_DCMT_NO, FST_REGR_DCMT_NO, LAST_UPDR_DCMT_NO);
    }

    public String getMNGR_ID() {
        return MNGR_ID;
    }

    public void setMNGR_ID(String MNGR_ID) {
        this.MNGR_ID = MNGR_ID;
    }

    public String getMNGR_PWD() {
        return MNGR_PWD;
    }

    public void setMNGR_PWD(String MNGR_PWD) {
        this.MNGR_PWD = MNGR_PWD;
    }

    public String getMNGR_NM() {
        return MNGR_NM;
    }

    public void setMNGR_NM(String MNGR_NM) {
        this.MNGR_NM = MNGR_NM;
    }

    public String getMNGR_DCMT_NO() {
        return MNGR_DCMT_NO;
    }

    public void setMNGR_DCMT_NO(String MNGR_DCMT_NO) {
        this.MNGR_DCMT_NO = MNGR_DCMT_NO;
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
}
