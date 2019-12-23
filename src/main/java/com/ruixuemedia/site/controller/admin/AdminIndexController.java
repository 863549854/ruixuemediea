package com.ruixuemedia.site.controller.admin;

import com.ruixuemedia.site.config.QiniuYunConfig;
import com.ruixuemedia.site.entity.AllInfo;
import com.ruixuemedia.site.repository.AllInfoRepository;
import com.ruixuemedia.site.utils.PreLoadUtil;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@Controller
@RequestMapping("/rx-admin")
public class AdminIndexController {
  @Autowired
  private QiniuYunConfig qiniuYunConfig;
  @Autowired
  private AllInfoRepository allInfoRepository;

  /**
   * 管理平台首页
   * @return
   */
  @GetMapping()
  public ModelAndView adminIndex(){
  Map<String,Object> adminData=new HashMap<>();
  adminData.put("staticUrl",qiniuYunConfig.getStaticUrl());
  return new ModelAndView("admin/index",adminData);
}

  /**
   * 基本信息管理
   * @return
   */
  @GetMapping("/allInfo")
  public ModelAndView allInfoAdmin(){
    Map<String,Object> adminData=new HashMap<>();
    adminData.put("staticUrl",qiniuYunConfig.getStaticUrl());
    AllInfo allInfo = allInfoRepository.getOne("1");
adminData.put("basicData",allInfo);

    return new ModelAndView("admin/allInfo",adminData);

  }
  /**
   * 基本信息管理修改
   * @return
   */
  @GetMapping("/editInfo")
  public ModelAndView editInfo(String tel,String email,String addr){
    Map<String,Object> adminData=new HashMap<>();
    adminData.put("staticUrl",qiniuYunConfig.getStaticUrl());
    AllInfo allInfo1 = new AllInfo();
    allInfo1.setId("1");
    allInfo1.setAddr(addr);
    allInfo1.setTel(tel);
    allInfo1.setKefuEmail(email);
    allInfoRepository.save(allInfo1);
    AllInfo allInfo = allInfoRepository.getOne("1");
    adminData.put("basicData",allInfo);
    PreLoadUtil.setAllInfo(allInfo);
    adminData.put("username","kzy");

    return new ModelAndView("admin/allInfo",adminData);


  }
}
