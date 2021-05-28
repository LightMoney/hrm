package cn.fan.domain.system;

import com.alibaba.excel.annotation.ExcelProperty;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 用户实体类
 */
@Entity
@Table(name = "bs_user")
@Getter
@Setter
public class User implements Serializable {
    private static final long serialVersionUID = 4297464181093070302L;

    public User(List list) {
        this.username = (String) list.get(0);
        this.mobile = (String) list.get(1);
        this.workNumber = list.get(2).toString();
        this.formOfEmployment = ((Double) list.get(3)).intValue();
        this.timeOfEntry = (Date) list.get(4);
        this.departmentId = (String) list.get(5);
    }

    /**
     * ID
     */
    @Id
    private String id;
    /**
     * 手机号码
     */
    @ExcelProperty(index = 2)
    private String mobile;
    /**
     * 用户名称
     */
    @ExcelProperty(index = 1)
    private String username;
    /**
     * 密码
     */
    private String password;

    /**
     * 启用状态 0为禁用 1为启用
     */
    private Integer enableState;
    /**
     * 创建时间
     */
    private Date createTime;

    private String companyId;

    private String companyName;

    /**
     * 部门ID
     */
    @ExcelProperty(index = 6)
    private String departmentId;

    /**
     * 入职时间
     */
    @ExcelProperty(index = 5)
    private Date timeOfEntry;

    /**
     * 聘用形式
     */
    @ExcelProperty(index = 4)
    private Integer formOfEmployment;

    /**
     * 工号
     */
    @ExcelProperty(index = 3)
    private String workNumber;

    /**
     * 管理形式
     */
    private String formOfManagement;

    /**
     * 工作城市
     */
    private String workingCity;

    /**
     * 转正时间
     */
    private Date correctionTime;

    /**
     * 在职状态 1.在职  2.离职
     */
    private Integer inServiceStatus;

    private String departmentName;
    /**
     * saasAdmin: saas有所有权限
     * coAdmin:企业管理员（创建租户时创建）
     * user: 普通用户需要分配角色
     */
    private String level;

    /**
     * @JsonIgnore 忽略转换为json  避免多对多对象中转换的死循环
     */
    @ManyToMany
    @JsonIgnore
    @JoinTable(name = "pe_user_role", joinColumns = {@JoinColumn(name = "user_id", referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "role_id", referencedColumnName = "id")}
    )
    private Set<Role> roles = new HashSet<Role>();//用户与角色   多对多

    public User() {
    }
}
