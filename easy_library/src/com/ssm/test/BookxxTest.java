package com.ssm.test;

import com.ssm.pojo.Bookxx;
import org.junit.Test;

/**
 * @Author: Luoxi
 * @Time: 2021-05-25 (星期二)
 * @Package: easy_library
 * @Version: JDK15
 * @Description:
 */
public class BookxxTest {

    @Test
    public void bookTest(){
        Bookxx book = new Bookxx();
        book.setBookid(1);
        book.setBookname("java");
        System.out.println(book);
    }
}
