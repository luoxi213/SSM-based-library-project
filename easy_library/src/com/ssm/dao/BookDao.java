package com.ssm.dao;

import com.ssm.pojo.Bookxx;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: Luoxi
 * @Time: 2021-05-25 (星期二)
 * @Package: easy_library
 * @Version: JDK15
 * @Description:
 */
public interface BookDao {

    /**
     * 返回所有书目信息
     * @return 所有的书目信息
     */
    List<Bookxx> listBooks();

    /**
     * 根据书名查找一本书的信息
     * @param bookname 书目id
     * @return 一本书的信息
     */
    Bookxx findBookByName(@Param("bookname") String bookname);

    /**
     * 插入新书
     * @param book 要插入的书信息
     * @return
     */
    int addBook(Bookxx book);

    /**
     * 根据id删除书的信息
     * @param bookid 要删除的书目id
     * @return
     */
    int delBook(@Param("bookid") Integer bookid);

    /**
     * 更新一本书的信息
     * @param book 要更新后的新书信息
     * @return
     */
    int updateBook(Bookxx book);

    /**
     * 用户借书
     * @param bookid 书名
     * @return
     */
    int borrowBook(Integer bookid);

    /**
     * 用户还书
     * @param bookid
     * @return
     */
    int returnBook(Integer bookid);

}
