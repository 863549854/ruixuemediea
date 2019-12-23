package com.ruixuemedia.site.utils;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import java.util.HashMap;
import java.util.Map;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */

public class AliyunMessageUtil {

  private static final String product = "Dysmsapi";
  //产品域名,开发者无需替换
  private static final String domain = "dysmsapi.aliyuncs.com";

  // 此处需要替换成开发者自己的AK(在阿里云访问控制台寻找)
  private static final String accessKeyId = "LTAIKAmvURrLHoTh";
  private static final String accessKeySecret = "95qkDMLPFe8BF1KBODeaZvXNhEWgsb";

  public static SendSmsResponse sendSms(Map<String, String> paramMap) throws com.aliyuncs.exceptions.ClientException {

    //可自助调整超时时间
    System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
    System.setProperty("sun.net.client.defaultReadTimeout", "10000");

    //初始化acsClient,暂不支持region化
    IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
    DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
    IAcsClient acsClient = new DefaultAcsClient(profile);

    //组装请求对象-具体描述见控制台-文档部分内容
    SendSmsRequest request = new SendSmsRequest();
    //必填:待发送手机号
    request.setPhoneNumbers(paramMap.get("phoneNumber"));
    //必填:短信签名-可在短信控制台中找到
    request.setSignName(paramMap.get("msgSign"));
    //必填:短信模板-可在短信控制台中找到
    request.setTemplateCode(paramMap.get("templateCode"));
    //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
    request.setTemplateParam(paramMap.get("jsonContent"));

    //选填-上行短信扩展码(无特殊需求用户请忽略此字段)
//        request.setSmsUpExtendCode(paramMap.get("extendCode"));

    //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
//        request.setOutId(paramMap.get("outId"));

    //hint 此处可能会抛出异常，注意catch
    SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
    return sendSmsResponse;
  }
  public static String sendMsg()  throws Exception {
    String phoneNumber = "13125211347";
    String randomNum = createRandomNum(6);
    String jsonContent = "{\"tel\":\"13125211348\",\"addr\":\"北京\"}";

    Map<String, String> paramMap = new HashMap<>();
    paramMap.put("phoneNumber", phoneNumber);
//    paramMap.put("msgSign", "t");
    paramMap.put("templateCode", "SMS_144146859");
    paramMap.put("jsonContent", jsonContent);
    SendSmsResponse sendSmsResponse = AliyunMessageUtil.sendSms(paramMap);
    System.out.println(sendSmsResponse.getMessage());
    if(!(sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK"))) {
      if(sendSmsResponse.getCode() == null) {
        //这里可以抛出自定义异常
      }
      if(!sendSmsResponse.getCode().equals("OK")) {
        //这里可以抛出自定义异常
      }
    }
    return "OK";
  }

  public static void main(String[] args) throws Exception {
   String result = sendMsg();
    System.out.println(result);
  }

  /**
   * 生成随机数
   * @param num 位数
   * @return
   */
  public static String createRandomNum(int num){
    String randomNumStr = "";
    for(int i = 0; i < num;i ++){
      int randomNum = (int)(Math.random() * 10);
      randomNumStr += randomNum;
    }
    return randomNumStr;
  }
}
