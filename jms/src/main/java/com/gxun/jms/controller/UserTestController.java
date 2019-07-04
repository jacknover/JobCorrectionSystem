package com.gxun.jms.controller;

import com.gxun.jms.pojo.UserTest;
import com.gxun.jms.service.UserTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
public class UserTestController {

    @Autowired
    private UserTestService userTestService;

//    @GetMapping("/index")
//    public ModelAndView Login(HttpServletRequest request, HttpServletResponse response)
//    {
//        UserTest xyw = userTestService.getAUser("熊韫文");
//        ModelAndView mav = new ModelAndView("test");
//        request.setAttribute("xyw", xyw);
//        return mav;
//    }

//    @GetMapping("/Login")
//    public ModelAndView Login(HttpServletRequest request, HttpServletResponse response)
//    {
//        ModelAndView mav = new ModelAndView("Login");
//        return mav;
//    }
}
