package com.ruixuemedia.site.controller;

import com.ruixuemedia.site.utils.IpUtil;
import com.ruixuemedia.site.utils.PreLoadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@Controller
@Slf4j
public class IndexController {
private Map<String,Object> preLoadData= PreLoadUtil.preLoadData;

 @GetMapping("/")
  public ModelAndView getlogo(HttpServletRequest httpServletRequest){
String ip = IpUtil.getIpAddr(httpServletRequest);
   preLoadData =this.preLoadData;
   if (!PreLoadUtil.ipList.contains(ip)){
    PreLoadUtil.ipList.add(ip);
    log.info("访问者ip:"+ip);
   }else {
    log.info(" 重复访问者ip:"+ip);

   }
   log.info("今日总访问量:"+PreLoadUtil.ipList.size()+"次");
   log.info("一次访问");
   return new ModelAndView("index",preLoadData);
 }
}
