package com.ruixuemedia.site.repository;

import com.alibaba.fastjson.JSON;
import com.ruixuemedia.site.HttpClient;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class VideoRepositoryTest {
@Autowired private VideoRepository videoRepository;
@Autowired  private HttpClient httpClient;
@Test
  public void testFindAll() throws Exception{
//  List<Video> videoList =videoRepository.findAll();
//  System.out.println(videoList.size());
//  Assert.assertTrue(!videoList.isEmpty());
// Integer i= videoRepository.deleteOneById("11");
//  System.out.println(i);
// int i= videoRepository.deleteOneById("3287y");
//  System.out.println(i);

//  Video video = videoRepository.getOne("3287y");
//  System.out.println(video.toString());
//  Video video = videoRepository.getOne("3r43r");
//  video.setHead("紫薯味半熟芝士");
//  video.setIsShow(new Integer(0));
//  videoRepository.save(video);
  String jsapi ="http://api.jisuapi.com/sms/send?mobile=13125211347&content=您有新的客户留言，联系方式为17679101816，请尽快回电～【kzysure】&appkey=41e8d4be1729ff61";
  String url = "http://www.baidu.com";
  String fileStorePath = StringUtils.EMPTY;
  //请求参数
//  String data = "{\"courtId\":\"" + courtId + "\",\"sessionId\":\"" + seesionId + "\"}";
  //发送请求，获取结果
  String result = httpClient.doPost(jsapi,"");
  if(StringUtils.isNotBlank(result)){
    System.out.println(result);
    com.alibaba.fastjson.JSONObject jsonobject = JSON.parseObject(result);
    fileStorePath = jsonobject.getString("msg");
    System.out.println(fileStorePath);
//    log.info("fileStorePath = " + fileStorePath);
  }
}

}