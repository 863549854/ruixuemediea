package com.ruixuemedia.site.repository;

import com.ruixuemedia.site.entity.Video;
import com.ruixuemedia.site.entity.VideoCategory;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
public interface VideoCategoryRepository extends JpaRepository<VideoCategory,String> {

}
