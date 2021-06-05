package com.ssm.pojo;

import lombok.Data;

import java.util.List;

/**
 * @Author: Luoxi
 * @Time: 2021-06-01 (星期二)
 * @Package: easy_library
 * @Version: JDK15
 * @Description:
 */

@Data
public class User {
    private Integer userid;
    private String username;
    private String account;
    private String password;
    private Integer permission;
    private List<Bookxx> books;
}
