package com.ruixuemedia.site.utils;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import com.ruixuemedia.site.config.QiniuYunConfig;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@Service
public class QiniuFileUtil {

  @Autowired
  private QiniuYunConfig qiniuYunConfig;

  /**
   * 获取上传凭证
   */
  private String createUploadToken() {
    Auth auth = Auth.create(qiniuYunConfig.getAccessKey(), qiniuYunConfig.getSecretKey());
    return auth.uploadToken(qiniuYunConfig.getBucket());
  }

  /**
   * 构造上传代理
   */
  private UploadManager buildManager() {
    //构造一个带指定Zone对象的配置类
    Configuration cfg = new Configuration(Zone.zone0());
    //...其他参数参考类注释
    UploadManager uploadManager = new UploadManager(cfg);
    return uploadManager;
  }

  /**
   * 本地路径上传
   */
  public void uploadFile(String localFilePath) {
    UploadManager uploadManager = buildManager();
    String uploadToken = createUploadToken();
    //默认不指定key的情况下，以文件内容的hash值作为文件名
    String key = null;
    try {
      Response response = uploadManager.put(localFilePath, key, uploadToken);
      //解析上传成功的结果
      DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
      System.out.println(putRet.key);
      System.out.println(putRet.hash);
    } catch (QiniuException ex) {
      Response r = ex.response;
      System.err.println(r.toString());
      try {
        System.err.println(r.bodyString());
      } catch (QiniuException ex2) {
        //ignore
      }
    }

  }

  /**
   * 字节流上传
   */
  public Boolean uploadFile(byte[] uploadBytes, String key) {
    try {
      UploadManager uploadManager = buildManager();
      String uploadToken = createUploadToken();
      try {
        Response response = uploadManager.put(uploadBytes, key, uploadToken);
        //解析上传成功的结果
        DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
        System.out.println(putRet.key);
        System.out.println(putRet.hash);
        if (putRet.key != null) {
          return true;
        } else {
          return false;
        }
      } catch (QiniuException ex) {
        Response r = ex.response;
        System.err.println(r.toString());
        try {
          System.err.println(r.bodyString());
        } catch (QiniuException ex2) {
          //ignore
        }
        return false;
      }
    } catch (Exception ex) {
      return false;
      //ignore
    }
  }

  public Boolean upload(File uploadPictureFile, String key) throws IOException {

    try {
      UploadManager uploadManager = buildManager();
      String uploadToken = createUploadToken();
      //调用put方法上传
      Response res = uploadManager.put(uploadPictureFile, key, uploadToken);
      //打印返回的信息
//      return res.bodyString();
      return false;
    } catch (QiniuException e) {
      e.printStackTrace();
      Response r = e.response;
      // 请求失败时打印的异常的信息
      System.out.println(r.toString());
      try {
        //响应的文本信息
        System.out.println(r.bodyString());
      } catch (QiniuException e1) {
        //ignore
      }
      return true;
    }
  }

  /**
   * 将单个文件上传到七牛云
   */
  public String uploadSingleFile(FileInputStream file, String key) {
    // 构造一个带指定Zone对象的配置类
    Configuration cfg = new Configuration(Zone.zone0());
    // 其他参数参考类注释
    UploadManager uploadManager = new UploadManager(cfg);
    // 生成上传凭证，然后准备上传

    try {
      Auth auth = Auth.create(qiniuYunConfig.getAccessKey(),
              qiniuYunConfig.getSecretKey());
      String upToken = auth.uploadToken(qiniuYunConfig.getBucket());
      try {
        Response response = uploadManager.put(file, key, upToken, null, null);
        // 解析上传成功的结果
        DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);

        String returnPath = putRet.key;
        return returnPath;
      } catch (QiniuException ex) {
        Response r = ex.response;
        System.err.println(r.toString());
        try {
          System.err.println(r.bodyString());
        } catch (QiniuException ex2) {
          //ignore
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "";
  }
  public Boolean deleteQiniuYunFile(String key){
    //构造一个带指定Zone对象的配置类
    Configuration cfg = new Configuration(Zone.zone0());
    Auth auth = Auth.create("PpvCG-IijIU-sGDtkg1Dx7m7AuO4q0oCLmzm19Ly",
        "gBqzi4LWxXtQl6JuJIDeK5P6bVgF0fNl6JBWbLmu");
    BucketManager bucketManager = new BucketManager(auth, cfg);
    try {
      bucketManager.delete("ruixueyinghua", key);
    } catch (QiniuException ex) {
      //如果遇到异常，说明删除失败
      System.err.println(ex.code());
      System.err.println(ex.response.toString());
      return false;
    }
    return true;
  }
  public String getToken(){
    return createUploadToken();
  }
}
