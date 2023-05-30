package com.dobby.project.notice.service;

import com.dobby.project.counsel.domain.SearchCondition;
import com.dobby.project.notice.domain.NoticeDto;

import java.util.List;
import java.util.Map;

public interface NoticeService {

    //
    int getCount() throws Exception;

    // 게시물 삭제, 나중에 String WRTR 추가하기, 관리자 계정(이름)
    int remove(Integer NB_ID) throws Exception;

    // 게시물 작성
    int write(NoticeDto noticeDto) throws Exception;

    // 모든 게시물 조회
    List<NoticeDto> getAllList(Map map) throws Exception;

    // 게시물 읽기
    NoticeDto read(Integer NB_ID) throws Exception;

    // 페이지별 게시물 읽기
//    List<NoticeDto> getPage(Map map) throws Exception;

    // 게시물 수정
    int modify(NoticeDto noticeDto) throws Exception;

    // 카테고리별 게시물 조회
    List<NoticeDto> getListByCate(Map<String, Object> map)throws Exception;

    // 카테고리별 게시물 개수
    int getCountByCate(String BBS_CATE) throws Exception;

    int getSearchResultCnt(SearchCondition sc) throws Exception;

    List<NoticeDto> getSearchResultPage(SearchCondition sc) throws Exception;
}
