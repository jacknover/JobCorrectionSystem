package com.gxun.jms.dao;

import com.gxun.jms.pojo.UserTest;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserTestMapper {
    public UserTest getAUser(String name);
}
