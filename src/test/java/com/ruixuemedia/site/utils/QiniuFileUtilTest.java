package com.ruixuemedia.site.utils;

import static org.junit.Assert.*;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class QiniuFileUtilTest {
  @Autowired private QiniuFileUtil qiniuFileUtil;
  @Test
  public void testupload(){

//    qiniuFileUtil.uploadFile();


    try {
      FileInputStream file = new FileInputStream("C:\\Users\\msi-pc\\Desktop\\报表地址.txt");
      qiniuFileUtil.uploadSingleFile(file,"");
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    }


    byte[] bytes = null;
  try {
    bytes = "hello qiniu cloud".getBytes("utf-8");

  }catch (UnsupportedEncodingException e)
  {
    e.printStackTrace();
  }
  Boolean success = qiniuFileUtil.uploadFile(bytes,"/resources/static/ruixuemedia/testname.txt");
  Assert.assertTrue(success);
}

}