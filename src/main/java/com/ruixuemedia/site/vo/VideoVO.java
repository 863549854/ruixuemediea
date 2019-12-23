package com.ruixuemedia.site.vo;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class VideoVO {
  private String id;
  private String coverSrc;
  private String videoSrc;
  private String head;
  private String desc;
  private String uploadDate;
  private Integer isShow;
  private Integer isHot;
  private String videoType;
  private String cateName;
}
