package com.ruixuemedia.site.controller.admin;

import static com.ruixuemedia.site.controller.admin.AdminVideoController.convertVideo2VideoVO;

import com.ruixuemedia.site.config.QiniuYunConfig;
import com.ruixuemedia.site.entity.Video;
import com.ruixuemedia.site.entity.VideoCategory;
import com.ruixuemedia.site.repository.VideoCategoryRepository;
import com.ruixuemedia.site.repository.VideoRepository;
import com.ruixuemedia.site.utils.JSONResult;
import com.ruixuemedia.site.utils.PreLoadUtil;
import com.ruixuemedia.site.utils.org.n3r.idworker.Sid;
import com.ruixuemedia.site.vo.VideoVO;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@Controller
@RequestMapping("/rx-admin/videocategory")
public class AdminVideoCategoryController {
  @Autowired private VideoCategoryRepository videoCategoryRepository;
  @Autowired private QiniuYunConfig qiniuYunConfig;
  @Autowired private Sid sid;
  @Autowired private VideoRepository videoRepository;
@GetMapping
  public ModelAndView videoCategoryIndex(){
  List<VideoCategory> videoCategoryList = videoCategoryRepository.findAll();
  Map<String,Object> objectMap = PreLoadUtil.preLoadData;
  objectMap.put("videoCategory",videoCategoryList);
  objectMap.put("static",qiniuYunConfig.getStaticUrl());
  return new ModelAndView("/admin/videoCategory",objectMap);
}
@ResponseBody
@PostMapping("/addvideocategory")
  public JSONResult addvideocategory(String name){
  if (name==null){
    return JSONResult.errorMsg("视频分类名称不允许为空!");
  }
  VideoCategory videoCategory = new VideoCategory();
  videoCategory.setName(name);
  videoCategory.setId(sid.nextShort());
 VideoCategory videoCategory1 = videoCategoryRepository.save(videoCategory);
 if (videoCategory1!=null){
   List<Object> objects = videoRepository.findAllIsShowVideo();
   List<VideoVO> videoVOList = convertVideo2VideoVO(objects);
   PreLoadUtil.setVideoList(videoVOList);
   return JSONResult.ok();
 }else {
   return JSONResult.errorMsg("新增分类保存失败!");

 }
}
  @ResponseBody
  @PostMapping("/deletevideocategory")
  public JSONResult deletevideocategory(String id){
    if (id==null){
      return JSONResult.errorMsg("视频分类编号不允许为空!");
    }
    if (id.equals("0")){
      return JSONResult.errorMsg("此分类不允许删除");
    }
    VideoCategory videoCategory = videoCategoryRepository.getOne(id);
    if (videoCategory!=null){
      List<Video> videos = videoRepository.findAllByVideoType(videoCategory.getId());
      if(videos.size()>0){
        for (Video video:videos){
          video.setVideoType("0");
          videoRepository.save(video);
        }
      }
      videoCategoryRepository.delete(videoCategory);
      List<Object> objects = videoRepository.findAllIsShowVideo();
      List<VideoVO> videoVOList = convertVideo2VideoVO(objects);
      PreLoadUtil.setVideoList(videoVOList);
      return JSONResult.ok();
    }else {
      return JSONResult.errorMsg("不存在该分类!");

    }
  }
  @ResponseBody
  @PostMapping("/editvideocategory")
  public JSONResult deletevideocategory(String id,String name){
    if (id==null){
      return JSONResult.errorMsg("视频分类编号不允许为空!");
    }
    if ("0".equals(id)){
      return JSONResult.errorMsg("默认分类不允许编辑");
    }
    if (name!=null){

    }
    VideoCategory videoCategory = videoCategoryRepository.getOne(id);
    if (name!=null){
      videoCategory.setName(name);
      videoCategoryRepository.save(videoCategory);
      List<Object> objects = videoRepository.findAllIsShowVideo();
      List<VideoVO> videoVOList = convertVideo2VideoVO(objects);
      PreLoadUtil.setVideoList(videoVOList);
      return JSONResult.ok();
    }else {
      return JSONResult.errorMsg("分类名称不允许为空!");

    }
  }
}
