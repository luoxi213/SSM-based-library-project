package com.ssm.service;

import com.ssm.pojo.Bookxx;

import java.util.List;

/**
 * @Author: Luoxi
 * @Time: 2021-05-25 (星期二)
 * @Package: easy_library
 * @Version: JDK15
 * @Description: BookDao接口对应的业务层
 */
public interface BookService {
    List<Bookxx> listBooks();
    Bookxx findBookByName(String bookname);
    int updateBook(Bookxx book);
    int delBool(Integer bookid);
    int addBook(Bookxx book);
    int borrowBook(Integer bookid);
    int returnBook(Integer bookid);
}
