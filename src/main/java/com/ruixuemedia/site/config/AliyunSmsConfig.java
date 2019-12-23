package com.ruixuemedia.site.config;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@Slf4j
@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
@ConfigurationProperties(prefix = "aliyun.sms")
public class AliyunSmsConfig {


  private String accessKeyId;
  private String accessKeySecret;
  private String product;
  private String domain;
  private String regionId;
  private String signName;
  private String dateFormat;
  private String endpointName;

}