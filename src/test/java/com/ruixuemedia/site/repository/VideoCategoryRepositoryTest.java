package com.ruixuemedia.site.repository;

import static org.junit.Assert.*;

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
public class VideoCategoryRepositoryTest {
@Autowired VideoCategoryRepository videoCategoryRepository;
@Test
  public void testVideoCategory(){

  System.out.println(videoCategoryRepository.findAll().size());
}
}