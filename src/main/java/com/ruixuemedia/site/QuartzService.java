package com.ruixuemedia.site;

import com.ruixuemedia.site.config.RxMediaConfig;
import com.ruixuemedia.site.entity.ViewCount;
import com.ruixuemedia.site.repository.ViewCountRepository;
import com.ruixuemedia.site.utils.PreLoadUtil;
import com.ruixuemedia.site.utils.org.n3r.idworker.Sid;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Vector;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
@Component
@Slf4j
public class QuartzService {

}
