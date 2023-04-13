package com.dobby.project.ming.dao;

import com.dobby.project.ming.domain.User;
import org.junit.*;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;

import java.util.Calendar;
import java.util.Date;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserDaoImplTest {

    @Autowired
    UserDao userDao;
    Calendar cal;

    @Before // 각 테스트가 수행되기 직전에 이 메서드가 실행된다.
    public void init() {
        cal = Calendar.getInstance();
        cal.clear();
        cal.set(2022, 11, 21);
    }

    @Test(expected = Exception.class) // 예외가 발생해야 테스트 통과
    public void insertUser() throws Exception {
        userDao.deleteAll();
        assertTrue(userDao.count()==0);

        User user = new User();
        assertTrue(userDao.insertUser(user)==1);
        assertTrue(userDao.count()==1);

       // User user2 = userDao.selectUser(user.getMBR_ID());
       // assertTrue(user.equals(user2));

        User user3 = new User();
        assertTrue(userDao.insertUser(user3)==1);
        assertTrue(userDao.count()==2);

        // 같은 데이터를 2번 입력하고 예외가 발생하는지 테스트
        userDao.insertUser(user);  // java.sql.SQLIntegrityConstraintViolationException예외발생. Duplicate entry 'asdf' for key 'PRIMARY'
    }

    @Test
    public void deleteUser() throws Exception {
        userDao.deleteAll();
        assertTrue(userDao.count()==0);

        User user = new User();
        assertTrue(userDao.insertUser(user)==1);
        assertTrue(userDao.count()==1);

        User user2 = userDao.selectUser(user.getMBR_ID());
        assertTrue(user.equals(user2));
        assertTrue(userDao.deleteUser(user.getMBR_NM())==1);

        user = userDao.selectUser("test2");
        assertTrue(user==null);
        assertTrue(userDao.count()==0);
    }

    @Test
    public void selectUser() throws Exception {
        userDao.deleteAll();
        assertTrue(userDao.count()==0);

        User user = new User();
        assertTrue(userDao.insertUser(user)==1);

        User user2 = userDao.selectUser(user.getMBR_ID());
        assertTrue(user.equals(user2));

        user2 = userDao.selectUser("test4");
        assertTrue(user2==null);
    }

    @Test
    public void updateUser() throws Exception {
        userDao.deleteAll();
        User user = new User();
        int rowCnt = userDao.insertUser(user);
        assertTrue(rowCnt==1);

        user.setPWD("1111");
        user.setEMAIL("fff@fff.com");
        rowCnt = userDao.updateUser(user);
        assertTrue(rowCnt==1);

        User user2 = userDao.selectUser(user.getMBR_ID());
        System.out.println("user = " + user);
        System.out.println("user2 = " + user2);
        assertTrue(user.equals(user2));
    }
}

    /*@Test
    public void deleteUser() {
    }

    @Test
    public void selectUser() {
    }

    @Test
    public void insertUser() {
    }

    @Test
    public void updateUser() {
    }

    @Test
    public void count() {
    }

    @Test
    public void deleteAll() {
    }
}*/