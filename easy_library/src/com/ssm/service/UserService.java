package com.ssm.service;

import com.ssm.pojo.User;

/**
 * @Author: Luoxi
 * @Time: 2021-06-01 (星期二)
 * @Project: easy_library
 * @Package: com.ssm.service
 * @Version: JDK15
 * @Description:
 */

public interface UserService {

    User findUserByAccount(String account);
    User getUser(String account, String password);
    int addUser(User user);
    User listBooksByUserid(Integer userid);
}
