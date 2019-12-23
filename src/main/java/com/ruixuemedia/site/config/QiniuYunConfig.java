package com.ruixuemedia.site.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@Data
@Component
@ConfigurationProperties(prefix = "qiniu")
public class QiniuYunConfig {
  private String accessKey;

  private String secretKey;

  private String bucket;

  private String path;
  private String staticUrl;
}

