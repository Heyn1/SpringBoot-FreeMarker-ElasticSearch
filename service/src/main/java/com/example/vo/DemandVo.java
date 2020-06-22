package com.example.vo;

import lombok.Data;

import java.util.Date;

@Data
public class DemandVo {

    private Integer id;

    private String demandTitle;

    private String demandType;

    private String companyName;

    private String money;

    private Date createTime;

    private String phone;

    private String demandDetail;

}