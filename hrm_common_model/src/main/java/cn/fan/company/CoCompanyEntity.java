package cn.fan.company;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Objects;

/**
 * jpa注解
 *  映射表和实体类的关系（@Table）
 *  字段和属性的映射（@Id   @column （如果字段对应可省略））
 *
 * @author HTHLKJ
 * @version 1.0
 * @date 2021/5/7 17:56
 */
@Data
@Entity
@Table(name = "co_company")
//@AllArgsConstructor
public class CoCompanyEntity implements Serializable {
    @Id
    private String id;
    private String name;
    private String managerId;
    private String version;
    private Date renewalDate;
    private Date expirationDate;
    private String companyArea;
    private String companyAddress;
    private String businessLicenseId;
    private String legalRepresentative;
    private String companyPhone;
    private String mailbox;
    private String companySize;
    private String industry;
    private String remarks;
    private String auditState;
    private Integer state;
    private Double balance;
    private Date createTime;

}
