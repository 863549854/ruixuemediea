package com.ruixuemedia.site.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "rx_video")
public class Video {
  @Id
  @Column(name = "id")
private String id;
  @Column(name = "cover_src")
  private String coverSrc;
  @Column(name = "video_src")
  private String videoSrc;
  @Column(name = "head")
  private String head;
  @Column(name = "video_desc")
  private String desc;
  @Column(name = "uploadDate")
  private String uploadDate;
  @Column(name = "is_hot")
  private Integer isHot;
  @Column(name = "is_show")
  private Integer isShow;
  @Column(name = "video_type")
  private String videoType;
}
