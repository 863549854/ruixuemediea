package com.ruixuemedia.site.aspect;//package com.kzysure.demo.aspect;

import com.ruixuemedia.site.exception.AuthorizeException;
import com.ruixuemedia.site.utils.CookieUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@Aspect
@Component
@Slf4j
public class HttpAspect {

  @Pointcut("execution(public * com.ruixuemedia.site.controller.admin.Admin*.*(..))")
  public void verify(){}
  @Before("verify()")
  public void doVerify(){
    ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder
        .getRequestAttributes();
    HttpServletRequest request = servletRequestAttributes.getRequest();

    //查询cookie
    Cookie cookie = CookieUtil.get(request,"rxmediaadmin");
    if (cookie == null){
      log.warn("【登陆校验】，Cookie中查不到token");
      throw new AuthorizeException();
    }

  }

}
