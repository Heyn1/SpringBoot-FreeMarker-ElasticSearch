package com.example.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.example.dao.DemandMapper;
import com.example.entity.Demand;
import com.example.service.ICategoryService;
import com.example.service.IDemandService;
import com.example.vo.DemandVo;
import com.example.vo.ResponseVo;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

@Service
public class DemandServiceImpl implements IDemandService {

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private RestHighLevelClient highLevelClient;

    @Autowired
    private DemandMapper demandMapper;

    @Override
    public ResponseVo<PageInfo> searchByCategory(Integer categoryId, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Demand> demandList = demandMapper.selectByCategoryId(categoryId);
        List<DemandVo> demandVoList = demandList.stream()
                .map(e -> {
                    DemandVo demandVo = new DemandVo();
                    BeanUtils.copyProperties(e, demandVo);
                    return demandVo;
                })
                .collect(Collectors.toList());

        PageInfo pageInfo = new PageInfo<>(demandList);
        pageInfo.setList(demandVoList);
        return ResponseVo.success(pageInfo);
    }

    @Override
    public ResponseVo<PageInfo> searchByKeyword(String keyWord, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Demand> demandList = demandMapper.selectByKeyWord(keyWord);
        List<DemandVo> demandVoList = demandList.stream()
                .map(e -> {
                    DemandVo demandVo = new DemandVo();
                    BeanUtils.copyProperties(e, demandVo);
                    return demandVo;
                })
                .collect(Collectors.toList());

        PageInfo pageInfo = new PageInfo<>(demandList);
        pageInfo.setList(demandVoList);
        return ResponseVo.success(pageInfo);
    }

    @Override
    public List<Integer> searchByEsPreStep(String keyword) throws IOException {
        SearchRequest searchRequest = new SearchRequest("demand");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
        sourceBuilder.size(200);
        sourceBuilder.query(QueryBuilders.multiMatchQuery(keyword, "demand_title", "demand_detail"));
        sourceBuilder.timeout(new TimeValue(60, TimeUnit.SECONDS));
        searchRequest.source(sourceBuilder);
        List<Integer> demandIdList = new ArrayList<>();
        SearchResponse searchResponse = highLevelClient.search(searchRequest, RequestOptions.DEFAULT);
        SearchHit[] hits = searchResponse.getHits().getHits();
        for (SearchHit hit : hits) {
            demandIdList.add(new Integer(hit.getSourceAsMap().get("id").toString()));
        }
        return demandIdList;
    }


    @Override
    public ResponseVo<PageInfo> searchByEs(String keyword, Integer pageNum, Integer pageSize) throws IOException {
        List<Integer> demandIdList = searchByEsPreStep(keyword);
        PageHelper.startPage(pageNum, pageSize);
        List<Demand> demandList = demandMapper.selectByIdList(demandIdList);
        List<DemandVo> demandVoList = demandList.stream()
                .map(e -> {
                    DemandVo demandVo = new DemandVo();
                    BeanUtils.copyProperties(e, demandVo);
                    return demandVo;
                })
                .collect(Collectors.toList());
        PageInfo pageInfo = new PageInfo<>(demandList);
        pageInfo.setList(demandVoList);
        return ResponseVo.success(pageInfo);
    }

    @Override
    public List<Demand> searchByEs4HotSpot(String keyword) throws IOException {
        List<Integer> demandIdList = searchByEsPreStep(keyword);
        List<Demand> demandList = demandMapper.selectByIdList(demandIdList);
        return demandList;
    }

    @Override
    public List<Demand> test(List idList) {
        List<Demand> demands = demandMapper.selectByIdList(idList);
        return demands;
    }

}
