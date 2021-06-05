package com.ssm.service.imlp;

import com.ssm.dao.UserAndBookDao;
import com.ssm.service.UserAndBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: Luoxi
 * @Time: 2021-06-02 (星期三)
 * @Project: easy_library
 * @Package: com.ssm.service.imlp
 * @Version: JDK15
 * @Description:
 */

@Service
public class UserAndBookServiceImpl implements UserAndBookService {

    /**
     * 依赖注入
     */
    @Autowired
    private UserAndBookDao userAndBookDao;

    @Override
    public int borrowBook(Integer bookid, Integer userid) {
        return userAndBookDao.borrowBook(bookid, userid);
    }

    @Override
    public int retuenBook(Integer bookid, Integer userid) {
        return userAndBookDao.retuenBook(bookid, userid);
    }

    @Override
    public Integer checkIfBorrow(Integer bookid, Integer userid) {
        return userAndBookDao.checkIfBorrow(bookid, userid);
    }
}
