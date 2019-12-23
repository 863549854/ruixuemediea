package com.ruixuemedia.site.controller.admin;

import com.ruixuemedia.site.config.QiniuYunConfig;
import com.ruixuemedia.site.entity.Admin;
import com.ruixuemedia.site.entity.AllInfo;
import com.ruixuemedia.site.repository.AdminRepository;
import com.ruixuemedia.site.utils.CookieUtil;
import com.ruixuemedia.site.utils.PreLoadUtil;
import com.ruixuemedia.site.utils.TokenUtil;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 后台登陆
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@Controller
@RequestMapping("/rx-login")
public class LoginController {
  @Autowired private AdminRepository adminRepository;
  @Autowired private QiniuYunConfig qiniuYunConfig;
@GetMapping()
  public ModelAndView loginIndex(){
  Map<String,Object> map = new HashMap<>();
  map = PreLoadUtil.preLoadData;
  map.put("staticUrl", qiniuYunConfig.getStaticUrl());

  return new ModelAndView("/admin/login",map);
}
@PostMapping("/signin")
  public ModelAndView signin(String username,String password, HttpServletResponse response,Model model,
    RedirectAttributes redirectAttributes){
  List<Admin> admin = adminRepository.findAdminsByUsernameAndPassword(username,password);
  Map<String,Object> loginData= PreLoadUtil.preLoadData;
  if (admin.size()>0){
    String token = TokenUtil.genUniqueKey();
    CookieUtil.set(response, "rxmedia" +"admin", token,
        7200);
    loginData.put("username",admin.get(0).getUsername());

    return new ModelAndView("/admin/index",loginData);
  }else {
    Map<String,Object> errObj= new HashMap<>();
    errObj = PreLoadUtil.preLoadData;
    errObj.put("staticUrl", qiniuYunConfig.getStaticUrl());
    errObj.put("error","用户名或密码错误");
    return new ModelAndView("admin/login",errObj);

  }

}
@GetMapping("/logout")
public ModelAndView logout(HttpServletResponse response){
  CookieUtil.removeCookie("rxmediaadmin",response);
  Map<String,Object> logoutData = PreLoadUtil.preLoadData;
  logoutData.put("staticUrl",qiniuYunConfig.getStaticUrl());
  return new ModelAndView("/admin/login",logoutData);
}
}
