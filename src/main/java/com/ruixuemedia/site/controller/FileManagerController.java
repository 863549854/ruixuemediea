package com.ruixuemedia.site.controller;

import com.ruixuemedia.site.utils.JSONResult;
import com.ruixuemedia.site.utils.QiniuFileUtil;
import com.ruixuemedia.site.utils.org.n3r.idworker.Sid;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@RestController
@RequestMapping("/file")
public class FileManagerController {
  @Autowired
  private QiniuFileUtil qiniuFileUtil;
  @Autowired
  private Sid sid;
@PostMapping("/uploadVideo")
  public JSONResult uploadVideo(MultipartFile file){
  String filename = file.getOriginalFilename();
  String suffix = filename.substring(filename.lastIndexOf('.'));
  String key =UUID.randomUUID().toString()+suffix;
  byte [] byteArr=null;
  try{
    byteArr=file.getBytes();

  }catch (IOException e){
    e.printStackTrace();
  }
 Boolean success = qiniuFileUtil.uploadFile(byteArr,key);
  if (success){
    System.out.println("上传成功");
    return JSONResult.ok();
  }else {
    System.out.println("上传失败");
    return JSONResult.errorMsg("上传失败!");
  }
}

}

