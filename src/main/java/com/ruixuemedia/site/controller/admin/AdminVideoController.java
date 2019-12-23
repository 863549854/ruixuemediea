package com.ruixuemedia.site.controller.admin;

import com.ruixuemedia.site.config.QiniuYunConfig;
import com.ruixuemedia.site.entity.Video;
import com.ruixuemedia.site.entity.VideoCategory;
import com.ruixuemedia.site.repository.VideoCategoryRepository;
import com.ruixuemedia.site.repository.VideoRepository;
import com.ruixuemedia.site.utils.JSONResult;
import com.ruixuemedia.site.utils.PreLoadUtil;
import com.ruixuemedia.site.utils.QiniuFileUtil;
import com.ruixuemedia.site.utils.org.n3r.idworker.Sid;
import com.ruixuemedia.site.vo.VideoVO;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@Controller
@RequestMapping("/rx-admin/video")
public class AdminVideoController {
  @Autowired
  private VideoCategoryRepository videoCategoryRepository;
  @Autowired
  private VideoRepository videoRepository;
  @Autowired
  private Sid sid;
  @Autowired
  private QiniuYunConfig qiniuYunConfig;
  @Autowired QiniuFileUtil qiniuFileUtil;

  @GetMapping()
  public ModelAndView videoIndex(){
  Map<String,Object> videoDate = PreLoadUtil.preLoadData;
  List<VideoCategory> videoCategoryList = videoCategoryRepository.findAll();
  List<Object> objects = videoRepository.findVideoVoAll();
 List<VideoVO> videoVOList =convertVideo2VideoVO(objects);
  videoDate.put("videoCategory",videoCategoryList);
  videoDate.put("videos",videoVOList);
  return new ModelAndView("admin/video",videoDate);
}
/**
 * 删除视频
 */
@ResponseBody
@PostMapping("/deletevideo")
public JSONResult deleteVideo(String id){
  if (StringUtils.isEmpty(id)){
    return JSONResult.errorMsg("未传入id，无法删除");
  }
  Optional<Video> videop = videoRepository.findById(id);
  Video video = null;
  if(videop.isPresent()){
    video = videop.get();

  }
  if (video==null){
    return JSONResult.errorMsg("未找到该视频");
  }

  videoRepository.delete(video);
  List<Object> objects = videoRepository.findAllIsShowVideo();
  List<VideoVO> videoVOList = convertVideo2VideoVO(objects);
  PreLoadUtil.setVideoList(videoVOList);
  Boolean deleteCover = qiniuFileUtil.deleteQiniuYunFile(video.getCoverSrc().substring(video.getCoverSrc().lastIndexOf("/")+1));
  System.out.println(video.getCoverSrc().substring(video.getCoverSrc().lastIndexOf("/")+1));
  System.out.println(video.getVideoSrc().substring(video.getVideoSrc().lastIndexOf("/")+1));
  Boolean deleteVideo = qiniuFileUtil.deleteQiniuYunFile(video.getVideoSrc().substring(video.getVideoSrc().lastIndexOf("/")+1));
if (deleteCover&&deleteVideo){
  return JSONResult.ok("删除成功!");

}else {
  return JSONResult.errorMsg("系统已删除，七牛云删除失败！");
}
}

