package com.example.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.example.entity.Plot;
import com.example.entity.Term;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.example.dao.DemandMapper;
import com.example.entity.Demand;
import com.example.service.ICategoryService;
import com.example.service.IDemandService;
import com.example.vo.DemandVo;
import com.example.vo.ResponseVo;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.util.EntityUtils;
import org.elasticsearch.client.Request;
import org.elasticsearch.client.Response;
import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import static com.example.consts.OrderConst.*;

@Service
@Slf4j
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
    public List<Integer> searchByEsPreStep(String keyword, String categoryId, Integer order,
                                           BigDecimal latitude, BigDecimal longitude, Integer function) throws IOException {
        Request request = new Request("GET","/demand_with_location/_search");
        JSONObject jsonRequestObj = new JSONObject();
        jsonRequestObj.put("_source","*");
        //构建自定义距离字段
        jsonRequestObj.put("script_fields",new JSONObject());
        jsonRequestObj.getJSONObject("script_fields").put("distance",new JSONObject());
        jsonRequestObj.getJSONObject("script_fields").getJSONObject("distance").put("script",new JSONObject());
        jsonRequestObj.getJSONObject("script_fields").getJSONObject("distance").getJSONObject("script")
                .put("source","haversin(lat, lon, doc['location'].lat, doc['location'].lon)");
        jsonRequestObj.getJSONObject("script_fields").getJSONObject("distance").getJSONObject("script")
                .put("lang","expression");
        jsonRequestObj.getJSONObject("script_fields").getJSONObject("distance").getJSONObject("script")
                .put("params",new JSONObject());
        jsonRequestObj.getJSONObject("script_fields").getJSONObject("distance").getJSONObject("script")
                .getJSONObject("params").put("lat",latitude);
        jsonRequestObj.getJSONObject("script_fields").getJSONObject("distance").getJSONObject("script")
                .getJSONObject("params").put("lon",longitude);

        jsonRequestObj.put("size", 200);
        jsonRequestObj.put("query", new JSONObject());
        jsonRequestObj.getJSONObject("query").put("function_score", new JSONObject());
        jsonRequestObj.getJSONObject("query").getJSONObject("function_score").put("query", new JSONObject());
        jsonRequestObj.getJSONObject("query").getJSONObject("function_score").getJSONObject("query").put("bool",new JSONObject());
        jsonRequestObj.getJSONObject("query").getJSONObject("function_score").getJSONObject("query").getJSONObject("bool").put("should",new JSONArray());
        jsonRequestObj.getJSONObject("query").getJSONObject("function_score").getJSONObject("query").getJSONObject("bool")
                .getJSONArray("should").add(new JSONObject());

        int zeroIndex = 0;
        jsonRequestObj.getJSONObject("query").getJSONObject("function_score").getJSONObject("query").getJSONObject("bool")
                .getJSONArray("should").getJSONObject(zeroIndex).put("match",new JSONObject());
        switch (function) {
            case 1:
                jsonRequestObj.getJSONObject("query").getJSONObject("function_score").getJSONObject("query").getJSONObject("bool")
                        .getJSONArray("should").getJSONObject(zeroIndex).getJSONObject("match").put("demand_title", keyword);
                break;
            case 2:
                jsonRequestObj.getJSONObject("query").getJSONObject("function_score").getJSONObject("query").getJSONObject("bool")
                        .getJSONArray("should").getJSONObject(zeroIndex).getJSONObject("match").put("company_name", keyword);
                break;
        }


        //排序字段
        if (order.equals(ORDER_BY_RELEVANT)) {
            log.info("order by relevant");
        } else if (order.equals(ORDER_BY_TIME)) {
            jsonRequestObj.put("sort", new JSONObject());
            jsonRequestObj.getJSONObject("sort").put("create_time", new JSONObject());
            jsonRequestObj.getJSONObject("sort").getJSONObject("create_time").put("order", "desc");
        } else if (order.equals(ORDER_BY_DISTANCE)) {
            jsonRequestObj.put("sort",new JSONArray());
            jsonRequestObj.getJSONArray("sort").add(new JSONObject());
            jsonRequestObj.getJSONArray("sort").getJSONObject(0).put("_score",new JSONObject());
            if(order == 0){
                jsonRequestObj.getJSONArray("sort").getJSONObject(0).getJSONObject("_score").put("order","desc");
            }else{
                jsonRequestObj.getJSONArray("sort").getJSONObject(0).getJSONObject("_score").put("order","asc");
            }
        } else if (order.equals(ORDER_BY_CREDIT)) {
            jsonRequestObj.put("sort", new JSONObject());
            jsonRequestObj.getJSONObject("sort").put("credit", new JSONObject());
            jsonRequestObj.getJSONObject("sort").getJSONObject("credit").put("order", "desc");
        }

        String reqJson = jsonRequestObj.toJSONString();
        System.out.println(reqJson);
        request.setJsonEntity(reqJson);
        Response response = highLevelClient.getLowLevelClient().performRequest(request);
        String responseStr = EntityUtils.toString(response.getEntity());
        JSONObject jsonObject = JSONObject.parseObject(responseStr);
        JSONArray jsonArr = jsonObject.getJSONObject("hits").getJSONArray("hits");
        List<Integer> demandIdList = new ArrayList<>();
        for(int i = 0; i < jsonArr.size(); i++){
            JSONObject jsonObj = jsonArr.getJSONObject(i);
            Integer id = new Integer(jsonObj.get("_id").toString());
            demandIdList.add(id);
        }
        return demandIdList;

    }


    @Override
    public ResponseVo<PageInfo> searchByEs(String keyword,String categoryId, Integer pageNum, Integer pageSize,
                                           BigDecimal longitude, BigDecimal latitude, Integer order, Integer function) throws IOException {
        List<Integer> demandIdList = searchByEsPreStep(keyword, categoryId, order, longitude, latitude, function);
        if (demandIdList.size() == 0) {
            return ResponseVo.success(new PageInfo<>());
        }
        log.info("demand Id List len {}", demandIdList.size());
        PageHelper.startPage(pageNum, pageSize);
        List<Demand> demandList = demandMapper.selectByIdList(demandIdList,
                longitude, latitude, order);
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
    public List<Demand> searchByEs4HotSpot(String keyword, String categoryId, Integer order, BigDecimal latitude, BigDecimal longitude, Integer function) throws IOException {
        List<Integer> demandIdList = searchByEsPreStep(keyword,categoryId,order,latitude,longitude, function);
        if (demandIdList.size() == 0) {
            return new ArrayList<Demand>();
        }
        List<Demand> demandList = demandMapper.selectByIdList(demandIdList,longitude,latitude,order);
        return demandList;
    }

    @Override
    public List<Plot> plot() {
        List<Plot> demands = demandMapper.selectPlotData();
        return demands;
    }

    @Override
    public Demand searchByTitle4Info(String demandTitle, String companyName) throws IOException {
        Demand demand = demandMapper.selectByTitle(demandTitle, companyName);
        return demand;
    }

    @Override
    public Term searchById4Intro(Integer id) {
        Term term = demandMapper.selectById4Intro(id);
        return term;
    }

}
