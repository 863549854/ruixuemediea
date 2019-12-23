package com.ruixuemedia.site.vo;

import java.io.File;
import java.util.Date;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@Data
public class AddVideoVO {
  private MultipartFile cover;
  private MultipartFile video;
  private String head;
  private String desc;
  private String videoType;
}
