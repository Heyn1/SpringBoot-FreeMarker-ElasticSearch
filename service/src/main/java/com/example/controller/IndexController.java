package com.example.controller;

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
import java.util.List;

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
                               @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                               @RequestParam(required = false, defaultValue = "10") Integer pageSize) throws IOException {

        /**
         * 这部分代码是最初的只通过数据库进行搜索然后返回
         */
        System.out.println("keyword: " + keyword);
        ModelAndView modelAndView = new ModelAndView("SearchByKeyword");

        ResponseVo<List<CategoryVo>> category = categoryService.selectAll();
        List<CategoryVo> categoryData = category.getData();
        modelAndView.addObject("category", categoryData);
        /**
         * 这部分是es搜索，再采取再MySQL中取值的方式
         */
        ResponseVo<PageInfo> result = demandService.searchByEs(keyword, pageNum, pageSize);
        modelAndView.addObject("result", result);
        modelAndView.addObject("keyword", keyword);
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
}
