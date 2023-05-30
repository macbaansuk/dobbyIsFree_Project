package com.dobby.project.user.service;

import com.dobby.project.user.dao.UserDao;
import com.dobby.project.user.domain.User;
import com.dobby.project.user.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Override
    public int getCount() throws Exception {
        return userDao.count();
    }
    @Override
    public int remove(String MBR_ID) throws Exception {
        return userDao.deleteUser(MBR_ID);
    }

    public List<UserDto> getList() throws Exception {
        return userDao.memberList();
    }
    public UserDto read(String MBR_ID)throws Exception {
        UserDto userDto = userDao.selectUser(MBR_ID);
        return userDto;
    }
    public List<UserDto> getPage(Map map) throws Exception {
        return userDao.selectPage(map);
    }
    public int modify(User user) throws Exception {
        return userDao.updateUser(user);
    }
}

