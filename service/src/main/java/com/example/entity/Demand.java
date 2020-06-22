package com.example.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Demand {
    private Integer id;

    private String demandTitle;

    private Integer categoryId;

    private String demandType;

    private String companyName;

    private String money;

    private Date createTime;

    private String phone;

    private String category;

    private String demandDetail;

}
