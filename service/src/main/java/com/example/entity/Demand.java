package com.example.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
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

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    private String phone;

    private String category;

    private String demandDetail;

    public Date getCreateTime() {
        return createTime;
    }

    public String getCategory() {
        return category;
    }
}
