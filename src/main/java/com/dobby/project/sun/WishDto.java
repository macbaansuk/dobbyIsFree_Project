package com.dobby.project.sun;

import java.sql.Date;
import java.util.Objects;

public class WishDto {
    private Integer wish_id;
    private String mbr_cd;
    private Integer prod_id;
    private Date wish_reg_dtm;
    private Date fst_reg_dtm;
    private String fst_regr_dcmt_no;
    private Date last_upd_dtm;
    private String last_updr_dcmt_No;


    public WishDto() {
    }

    public WishDto(Integer wish_id, String mbr_cd, Integer prod_id, Date wish_reg_dtm, Date fst_reg_dtm, String fst_regr_dcmt_no, Date last_upd_dtm, String last_updr_dcmt_No) {

        this.wish_id = wish_id;
        this.mbr_cd = mbr_cd;
        this.prod_id = prod_id;
        this.wish_reg_dtm = wish_reg_dtm;
        this.fst_reg_dtm = fst_reg_dtm;
        this.fst_regr_dcmt_no = fst_regr_dcmt_no;
        this.last_upd_dtm = last_upd_dtm;
        this.last_updr_dcmt_No = last_updr_dcmt_No;
    }

    public Integer getWish_id() {
        return wish_id;
    }

    public void setWish_id(Integer wish_id) {
        this.wish_id = wish_id;
    }

    public String getMbr_cd() {
        return mbr_cd;
    }

    public void setMbr_cd(String mbr_cd) {
        this.mbr_cd = mbr_cd;
    }

    public Integer getProd_id() {
        return prod_id;
    }

    public void setProd_id(Integer prod_id) {
        this.prod_id = prod_id;
    }

    public Date getWish_reg_dtm() {
        return wish_reg_dtm;
    }

    public void setWish_reg_dtm(Date wish_reg_dtm) {
        this.wish_reg_dtm = wish_reg_dtm;
    }

    public Date getFst_reg_dtm() {
        return fst_reg_dtm;
    }

    public void setFst_reg_dtm(Date fst_reg_dtm) {
        this.fst_reg_dtm = fst_reg_dtm;
    }

    public String getFst_regr_dcmt_no() {
        return fst_regr_dcmt_no;
    }

    public void setFst_regr_dcmt_no(String fst_regr_dcmt_no) {
        this.fst_regr_dcmt_no = fst_regr_dcmt_no;
    }

    public Date getLast_upd_dtm() {
        return last_upd_dtm;
    }

    public void setLast_upd_dtm(Date last_upd_dtm) {
        this.last_upd_dtm = last_upd_dtm;
    }

    public String getLast_updr_dcmt_No() {
        return last_updr_dcmt_No;
    }

    public void setLast_updr_dcmt_No(String last_updr_dcmt_No) {
        this.last_updr_dcmt_No = last_updr_dcmt_No;
    }

    @Override
    public String toString() {
        return "WishListDto{" +
                "wish_id=" + wish_id +
                ", mbr_cd='" + mbr_cd + '\'' +
                ", prod_id=" + prod_id +
                ", wish_reg_dtm=" + wish_reg_dtm +
                ", fst_reg_dtm=" + fst_reg_dtm +
                ", fst_regr_dcmt_no='" + fst_regr_dcmt_no + '\'' +
                ", last_upd_dtm=" + last_upd_dtm +
                ", last_updr_dcmt_No='" + last_updr_dcmt_No + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        WishDto that = (WishDto) o;
        return Objects.equals(wish_id, that.wish_id) && Objects.equals(mbr_cd, that.mbr_cd) && Objects.equals(prod_id, that.prod_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(wish_id, mbr_cd, prod_id);
    }
}
