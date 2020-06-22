package com.example.service;

import com.example.vo.CategoryVo;
import com.example.vo.ResponseVo;

import java.util.List;

public interface ICategoryService {
    /**
     * 选择分类
     *
     * @return 所有分类
     */
    ResponseVo<List<CategoryVo>> selectAll();
}
