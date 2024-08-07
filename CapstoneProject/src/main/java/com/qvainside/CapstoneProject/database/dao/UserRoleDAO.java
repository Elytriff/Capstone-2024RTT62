package com.qvainside.CapstoneProject.database.dao;


import com.qvainside.CapstoneProject.database.entity.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRoleDAO extends JpaRepository<UserRole, Long> {
    List<UserRole> findByCustomerId(Integer customerId);
}
