package com.dobby.project.sun.domain;

import java.util.Objects;

public class ProductHashtagDto {
    private Integer HASHTAG_ID;
    private String HASHTAG_NM;
    private String PROD_ID;

    public ProductHashtagDto() {
    }

    public ProductHashtagDto(Integer HASHTAG_ID, String HASHTAG_NM, String PROD_ID) {
        this.HASHTAG_ID = HASHTAG_ID;
        this.HASHTAG_NM = HASHTAG_NM;
        this.PROD_ID = PROD_ID;
    }

    public Integer getHASHTAG_ID() {
        return HASHTAG_ID;
    }

    public void setHASHTAG_ID(Integer HASHTAG_ID) {
        this.HASHTAG_ID = HASHTAG_ID;
    }

    public String getHASHTAG_NM() {
        return HASHTAG_NM;
    }

    public void setHASHTAG_NM(String HASHTAG_NM) {
        this.HASHTAG_NM = HASHTAG_NM;
    }

    public String getPROD_ID() {
        return PROD_ID;
    }

    public void setPROD_ID(String PROD_ID) {
        this.PROD_ID = PROD_ID;
    }

    @Override
    public String toString() {
        return "ProductHashtagDto{" +
                "HASHTAG_ID=" + HASHTAG_ID +
                ", HASHTAG_NM='" + HASHTAG_NM + '\'' +
                ", PROD_ID='" + PROD_ID + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductHashtagDto that = (ProductHashtagDto) o;
        return Objects.equals(HASHTAG_ID, that.HASHTAG_ID);
    }

    @Override
    public int hashCode() {
        return Objects.hash(HASHTAG_ID);
    }
}
