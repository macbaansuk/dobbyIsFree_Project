package com.dobby.project.soo;

import java.util.List;
import java.util.Map;

public interface CounselService {

    // 1:1 상담 작성 전 회원 조회
    MemberDto getMember(String MBR_ID) throws Exception;

    // 1:1 상담 작성
    void writeCounsel(CounselDto counselDto) throws Exception;

    // 문의 제품 목록 불러오기
    List<ProdDto> getProdList(Map map) throws Exception;

    // 1:1 상담 총 개수
    int getCountAllCounsel() throws Exception;

    // 회원별 1:1 상담 개수
    int getCountCounselByMember(String MBR_ID) throws Exception;

    // 상품 총 개수
    int getCountProd() throws Exception;

    // 회원별 1:1 상담 목록 조회 (COUNSEL+ANSWER JOIN)
    List<CounselDto> getListByMemberId(Map map) throws Exception;

    // 1:1 상담 답변 불러오기
    AnswerDto getAnswerByCnsldId(int CNSL_ID) throws Exception;
}
