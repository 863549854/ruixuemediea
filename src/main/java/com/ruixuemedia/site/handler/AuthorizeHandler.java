package com.ruixuemedia.site.handler;

import com.ruixuemedia.site.config.QiniuYunConfig;
import com.ruixuemedia.site.exception.AuthorizeException;
import com.ruixuemedia.site.utils.PreLoadUtil;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@ControllerAdvice
public class AuthorizeHandler {
  @Autowired private QiniuYunConfig qiniuYunConfig;
  @ExceptionHandler(value = AuthorizeException.class)
  public ModelAndView handlerAuthorizeException(){
    Map<String,Object> handler= PreLoadUtil.preLoadData;
    handler.put("staticUrl",qiniuYunConfig.getStaticUrl());
    handler.put("error","请先登陆！");
    return new ModelAndView("/admin/login",handler);
  }
//  public ResponseEntity handlerAuthorizeException(){
//    return new ResponseEntity(HttpStatus.UNAUTHORIZED);
//  }
}
