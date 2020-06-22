package com.example.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Category {
    private Integer categoryId;

    private String category;

    private Integer sortOrder;

    private Integer status;

    private Date createTime;

    private Date updateTime;

}