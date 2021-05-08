package cn.fan.company.service;

import cn.fan.company.CoCompanyEntity;
import cn.fan.company.dao.CompanyDao;
import cn.fan.util.IdWorker;
import cn.fan.util.OnlyIdUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.support.SimpleTriggerContext;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * TODO
 *
 * @author HTHLKJ
 * @version 1.0
 * @date 2021/5/8 9:27
 */
@Service
public class CompanyService {

    @Autowired
    private CompanyDao dao;


    public CoCompanyEntity addCompany(CoCompanyEntity c) {
        c.setId(OnlyIdUtil.generate("C"));
        c.setAuditState("1");//0未审核   1已审核
        c.setState(0);//0未激活 1已激活
        return dao.save(c);
    }


    public void updateCompany(CoCompanyEntity c) {
        //会根据有无id来进行执行
        dao.save(c);
    }


    public void delete(String id) {
        dao.deleteById(id);
    }

    public CoCompanyEntity findOne(String id) {
        return dao.findById(id).get();
    }

    public List<CoCompanyEntity> findAll() {
        return dao.findAll();
    }
}
