package com.qvainside.CapstoneProject.database.dao;


import com.qvainside.CapstoneProject.database.entity.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRoleDAO extends JpaRepository<UserRole, Long> {
    List<UserRole> findByCustomerId(Integer customerId);

    @Query(value = "SELECT COUNT(*) > 0 " +
            "FROM qvainside_capstone.user_roles " +
            "WHERE customer_id = :customerId AND role_name = :roleName",
            nativeQuery = true)
    Boolean existsByCustomerIdAndRoleName(@Param("customerId") Integer customerId,
                                          @Param("roleName") String roleName);
}
