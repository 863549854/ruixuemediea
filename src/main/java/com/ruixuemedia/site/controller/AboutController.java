package com.ruixuemedia.site.controller;

import com.ruixuemedia.site.utils.PreLoadUtil;
import java.util.Map;
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
@RequestMapping("/about")
public class AboutController {
  private Map<String,Object> map = PreLoadUtil.preLoadData;
@GetMapping()
  public ModelAndView aboutIndex(){
  return new ModelAndView("about",map);
}
}
