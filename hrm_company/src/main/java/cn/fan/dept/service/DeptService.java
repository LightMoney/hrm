package cn.fan.dept.service;

import cn.fan.company.Department;
import cn.fan.dept.dao.DeptDao;
import cn.fan.util.OnlyIdUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
public class DeptService {

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

    public List<Department> findAll() {
        return deptDao.findAll();
    }
}
