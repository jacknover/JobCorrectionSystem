package com.gxun.jms.service;

import com.gxun.jms.dao.UserTestMapper;
import com.gxun.jms.pojo.UserTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserTestService {
    @Autowired
    private UserTestMapper userTestMapper;

    public UserTest getAUser(String name)
    {
        return userTestMapper.getAUser(name);
    }
}