  /**
   * 隐藏该视频
   * @param id
   * @return
   */
  @ResponseBody
  @PostMapping("/hiddenvideo")
public JSONResult hiddenVideo(String id){
  Video video = videoRepository.getOne(id);
  if (video==null){
    return JSONResult.errorMsg("未查找到该视频！");
  }
  video.setIsShow(0);
 Video video1 = videoRepository.save(video);
 if (video1!=null){
   List<Object> objects = videoRepository.findAllIsShowVideo();
   List<VideoVO> videoVOList = convertVideo2VideoVO(objects);
   PreLoadUtil.setVideoList(videoVOList);
   return JSONResult.ok();

 }else {
   return JSONResult.errorMsg("隐藏失败");
 }
}
  /**
   * 展示该视频
   * @param id
   * @return
   */
  @ResponseBody
  @PostMapping("/displayvideo")
  public JSONResult displayvideo(String id){
    Video video = videoRepository.getOne(id);
    if (video==null){
      return JSONResult.errorMsg("未查找到该视频！");
    }
    video.setIsShow(1);
    Video video1 = videoRepository.save(video);
    if (video1!=null){
      List<Object> objects = videoRepository.findAllIsShowVideo();
      List<VideoVO> videoVOList = convertVideo2VideoVO(objects);
      PreLoadUtil.setVideoList(videoVOList);
      return JSONResult.ok();

    }else {
      return JSONResult.errorMsg("展示失败");
    }
  }
  /**
   * 推送到首页
   * @param id
   * @return
   */
  @ResponseBody
  @PostMapping("/pushToIndex")
  public JSONResult pushToIndex(String id){
    Video video = videoRepository.getOne(id);
    if (video==null){
      return JSONResult.errorMsg("未查找到该视频！");
    }
    video.setIsHot(1);
    Video video1 = videoRepository.save(video);
    if (video1!=null){
      List<Video> indexVideoVoList = videoRepository.findAllByIsHotAndIsShow(1,1);
      PreLoadUtil.setIndexVideoList(indexVideoVoList);

      return JSONResult.ok();

    }else {
      return JSONResult.errorMsg("推送到首页失败");
    }
  }
  /**
   * 从首页撤回
   * @param id
   * @return
   */
  @ResponseBody
  @PostMapping("/pullFromIndex")
  public JSONResult pullFromIndex(String id){
    Video video = videoRepository.getOne(id);
    if (video==null){
      return JSONResult.errorMsg("未查找到该视频！");
    }
    video.setIsHot(0);
    Video video1 = videoRepository.save(video);
    if (video1!=null){
      List<Video> indexVideoVoList = videoRepository.findAllByIsHotAndIsShow(1,1);
      PreLoadUtil.setIndexVideoList(indexVideoVoList);
      return JSONResult.ok();

    }else {
      return JSONResult.errorMsg("从首页撤回失败");
    }
  }
  @ResponseBody
  @PostMapping(value ="/addvideo")
public JSONResult addVideo(String head,String desc,String videoType,String cover,String video){
    Video videoEntity = new Video();
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    videoEntity.setUploadDate(df.format(new Date()));
    videoEntity.setId(sid.nextShort());
    videoEntity.setIsShow(1);
    videoEntity.setHead(head);
    videoEntity.setIsHot(0);
    videoEntity.setDesc(desc);
    videoEntity.setVideoType(videoType);
   videoEntity.setCoverSrc(qiniuYunConfig.getPath()+"/"+cover);
    videoEntity.setVideoSrc(qiniuYunConfig.getPath()+"/"+video);
    videoRepository.save(videoEntity);
    List<Object> objects = videoRepository.findAllIsShowVideo();
    List<VideoVO> videoVOList = convertVideo2VideoVO(objects);
    PreLoadUtil.setVideoList(videoVOList);
return JSONResult.ok();
  }
  @ResponseBody
  @PostMapping(value ="/editvideo")
  public JSONResult editVideo(String id,String head,String desc,String videoType,String cover,String video)throws IOException{
   Optional<Video> video2 = videoRepository.findById(id);
    Video video1 = new Video();
   if (video2.isPresent()){
     video1 = video2.get();
   }
   if ( video1==null){
     return JSONResult.errorMsg("修改失败!未找到该视频信息！");
   }
    video1.setHead(head);
    video1.setDesc(desc);
    video1.setVideoType(videoType);
    QiniuFileUtil qiniuFileUtil = new QiniuFileUtil();
//    if (!cover.getOriginalFilename().isEmpty()){
//      String coverKey = getFileKey(cover);
//      FileInputStream inputStream = (FileInputStream)cover.getInputStream();
//      String coverSuccess = qiniuFileUtil.uploadSingleFile(inputStream,coverKey);
//      System.out.println(coverSuccess);
//      if (coverSuccess==null){
//        System.out.println("图片上传失败");
//        return JSONResult.errorMsg("图片上传失败!");
//      }
    if (!cover.startsWith("http")){
      video1.setCoverSrc(qiniuYunConfig.getPath()+"/"+cover);

    }else {
      video1.setCoverSrc(cover);

    }
//
//    }
//   if (!video.getOriginalFilename().isEmpty()){
//     String videoKey = getFileKey(video);
//     FileInputStream videoFile = (FileInputStream) video.getInputStream();
//     String videoSuccess = qiniuFileUtil.uploadSingleFile(videoFile,videoKey);
//     if (videoSuccess==null){
//       return JSONResult.errorMsg("视频上传失败!");
//
//     }
    if(!video.startsWith("http")){
      video1.setVideoSrc(qiniuYunConfig.getPath()+"/"+video);

    }else {
      video1.setVideoSrc(video);
    }
//   }

    videoRepository.save(video1);
    List<Object> objects = videoRepository.findAllIsShowVideo();
    List<VideoVO> videoVOList = convertVideo2VideoVO(objects);
    PreLoadUtil.setVideoList(videoVOList);
    return JSONResult.ok();
  }
  @ResponseBody
  @GetMapping("/getUploadToken")
  public JSONResult getUploadToken(){
   String token= qiniuFileUtil.getToken();
   return JSONResult.ok(token);
  }
  /**
   * 转换类
   * @param objects
   * @return
   */
  public static List<VideoVO> convertVideo2VideoVO(List<Object> objects){
    List<VideoVO> videoList = new ArrayList<VideoVO>();
    try{
      for (int i = 0; i < objects.size(); i++) {
        VideoVO videoVO = new VideoVO();
        Object[] obj = (Object[])objects.get(i);
        videoVO.setId(obj[0].toString());
        videoVO.setVideoSrc(obj[1].toString());
        videoVO.setCoverSrc(obj[2].toString());
        videoVO.setHead(obj[3].toString());
        videoVO.setDesc(obj[4].toString());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date createdDate =  df.parse(obj[5].toString());

        videoVO.setUploadDate(df.format(createdDate));
        videoVO.setIsShow(new Integer(obj[6].toString()));
        videoVO.setVideoType(obj[7].toString());
        videoVO.setIsHot(new Integer(obj[8].toString()));

        videoVO.setCateName(obj[9].toString());

        videoList.add(videoVO);
      }
    }catch(Exception e){
      e.printStackTrace();
    }
return videoList;
  }
  /**
   * multipart转byte[]
   */
  public byte[] multipart2byteStream(MultipartFile file){

    byte [] byteArr=null;
    try{
      byteArr=file.getBytes();

    }catch (IOException e){
      e.printStackTrace();
    }
    return byteArr;
  }
  /**
   * 获取文件key
   */
  public String getFileKey(MultipartFile file){
    String filename = file.getOriginalFilename();
    String suffix = filename.substring(filename.lastIndexOf('.'));
    String key = UUID.randomUUID().toString()+suffix;
    return key;
  }

}
