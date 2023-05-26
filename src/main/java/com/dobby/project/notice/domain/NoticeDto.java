package com.dobby.project.notice.domain;

import java.util.Date;
import java.util.Objects;

    public class NoticeDto {
        private Integer NB_ID;
        private String BBS_ID;
        private String CATE_ID;
        private String CATE_NM;
        private String TTL;
        private String CN;
        private String WRTR;
        private Date REG_DTM;
        private Date UPD_DTM;
        private Date DEL_DTM;
        private int VIEWS;
        private String STUS;

        public NoticeDto() { this("","","","",""); }
        public NoticeDto(String CATE_ID, String TTL, String CN, String WRTR, String STUS) {
            this.CATE_ID = CATE_ID;
            this.TTL = TTL;
            this.CN = CN;
            this.WRTR = WRTR;
            this.STUS = STUS;
        }

        public Integer getNB_ID() {
            return NB_ID;
        }

        public void setNB_ID(Integer NB_ID) {
            this.NB_ID = NB_ID;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            NoticeDto noticeDto = (NoticeDto) o;
            return Objects.equals(NB_ID, noticeDto.NB_ID) && Objects.equals(BBS_ID, noticeDto.BBS_ID) && Objects.equals(CATE_ID, noticeDto.CATE_ID) && Objects.equals(TTL, noticeDto.TTL) && Objects.equals(CN, noticeDto.CN) && Objects.equals(WRTR, noticeDto.WRTR);
        }

        @Override
        public int hashCode() {
            return Objects.hash(NB_ID, BBS_ID, CATE_ID, TTL, CN, WRTR);
        }

        public String getBBS_ID() {
            return BBS_ID;
        }

        public void setBBS_ID(String BBS_ID) {
            this.BBS_ID = BBS_ID;
        }

        public String getCATE_ID() { return CATE_ID; }

        public void setCATE_ID(String NOTICE_CATE_ID) {
            this.CATE_ID = NOTICE_CATE_ID;
        }


        public String getCATE_NM() {
            return CATE_NM;
        }

        public void setCATE_NM(String CATE_NM) {
            this.CATE_NM = CATE_NM;
        }

        public String getTTL() {
            return TTL;
        }

        public void setTTL(String TTL) {
            this.TTL = TTL;
        }

        public String getCN() {
            return CN;
        }

        public void setCN(String CN) {
            this.CN = CN;
        }

        public String getWRTR() {
            return WRTR;
        }

        public void setWRTR(String WRTR) {
            this.WRTR = WRTR;
        }

        public Date getREG_DTM() {
            return REG_DTM;
        }

        public void setREG_DTM(Date REG_DTM) {
            this.REG_DTM = REG_DTM;
        }

        public Date getUPD_DTM() {
            return UPD_DTM;
        }

        public void setUPD_DTM(Date UPD_DTM) {
            this.UPD_DTM = UPD_DTM;
        }

        public Date getDEL_DTM() {
            return DEL_DTM;
        }

        public void setDEL_DTM(Date DEL_DTM) {
            this.DEL_DTM = DEL_DTM;
        }

        public int getVIEWS() {
            return VIEWS;
        }

        public void setVIEWS(int VIEWS) {
            this.VIEWS = VIEWS;
        }

        public String getSTUS() {
            return STUS;
        }

        public void setSTUS(String STUS) {
            this.STUS = STUS;
        }

        @Override
        public String toString() {
            return "NoticeDto{" +
                    "NB_ID=" + NB_ID +
                    ", BBS_ID='" + BBS_ID + '\'' +
                    ", CATE_ID='" + CATE_ID + '\'' +
                    ", CATE_NM='" + CATE_NM + '\'' +
                    ", TTL='" + TTL + '\'' +
                    ", CN='" + CN + '\'' +
                    ", WRTR='" + WRTR + '\'' +
                    ", REG_DTM=" + REG_DTM +
                    ", UPD_DTM=" + UPD_DTM +
                    ", DEL_DTM=" + DEL_DTM +
                    ", VIEWS=" + VIEWS +
                    ", STUS='" + STUS + '\'' +
                    '}';
        }

    }


