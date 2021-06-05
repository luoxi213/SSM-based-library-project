package com.ssm.service.imlp;

import com.ssm.dao.BookDao;
import com.ssm.pojo.Bookxx;
import com.ssm.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: Luoxi
 * @Time: 2021-05-25 (星期二)
 * @Package: easy_library
 * @Version: JDK15
 * @Description:
 */

@Service
public class BookServiceImpl implements BookService {
    /**
     * 依赖注入
     */
    @Autowired
    private BookDao bookDao;

    @Override
    public List<Bookxx> listBooks() {
        return bookDao.listBooks();
    }

    @Override
    public Bookxx findBookByName(String bookname) {
        return bookDao.findBookByName(bookname);
    }

    @Override
    public int updateBook(Bookxx book) {
        return bookDao.updateBook(book);
    }

    @Override
    public int delBool(Integer bookid) {
        return bookDao.delBook(bookid);
    }

    @Override
    public int addBook(Bookxx book) {
        return bookDao.addBook(book);
    }

    @Override
    public int borrowBook(Integer bookid) {
        return bookDao.borrowBook(bookid);
    }

    @Override
    public int returnBook(Integer bookid) {
        return bookDao.returnBook(bookid);
    }
}
