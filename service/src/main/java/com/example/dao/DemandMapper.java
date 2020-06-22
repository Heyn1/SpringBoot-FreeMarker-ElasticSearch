package com.example.dao;

import com.example.entity.Demand;

import java.util.List;

public interface DemandMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Demand record);

    int insertSelective(Demand record);

    Demand selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Demand record);

    int updateByPrimaryKey(Demand record);

    List<Demand> selectByCategoryId(Integer categoryId);

    List<Demand> selectByKeyWord(String keyWord);

    List<Demand> selectByIdList(List idList);
}