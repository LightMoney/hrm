package cn.fan.domain.company;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * TODO
 *
 * @author HTHLKJ
 * @version 1.0
 * @date 2021/5/11 9:34
 */
@Data
@NoArgsConstructor
public class DeptListResult {

    private String companyId;
    private String companyName;
    private String companyManage;

    private List<Department> depts;

    public DeptListResult(CoCompanyEntity one, List<Department> all) {
        this.companyId = one.getId();
        this.companyName = one.getName();
        this.companyManage = one.getLegalRepresentative();
        this.depts = all;

    }
}
