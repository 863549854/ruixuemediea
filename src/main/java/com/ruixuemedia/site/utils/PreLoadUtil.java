package com.ruixuemedia.site.utils;

import com.ruixuemedia.site.config.QiniuYunConfig;
import com.ruixuemedia.site.entity.AllInfo;
import com.ruixuemedia.site.entity.Video;
import com.ruixuemedia.site.entity.VideoCategory;
import com.ruixuemedia.site.repository.AllInfoRepository;
import com.ruixuemedia.site.repository.VideoCategoryRepository;
import com.ruixuemedia.site.repository.VideoRepository;
import com.ruixuemedia.site.vo.VideoVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@Component
@Slf4j
public class PreLoadUtil implements ApplicationRunner {
  @Autowired private AllInfoRepository allInfoRepository;
  @Autowired private QiniuYunConfig qiniuYunConfig;
  @Autowired private VideoRepository videoRepository;
  @Autowired private VideoCategoryRepository videoCategoryRepository;
  public static Map<String,Object> preLoadData = new HashMap<>();
  public static Vector<String> ipList = new Vector<>();
 private List<VideoVO> videoList = new ArrayList<VideoVO>();

  /**
   * 数据初始化
   * @param var1
   * @throws Exception
   */
  @Override
  public void run(ApplicationArguments var1) throws Exception{
    Optional<AllInfo> allInfo =allInfoRepository.findById("1");
    List<VideoVO> videoVolist = getVideoVoList();
    List<VideoCategory> videoCategoryList = videoCategoryRepository.findAll();
    List<Video> indexVideoVoList = getIndexVideoVoList();

      log.info(new Date()+"[🔨🚗......]数据初始化成功");

      preLoadData.put("allInfo",allInfo.get());
      preLoadData.put("videoVo",videoVolist);
      preLoadData.put("videoCategory",videoCategoryList);
      preLoadData.put("staticUrl",qiniuYunConfig.getStaticUrl());
      preLoadData.put("indexVideoVoList",indexVideoVoList);


  }

  /**
   * 设置基本信息
   * @param info
   */
  public static void setAllInfo(AllInfo info){
    preLoadData.put("allInfo",info);
  }
  /**
   * 获取视频视图层对象
   */
  private List<VideoVO> getVideoVoList(){
    List<Object> objects = videoRepository.findAllIsShowVideo();
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
   * 获取首页视频.
   * @return
   */
  private List<Video> getIndexVideoVoList() {
      List<Video> allByIsHotAndIsShow = videoRepository.findAllByIsHotAndIsShow(1, 1);
      return allByIsHotAndIsShow.size() > 9 ? allByIsHotAndIsShow.subList(0,8) : allByIsHotAndIsShow;


  }
  /**
   * 后台修改视频对象后，同步到全局变量
   * @param videoList
   */
  public static void setVideoList(List<VideoVO> videoList) {
    preLoadData.put("videoVo",videoList);
  }
  public static void setIndexVideoList(List<Video> videoList) {
    if (videoList.size()>9){
      videoList =videoList.subList(0,9);
    }
    preLoadData.put("indexVideoVoList",videoList);
  }
}
