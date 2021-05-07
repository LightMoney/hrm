package cn.fan.company;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Objects;

/**
 * TODO
 *
 * @author HTHLKJ
 * @version 1.0
 * @date 2021/5/7 17:56
 */
@Data
@Entity
@Table(name = "co_company")
public class CoCompanyEntity implements Serializable {
    @Id
    private String id;
    private String name;
    private String managerId;
    private String version;
    private Timestamp renewalDate;
    private Timestamp expirationDate;
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
    private byte state;
    private double balance;
    private Timestamp createTime;

}
