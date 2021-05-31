package cn.fan.service;

import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 * 抽取的公共条件
 *
 * @author HTHLKJ
 * @version 1.0
 * @date 2021/5/11 9:50
 */
public class BaseService<T> {

    public Specification<T> getSpec(String companyId) {
        Specification<T> specification = new Specification<T>() {

            //用户条件构造
//            root   包含所有对象数据
//            criteriaQuery     高级查询   一般不用
//            criteriaBuilder  构造查询条件
            @Override
            public Predicate toPredicate(Root<T> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                return criteriaBuilder.equal(root.get("companyId").as(String.class), companyId);
            }
        };
        return specification;
    }


}
