package cn.fan.dept.service;

import cn.fan.company.Department;
import cn.fan.dept.dao.DeptDao;
import cn.fan.service.BaseService;
import cn.fan.util.OnlyIdUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.validation.constraints.Max;
import java.util.List;

/**
 * TODO
 *
 * @author HTHLKJ
 * @version 1.0
 * @date 2021/5/10 17:30
 */
@Service
public class DeptService extends BaseService {

    @Autowired
    private DeptDao deptDao;

    public void addDept(Department department) {
        department.setId(OnlyIdUtil.generate("D"));
        Department save = deptDao.save(department);
    }

    public void update(Department department) {
        deptDao.save(department);
    }

    public void delete(String id) {
        deptDao.deleteById(id);
    }

    public Department findOne(String id) {
        return deptDao.findById(id).get();
    }

    public List<Department> findAll(String companyId) {
//        Specification<Department> specification = new Specification<Department>() {
//
//            //用户条件构造
////            root   包含所有对象数据
////            criteriaQuery     高级查询   一般不用
////            criteriaBuilder  构造查询条件
//            @Override
//            public Predicate toPredicate(Root<Department> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
//                return criteriaBuilder.equal(root.get("companyId").as(String.class), companyId);
//            }
//        };
        return deptDao.findAll(this.getSpec(companyId));
    }
}
