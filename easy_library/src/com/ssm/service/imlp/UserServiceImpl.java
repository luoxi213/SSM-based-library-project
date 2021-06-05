package com.ssm.service.imlp;

import com.ssm.dao.UserDao;
import com.ssm.pojo.User;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: Luoxi
 * @Time: 2021-06-01 (星期二)
 * @Project: easy_library
 * @Package: com.ssm.service.imlp
 * @Version: JDK15
 * @Description:
 */

@Service
public class UserServiceImpl implements UserService {

    /**
     * 依赖注入
     */
    @Autowired
    private UserDao userDao;

    @Override
    public User findUserByAccount(String account) {
        return userDao.findUserByAccount(account);
    }

    @Override
    public User getUser(String account, String password) {
        return userDao.getUser(account, password);
    }

    @Override
    public int addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public User listBooksByUserid(Integer userid) {
        return userDao.listBooksByUserid(userid);
    }
}
