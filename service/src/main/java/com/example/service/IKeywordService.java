package com.example.service;

import com.example.entity.Keyword;
import com.example.vo.KeywordVo;
import com.example.vo.ResponseVo;

import java.util.List;

/**
 * @author yurunyu
 * @date 2020/5/16
 */
public interface IKeywordService {
    /**
     * 选择关键词下内容
     *
     * @return 选择关键词下内容
     */
    ResponseVo<List<KeywordVo>> selectAll();
}