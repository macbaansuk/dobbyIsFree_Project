package com.dobby.project.soo;

public class MemberDto {

    private String MBR_ID;
    private String MBR_NM;
    private String MPNO;

    public MemberDto(){}
    public MemberDto(String MBR_ID, String MBR_NM, String MPNO) {
        this.MBR_ID = MBR_ID;
        this.MBR_NM = MBR_NM;
        this.MPNO = MPNO;
    }

    public String getMBR_ID() {
        return MBR_ID;
    }

    public void setMBR_ID(String MBR_ID) {
        this.MBR_ID = MBR_ID;
    }

    public String getMBR_NM() {
        return MBR_NM;
    }

    public void setMBR_NM(String MBR_NM) {
        this.MBR_NM = MBR_NM;
    }

    public String getMPNO() {
        return MPNO;
    }

    public void setMPNO(String MPNO) {
        this.MPNO = MPNO;
    }



    @Override
    public String toString() {
        return "MemberDto{" +
                "MBR_ID='" + MBR_ID + '\'' +
                ", MBR_NM='" + MBR_NM + '\'' +
                ", MPNO='" + MPNO + '\'' +
                '}';
    }
}
