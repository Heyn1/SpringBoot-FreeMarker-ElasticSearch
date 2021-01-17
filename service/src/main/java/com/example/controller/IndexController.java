package com.example.controller;

import com.example.entity.Demand;
import com.example.entity.Plot;
import com.example.entity.Term;
import com.example.service.ICategoryService;
import com.example.service.IDemandService;
import com.example.service.IUserService;
import com.example.vo.CategoryVo;
import com.example.vo.ResponseVo;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@Slf4j
public class IndexController {
    @Autowired
    private ICategoryService categoryService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IDemandService demandService;

    @RequestMapping("/main")
    public ModelAndView main() {
        ModelAndView modelAndView = new ModelAndView("MainIndex");
        return modelAndView;
    }

    @RequestMapping("/index")
    public ModelAndView index() {

        ResponseVo<List<CategoryVo>> category = categoryService.selectAll();
        List<CategoryVo> categoryData = category.getData();

        ResponseVo<PageInfo> result = demandService.searchByCategory(10000, 1, 10);

        ModelAndView modelAndView = new ModelAndView("SearchIndex");
        modelAndView.addObject("result",result);
        modelAndView.addObject("category", categoryData);
        return modelAndView;

    }

    @RequestMapping("/search")
    public ModelAndView search(@RequestParam(required = false, name = "keyword") String keyword,
                               @RequestParam(required = false, name = "category") String category,
                               @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                               @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                               @RequestParam(required = false, defaultValue = "116.23") BigDecimal longitude,
                               @RequestParam(required = false, defaultValue = "40.22") BigDecimal latitude,
                               @RequestParam(required = false, defaultValue = "1") Integer order,
                               @RequestParam(required = false, defaultValue = "1") Integer function) throws IOException {


        ModelAndView modelAndView = new ModelAndView("SearchByKeyword");
        ResponseVo<List<CategoryVo>> categoryList = categoryService.selectAll();
        List<CategoryVo> categoryData = categoryList.getData();
        modelAndView.addObject("category", categoryData);
        /**
         * 这部分是es搜索，再采取再MySQL中取值的方式
         */
        ResponseVo<PageInfo> result = demandService.searchByEs(keyword, category, pageNum, pageSize, longitude, latitude, order, function);

        ResponseVo<PageInfo> resultDemandInfo = demandService.searchByKeyword(keyword, pageNum, pageSize);
        if (function == 2) {
            resultDemandInfo = demandService.searchByCompany(keyword, pageNum, pageSize);
        }
        List<Demand> resultHotSpot = demandService.searchByEs4HotSpot(keyword,category, order, latitude, longitude, function);
        List<String> resultTimeStamp = new ArrayList<>();
        List<String> resultCategory = new ArrayList<>();
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        for(int i = 0; i < resultHotSpot.size(); i++) {
            resultTimeStamp.add((ft.format(resultHotSpot.get(i).getCreateTime())).substring(0, 10));
            if (resultHotSpot.get(i).getCategory() != null) {
                String[] categoryStr = resultHotSpot.get(i).getCategory().split(",");
                for(int j = 0; j < categoryStr.length; j++) {
                    resultCategory.add(categoryStr[j].trim());
                }
            }
        }
        List<String> tmp = resultCategory;
        Map<String, Integer> count = new HashMap<>();
        for (String str : tmp) {
            if (count.containsKey(str)) {
                count.put(str, count.get(str) + 1);
            }
            else {
                count.put(str, 1);
            }
        }
        Comparator<Map.Entry<String, Integer>> cmp = new Comparator<Map.Entry<String, Integer>>() {
            @Override
            public int compare(Map.Entry<String, Integer> stringIntegerEntry, Map.Entry<String, Integer> t1) {
                return t1.getValue() - stringIntegerEntry.getValue();
            }
        };
        List<Map.Entry<String, Integer>> myList = new ArrayList<>(count.entrySet());
        Collections.sort(myList, cmp);
        List<String> resultBoxCategory = new ArrayList<>();
        for (int i = 0; i < myList.size(); i++) {
            resultBoxCategory.add(myList.get(i).getKey());
        }
        modelAndView.addObject("result", result);
        modelAndView.addObject("resultDemandInfo", resultDemandInfo);
        modelAndView.addObject("keyword", keyword);
        modelAndView.addObject("resultTimeStamp", resultTimeStamp);
        modelAndView.addObject("resultCategory", resultCategory);
        modelAndView.addObject("resultBoxCategory", resultBoxCategory);
        modelAndView.addObject("formKeyword", keyword);
        modelAndView.addObject("order", order);
        modelAndView.addObject("longitude", longitude);
        modelAndView.addObject("latitude", latitude);
        modelAndView.addObject("function", function);
        return modelAndView;
    }

    @RequestMapping("/category")
    public ModelAndView category(
            @RequestParam(required = false, name = "categoryId", defaultValue = "10000") Integer categoryId,
            @RequestParam(required = false, defaultValue = "1") Integer pageNum,
            @RequestParam(required = false, defaultValue = "10") Integer pageSize) {

        ResponseVo<PageInfo> result = demandService.searchByCategory(categoryId, pageNum, pageSize);

        ModelAndView modelAndView = new ModelAndView("SearchByCategory");
        modelAndView.addObject("result",result);
        ResponseVo<List<CategoryVo>> category = categoryService.selectAll();
        List<CategoryVo> categoryData = category.getData();
        modelAndView.addObject("currentId", categoryId);
        modelAndView.addObject("category", categoryData);
        return modelAndView;
    }

    @RequestMapping("/demandsinfo")
    public ModelAndView demandsinfo(
            @RequestParam(required = false, name = "demandtitle", defaultValue = "") String demandTitle,
            @RequestParam(required = false, name = "demanddetail", defaultValue = "") String companyName) throws IOException {
        ModelAndView modelAndView = new ModelAndView("DemandsInfo");
        Demand demand = demandService.searchByTitle4Info(demandTitle, companyName);
        modelAndView.addObject("demandTitle", demandTitle);
        modelAndView.addObject("demandType", demand.getDemandType());
        modelAndView.addObject("companyName", demand.getCompanyName());
        modelAndView.addObject("money", demand.getMoney());
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        modelAndView.addObject("createTime", formatter.format(demand.getCreateTime()));
        modelAndView.addObject("phoneNum", demand.getPhone());
        modelAndView.addObject("category", demand.getCategory());
        modelAndView.addObject("demandDetail", demand.getDemandDetail());
        Term term = demandService.searchById4Intro(demand.getId());
        if (term != null) {
            modelAndView.addObject("termName", term.getTermName());
            modelAndView.addObject("termIntro", term.getTermIntro());
            modelAndView.addObject("termImage", term.getTermImage());
        }
        else {
            modelAndView.addObject("termName", "暂无内容");
            modelAndView.addObject("termIntro", "暂无内容");
            modelAndView.addObject("termImage", "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599645250064&di=590dae138e37ea5f6e2c6143d5ef687f&imgtype=0&src=http%3A%2F%2Fimage.999120.net%2Fhospital%2FnonePic.jpg");
        }
        return modelAndView;
    }

    @RequestMapping("/chart")
    public List<Plot> test() {
        return demandService.plot();
    }
}
