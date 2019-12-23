package com.ruixuemedia.site.repository;


import com.ruixuemedia.site.entity.Video;
import com.ruixuemedia.site.enums.VideoStatusEnum;
import com.ruixuemedia.site.vo.VideoVO;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder.In;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
public interface VideoRepository extends JpaRepository<Video,String> {
  @Query(value = "SELECT v.*,c.name as cate_name FROM rx_video v LEFT JOIN rx_video_category c ON v.video_type = c.id WHERE v.is_show = 1;", nativeQuery = true)
  List<Object> findAllIsShowVideo();
  @Query(value = "SELECT v.*,c.name as cate_name FROM rx_video v LEFT JOIN rx_video_category c ON v.video_type = c.id ;", nativeQuery = true)
  List<Object> findVideoVoAll();
  @Transactional
  @Modifying
  @Query("delete from Video vi where vi.id = ?1")
   int deleteOneById(String id);

  /**
   * 通过视频类型查找
   * @param videoType
   * @return
   */
  List<Video> findAllByVideoType(String videoType);

  /**
   * 查看首页视频
   * @param isHot
   * @param isShow
   * @return
   */
  List<Video> findAllByIsHotAndIsShow(Integer isHot, Integer isShow);

}
