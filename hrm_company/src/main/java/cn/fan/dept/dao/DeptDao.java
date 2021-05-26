package cn.fan.dept.dao;

import cn.fan.domain.company.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

/**
 * TODO
 *
 * @author HTHLKJ
 * @version 1.0
 * @date 2021/5/10 17:24
 */
@Repository
public interface DeptDao extends JpaRepository<Department, String>, JpaSpecificationExecutor<Department> {
    public Department findByCodeAndAndCompanyId(String code, String companyId);
}
