package com.dobby.project.hoon.service;

import com.dobby.project.hoon.dao.InvDao;
import com.dobby.project.hoon.domain.InvDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class InvServiceImpl implements InvService {
    @Autowired
    private InvDao invDao;

    @Override
    public int getCount() throws Exception {
        return invDao.count();
    }

    @Override
    public int remove(Integer PROD_ID, String writer) throws Exception {
        return invDao.delete(PROD_ID, writer);
    }

    @Override
    public int write(InvDto InvDto) throws Exception {
        return invDao.insert(InvDto);
    }

    @Override
    public List<InvDto> getList() throws Exception {
        return invDao.selectAll();
    }

    @Override
    public InvDto read(Integer PROD_ID) throws Exception {
        InvDto InvDto = invDao.select(PROD_ID);
        invDao.increaseViewCnt(PROD_ID);

        return InvDto;
    }

    @Override
    public List<InvDto> getPage(Map map) throws Exception {
        return invDao.selectPage(map);
    }

    @Override
    public int modify(InvDto InvDto) throws Exception {
        return invDao.update(InvDto);
    }

}
