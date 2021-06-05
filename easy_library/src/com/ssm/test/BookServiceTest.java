package com.ssm.test;

import com.ssm.pojo.Bookxx;
import com.ssm.service.BookService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @Author: Luoxi
 * @Time: 2021-05-25 (星期二)
 * @Package: easy_library
 * @Version: JDK15
 * @Description: 测试添加书目时返回的是主键还是成功记录信息
 */
public class BookServiceTest {

    public static void main(String[] args) {
        ApplicationContext applicationContext = new
                ClassPathXmlApplicationContext("resources/applicationContext.xml");
        BookService bs = (BookService) applicationContext.getBean("bookService");
        Bookxx book = new Bookxx();
        book.setBookname("SSM框架");
        book.setBookcount(1);
        book.setDetail("很难学!");
        int affected = bs.addBook(book);
        System.out.println(book.getBookid());
        System.out.println(affected);
    }
}
