package edu.uestc.onecoupon.framework.idempotent;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface NoDuplicateSubmit {

    /**
     * 触发幂等失败逻辑时，返回的错误提示信息
     */
    String message() default "操作太快，请稍后再试";
}