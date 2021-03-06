package com.ssm.service;

/**
 * @Author: Luoxi
 * @Time: 2021-06-02 (ζζδΈ)
 * @Project: easy_library
 * @Package: com.ssm.service
 * @Version: JDK15
 * @Description:
 */
public interface UserAndBookService {
    int borrowBook(Integer bookid, Integer userid);
    int retuenBook(Integer bookid, Integer userid);
    Integer checkIfBorrow(Integer bookid, Integer userid);
}
