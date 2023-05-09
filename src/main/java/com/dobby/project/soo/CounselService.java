package com.dobby.project.soo;

import java.util.List;
import java.util.Map;

public interface CounselService {

    // 1:1 상담 작성 전 회원 조회
    MemberDto getMember(String mbrId) throws Exception;

    // 1:1 상담 작성
    void writeCounsel(CounselDto counselDto) throws Exception;

    // 문의 제품 목록 불러오기
    List<ProdDto> getProdList(Map map) throws Exception;

    // 1:1 상담 총 개수
    int getCountAllCounsel() throws Exception;

    // 회원별 1:1 상담 개수
    int getCountCounselByMember(String mbrId) throws Exception;

    // 상품 총 개수
    int getCountProd() throws Exception;

    // 회원별 1:1 상담 목록 조회 (COUNSEL+ANSWER JOIN)
    List<CounselAnswerDto> getListByMember(String mbrId) throws Exception ;

    // 전체 1:1 상담 목록 + 답변 조회
    List<CounselAnswerDto> getAllList(Map map) throws Exception;
    // 답변 작성
    void writeAnswer(AnswerDto answerDto) throws Exception;
}
