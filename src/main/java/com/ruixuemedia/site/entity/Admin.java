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
@Table(name = "rx_admin")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
@Id
  private String id;
private String username;
private String password;
}
