package com.example.dao;

import com.example.entity.Demand;
import com.example.entity.Plot;
import com.example.entity.Term;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
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

    List<Demand> selectByCompany(String company);

    List<Demand> selectByIdList(@Param("list") List idList,
                                @Param("longitude") BigDecimal longitude,
                                @Param("latitude") BigDecimal latitude,
                                @Param("orderby")Integer orderby);

    List<Plot> selectPlotData();

    Demand selectByTitle(@Param("title") String demandTitle,
                         @Param("company") String companyName);

    Term selectById4Intro(@Param("id") Integer id);
}