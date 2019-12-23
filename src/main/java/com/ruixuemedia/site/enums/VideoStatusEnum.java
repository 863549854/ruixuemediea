package com.ruixuemedia.site.enums;

import lombok.Getter;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */

@Getter
public enum VideoStatusEnum {
  /**
   * 展示中
   */
  SHOW(1,"展示中"),
  /**
   * 未展示
   */
  HIDDEN(0,"未展示");
private Integer code;
private String msg;

  VideoStatusEnum(Integer code,String msg) {
    this.code=code;
    this.msg=msg;
  }

}
