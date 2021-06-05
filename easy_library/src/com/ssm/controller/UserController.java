package com.ssm.controller;

import com.ssm.pojo.User;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @Author: Luoxi
 * @Time: 2021-06-01 (星期二)
 * @Project: easy_library
 * @Package: com.ssm.controller
 * @Version: JDK15
 * @Description:
 */

@Controller
@RequestMapping("/user")
public class UserController {

    /**
     * 依赖注入
     */
    @Autowired
    private UserService userService;

    /**
     * 跳转至登录界面
     * @return
     */
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    /**
     * 用户登录验证
     * @param account 账号
     * @param password 密码
     * @param session 存登录信息
     * @param model
     * @return
     */
    @GetMapping("/login")
    public String login(String account, String password, HttpSession session, Model model){
        User user = userService.getUser(account, password);
        if (user!=null){
            // 在会话中保存登录信息
            session.setAttribute("login", user);
            model.addAttribute("msg", "登录成功");
            return "information";
        }
        return "login";
    }

    /**
     * 用户退出登录
     * @param session 登录会话
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/index.jsp";
    }

    /**
     * 跳转至注册界面
     * @return
     */
    @RequestMapping("/toAddUser")
    public String toAddUser(){
        return "addUser";
    }

    /**
     * 用户注册
     * @param user 用户注册时填的信息
     * @param model
     * @return
     */
    @PostMapping("/addUser")
    public String addUser(User user, Model model){
        // 查看是否存在同账号的另一个用户
        User check = userService.findUserByAccount(user.getAccount());
        if (check == null){
            // 判断插入语句执行是否成功
            int affected = userService.addUser(user);
            if (affected > 0){
                model.addAttribute("msg", "注册成功, 你的用户id是 " + user.getUserid());
            } else {
                model.addAttribute("msg", "注册失败, 请重试");
            }
        } else {
            model.addAttribute("msg", "注册失败, 账号已存在");
        }
        return "information";
    }

    /**
     * 查看用户所借书籍信息
     * @param userid
     * @param model
     * @return
     */
    @RequestMapping("/listUserBooks")
    public String listUserBooks(Integer userid, Model model){
        /*
        *  数据库查询会返回很多条同一个用户的记录，只是书本的信息不同
        *  如果用户没有借书，则还会返回null，所以要进行判断
        *  因为最终要呈现到浏览器上的是书本信息，所以只提取books数据即可
        */
        User user = userService.listBooksByUserid(userid);
        if (user != null) {
            model.addAttribute("books", user.getBooks());
        }
        return "userBooks";
    }

}
