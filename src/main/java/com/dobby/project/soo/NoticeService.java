package com.dobby.project.soo;

import java.util.List;
import java.util.Map;

public interface NoticeService {
    int getCount() throws Exception;

    int remove(Integer NB_ID, String WRTR) throws Exception;

    int write(NoticeDto noticeDto) throws Exception;

    List<NoticeDto> getList() throws Exception;

    NoticeDto read(Integer NB_ID) throws Exception;

    List<NoticeDto> getPage(Map map) throws Exception;

    int modify(NoticeDto noticeDto) throws Exception;

    int getSearchResultCnt(SearchCondition sc) throws Exception;

    List<NoticeDto> getSearchResultPage(SearchCondition sc) throws Exception;
}
