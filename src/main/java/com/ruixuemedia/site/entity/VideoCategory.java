package com.ruixuemedia.site.entity;

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
@Table(name = "rx_video_category")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class VideoCategory {
@Id
  private String id;
private String name;
}
