package com.example.service;

import com.example.entity.Plot;
import com.example.entity.Term;
import com.github.pagehelper.PageInfo;
import com.example.entity.Demand;
import com.example.vo.DemandVo;
import com.example.vo.ResponseVo;
//import com.sun.org.apache.xerces.internal.xs.StringList;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

public interface IDemandService {
    /**
     * @param categoryId 分类id
     * @param pageNum    页数
     * @param pageSize   页码大小
     * @return 需求
     */
    ResponseVo<PageInfo> searchByCategory(Integer categoryId, Integer pageNum, Integer pageSize);

    /**
     * 通过关键词搜索需求,利用mysql进行搜索
     *
     * @param keyWord  关键词
     * @param pageNum  页数
     * @param pageSize 页码大小
     * @return 需求
     */
    ResponseVo<PageInfo> searchByKeyword(String keyWord, Integer pageNum, Integer pageSize);

    ResponseVo<PageInfo> searchByCompany(String Company, Integer pageNum, Integer pageSize);

    List<Demand> searchByEs4HotSpot(String keyword, String categoryId, Integer order, BigDecimal latitude, BigDecimal longitude, Integer function) throws IOException;


    /**
     * 通过es进行搜索,分成两个阶段,首先从es中检索到要用的数据,返回一个主键的list,再传递给mysql进行查询
     * @param keyword 关键词 order 排序选项：0：综合,1：相关度,2：时间,3：距离,4：企业信用
     * @return list,内容为检索到的记录的主键
     * @throws IOException IO异常
     */
    List<Integer> searchByEsPreStep(String keyword, String categoryId, Integer order, BigDecimal latitude, BigDecimal longitude, Integer function) throws IOException;

    /**
     * 通过es搜索的第二个阶段,在mysql中查询需要的数据
     * @param keyword 关键词
     * @param pageNum 页数
     * @param pageSize 页码大小
     * @return 需求
     * @throws IOException IO异常
     */
    ResponseVo<PageInfo> searchByEs(String keyword, String categoryId, Integer pageNum, Integer pageSize,
                                    BigDecimal longitude, BigDecimal latitude, Integer order, Integer function) throws IOException;

    List<Plot> plot();

    Demand searchByTitle4Info(String demandTitle, String companyName) throws IOException;

    Term searchById4Intro(Integer id) throws IOException;
}
