package com.ruixuemedia.site.config;

import static org.junit.Assert.*;

import javax.swing.Spring;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class QiniuYunConfigTest {
@Autowired
private QiniuYunConfig qiniuYunConfig;
  @Test
  public void getAccessKey() {
    System.out.println( qiniuYunConfig.getSecretKey());
    System.out.println( qiniuYunConfig.getAccessKey());

  }
}