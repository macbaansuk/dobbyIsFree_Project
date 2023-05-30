package com.dobby.project.admin.service;

import com.dobby.project.admin.domain.InvDto;
import com.dobby.project.admin.domain.invSearchCondition;

import java.util.List;
import java.util.Map;

public interface InvService {
    int getCount() throws Exception;

    int remove(Integer PROD_ID, String writer) throws Exception;

    int write(InvDto InvDto) throws Exception;

    List<InvDto> getList() throws Exception;

    InvDto read(Integer PROD_ID) throws Exception;

    List<InvDto> getPage(Map map) throws Exception;

    int modify(InvDto InvDto) throws Exception;

    int InvModify(InvDto InvDto) throws Exception;

    InvDto getInv(Integer PROD_ID) throws Exception;

     int getInvSearchResultCnt(invSearchCondition sc) throws Exception ;
     List<InvDto> getInvSearchResultPage(invSearchCondition sc) throws Exception ;
}
