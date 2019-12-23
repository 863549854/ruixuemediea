package com.ruixuemedia.site;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RuixuemediaApplicationTests {

  @Test
  public void contextLoads() {

    StringBuffer sb = new StringBuffer(1111112);

    System.out.println(sb.substring(0,sb.length()-1));

  }


  public static void main(String[] args) {
//    StringBuffer sb = new StringBuffer(1111112);
    String sb = "111111111";
    System.out.println(sb);
//    System.out.println(sb.substring(0,sb.length()));
  }

}
