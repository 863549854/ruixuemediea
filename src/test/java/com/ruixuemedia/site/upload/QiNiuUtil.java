package com.ruixuemedia.site.upload;

import com.ruixuemedia.site.upload.QiNiuContant;
import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;

import java.io.File;

public class QiNiuUtil {

    public static String getUpToken(){
        Auth auth = Auth.create(QiNiuContant.AccessKey, QiNiuContant.SecretKey);
        String uptoken = auth.uploadToken("rxyhhn");
        return uptoken;
    }

    public static void  upload(String key, String localPath) {
        Configuration cfg = new Configuration(Zone.zone2());//设置华南的服务器
        UploadManager uploadManager = new UploadManager(cfg);

        String upToken = getUpToken();
        try {
            Response response = uploadManager.put(localPath, key, upToken);
            //解析上传成功的结果
            DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
            System.out.println(putRet.key);
            System.out.println(putRet.hash);
        }catch (QiniuException e){
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws Exception{

        ReadFile.readfile("G:\\GitHub\\ruixuemedia\\code\\code\\ruixuemedia\\src\\main\\resources");

    }

}
