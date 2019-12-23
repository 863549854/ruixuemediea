package com.ruixuemedia.site.repository;

import com.ruixuemedia.site.entity.Admin;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author <a href="mailto:kzysure@kzysure.com">kzysure</a>
 * @version 1.0.0
 * @since 1.0.0
 */
public interface AdminRepository extends JpaRepository<Admin,String> {
List<Admin> findAdminsByUsernameAndPassword(String username,String password);
}
