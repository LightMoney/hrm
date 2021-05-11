package cn.fan.company.dao;

import cn.fan.domain.company.CoCompanyEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

/**
 * TODO
 *
 * @author HTHLKJ
 * @version 1.0
 * @date 2021/5/8 9:26
 */
@Repository
public interface CompanyDao extends JpaRepository<CoCompanyEntity,String> , JpaSpecificationExecutor<CoCompanyEntity> {
}
