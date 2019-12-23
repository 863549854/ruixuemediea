package com.ruixuemedia.site.entity;

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
@Table(name = "all_info")
public class AllInfo {
@Id
private String id;
@Column(name = "tel")
private String tel;
  @Column(name = "wechat_icon")
  private String wechatIcon;
  @Column(name = "qq_icon")
  private String qqIcon;
  @Column(name = "weibo_icon")
  private String weiboIcon;
  @Column(name = "kefu_email")
  private String kefuEmail;
  @Column(name = "addr")
  private String addr;
}
