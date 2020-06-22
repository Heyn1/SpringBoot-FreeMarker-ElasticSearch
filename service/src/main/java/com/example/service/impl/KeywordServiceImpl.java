package com.example.service.impl;

import com.example.dao.KeywordMapper;
import com.example.entity.Category;
import com.example.entity.Keyword;
import com.example.service.IKeywordService;
import com.example.vo.CategoryVo;
import com.example.vo.KeywordVo;
import com.example.vo.ResponseVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author yurunyu
 * @date 2020/5/16
 */
@Service
public class KeywordServiceImpl implements IKeywordService {

    @Autowired
    private KeywordMapper keywordMapper;

    @Override
    public ResponseVo<List<KeywordVo>> selectAll() {
        List<Keyword> keywords = keywordMapper.selectAll();
        List<KeywordVo> keywordVoList = new ArrayList<>();
        for (Keyword keyword : keywords) {
            KeywordVo keywordVo = new KeywordVo();
            BeanUtils.copyProperties(keyword, keywordVo);
            keywordVoList.add(keywordVo);
        }
        return ResponseVo.success(keywordVoList);
    }
}
