package com.dobby.project.ming;

import com.dobby.project.ming.dao.UserDao;
import com.dobby.project.ming.domain.*;
import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

public class UserDaoImplTest {
    @Autowired
    UserDao userDao;

    @Test
    public void selectUser() throws Exception {
        assertTrue(userDao!=null);
        System.out.println("userDao="+userDao);
        UserDto userDto = userDao.selectUser("test1");
        System.out.println("userDto="+userDto);
        assertTrue(userDto.getMBR_ID().equals("test1"));
    }

    @Test
    public void memberDbcheck() throws Exception {

    }
    /*@Test
    public void deleteUser() {
    }

    @Test
    public void selectAll() {
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
    }*/
}