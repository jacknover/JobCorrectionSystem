package com.gxun.jms.util;

import java.util.regex.Pattern;

public class IsNumberUtil {
    public boolean isInteger(String str) {
        Pattern pattern = Pattern.compile("[0-9]*");
        return pattern.matcher(str).matches();
    }

    public boolean isChinese(String str)
    {
        String regex3 = "[\\u4e00-\\u9fa5]+";
        return str.matches(regex3);
    }
}


