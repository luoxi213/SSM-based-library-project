package com.ssm.dao;

import org.apache.ibatis.annotations.Param;

/**
 * @Author: Luoxi
 * @Time: 2021-06-02 (星期三)
 * @Project: easy_library
 * @Package: com.ssm.dao
 * @Version: JDK15
 * @Description: 处理用户与图书之间多对多关系
 */
public interface UserAndBookDao {

    /**
     * 用户借书
     * @param bookid
     * @param userid
     * @return
     */
    int borrowBook(@Param("bookid") Integer bookid, @Param("userid") Integer userid);

    /**
     * 用户还书
     * @param bookid
     * @param userid
     * @return
     */
    int retuenBook(@Param("bookid") Integer bookid, @Param("userid") Integer userid);

    /**
     * 判断用户是否已经借过此书(假设每种书每人只能借一本)
     * @param bookid
     * @param userid
     * @return
     */
    Integer checkIfBorrow(@Param("bookid") Integer bookid, @Param("userid") Integer userid);
}
