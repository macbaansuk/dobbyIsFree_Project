package com.dobby.project.sun;

import java.sql.Date;
import java.util.Objects;

public class ProductDCDto {
    private Integer prod_dc_id;
    private String prod_nm;
    private Integer prod_id;
    private String dc_typ;
    private Integer dc_rate;
    private Integer dc_amt;
    private Integer dc_price;
    private Date bgn_dtm;
    private Date end_dtm;
    private String dc_stus;
    private Date fst_reg_dtm;
    private String fst_regr_dcmt_no;
    private Date last_upd_dtm;
    private String last_updr_dcmt_no;

    public ProductDCDto() {
    }

    public ProductDCDto(Integer prod_dc_id, String prod_nm, Integer prod_id, String dc_typ, Integer dc_rate, Integer dc_amt, Integer dc_price, Date bgn_dtm, Date end_dtm, String dc_stus, Date fst_reg_dtm, String fst_regr_dcmt_no, Date last_upd_dtm, String last_updr_dcmt_no) {
        this.prod_dc_id = prod_dc_id;
        this.prod_nm = prod_nm;
        this.prod_id = prod_id;
        this.dc_typ = dc_typ;
        this.dc_rate = dc_rate;
        this.dc_amt = dc_amt;
        this.dc_price = dc_price;
        this.bgn_dtm = bgn_dtm;
        this.end_dtm = end_dtm;
        this.dc_stus = dc_stus;
        this.fst_reg_dtm = fst_reg_dtm;
        this.fst_regr_dcmt_no = fst_regr_dcmt_no;
        this.last_upd_dtm = last_upd_dtm;
        this.last_updr_dcmt_no = last_updr_dcmt_no;
    }

    public Integer getProd_dc_id() {
        return prod_dc_id;
    }

    public void setProd_dc_id(Integer prod_dc_id) {
        this.prod_dc_id = prod_dc_id;
    }

    public String getProd_nm() {
        return prod_nm;
    }

    public void setProd_nm(String prod_nm) {
        this.prod_nm = prod_nm;
    }

    public Integer getProd_id() {
        return prod_id;
    }

    public void setProd_id(Integer prod_id) {
        this.prod_id = prod_id;
    }

    public String getDc_typ() {
        return dc_typ;
    }

    public void setDc_typ(String dc_typ) {
        this.dc_typ = dc_typ;
    }

    public Integer getDc_rate() {
        return dc_rate;
    }

    public void setDc_rate(Integer dc_rate) {
        this.dc_rate = dc_rate;
    }

    public Integer getDc_amt() {
        return dc_amt;
    }

    public void setDc_amt(Integer dc_amt) {
        this.dc_amt = dc_amt;
    }

    public Integer getDc_price() {
        return dc_price;
    }

    public void setDc_price(Integer dc_price) {
        this.dc_price = dc_price;
    }

    public Date getBgn_dtm() {
        return bgn_dtm;
    }

    public void setBgn_dtm(Date bgn_dtm) {
        this.bgn_dtm = bgn_dtm;
    }

    public Date getEnd_dtm() {
        return end_dtm;
    }

    public void setEnd_dtm(Date end_dtm) {
        this.end_dtm = end_dtm;
    }

    public String getDc_stus() {
        return dc_stus;
    }

    public void setDc_stus(String dc_stus) {
        this.dc_stus = dc_stus;
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

    public String getLast_updr_dcmt_no() {
        return last_updr_dcmt_no;
    }

    public void setLast_updr_dcmt_no(String last_updr_dcmt_no) {
        this.last_updr_dcmt_no = last_updr_dcmt_no;
    }

    @Override
    public String toString() {
        return "ProductDCDto{" +
                "prod_dc_id=" + prod_dc_id +
                ", prod_nm='" + prod_nm + '\'' +
                ", prod_id=" + prod_id +
                ", dc_typ='" + dc_typ + '\'' +
                ", dc_rate=" + dc_rate +
                ", dc_amt=" + dc_amt +
                ", dc_price=" + dc_price +
                ", bgn_dtm=" + bgn_dtm +
                ", end_dtm=" + end_dtm +
                ", dc_stus='" + dc_stus + '\'' +
                ", fst_reg_dtm=" + fst_reg_dtm +
                ", fst_regr_dcmt_no='" + fst_regr_dcmt_no + '\'' +
                ", last_upd_dtm=" + last_upd_dtm +
                ", last_updr_dcmt_no='" + last_updr_dcmt_no + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductDCDto that = (ProductDCDto) o;
        return Objects.equals(prod_dc_id, that.prod_dc_id) && Objects.equals(prod_nm, that.prod_nm);
    }

    @Override
    public int hashCode() {
        return Objects.hash(prod_dc_id, prod_nm);
    }
}
