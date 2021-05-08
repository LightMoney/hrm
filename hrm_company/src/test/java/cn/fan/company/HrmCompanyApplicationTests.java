package cn.fan.company;


import cn.fan.company.dao.CompanyDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@RunWith(SpringRunner.class)
 public class HrmCompanyApplicationTests {

    @Autowired
    private CompanyDao dao;

    @Test
    public void contextLoads() {
//        getOne 在2.0.5版本后会有懒加载问题使用 可使用findByid
//        CoCompanyEntity one = dao.getOne("1");
        CoCompanyEntity coCompanyEntity = dao.findById("1").get();
        System.out.println( coCompanyEntity.toString());
        CoCompanyEntity save = dao.save(coCompanyEntity);
    }

}
