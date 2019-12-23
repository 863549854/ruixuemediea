package com.ruixuemedia.site.entity;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 访问量实体
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "rx_view_count")
public class ViewCount {
@Id
private String id;
private BigDecimal count;
@Column(name = "view_time")
private Date viewTime;
}
