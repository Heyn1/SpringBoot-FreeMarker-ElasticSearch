package com.example.service;

import com.example.entity.User;
import com.example.vo.ResponseVo;

public interface IUserService {
    /**
     * 注册
     */
    ResponseVo<User> register(User user);

    /**
     * 登录
     */
    ResponseVo<User> login(String username, String password);

}
