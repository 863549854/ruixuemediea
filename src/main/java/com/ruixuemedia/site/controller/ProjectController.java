package com.ruixuemedia.site.controller;

import com.ruixuemedia.site.utils.PreLoadUtil;
import java.util.List;
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
@RequestMapping("/project")
public class ProjectController {
  private Map<String,Object> preloadData= PreLoadUtil.preLoadData;
  @GetMapping()
public ModelAndView projectPage(Map<String,Object> map){
  return new ModelAndView("project",preloadData);
}
}
