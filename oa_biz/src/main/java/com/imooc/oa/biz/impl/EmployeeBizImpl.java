package com.imooc.oa.biz.impl;

import com.imooc.oa.biz.EmployeeBiz;
import com.imooc.oa.dao.EmployeeDao;
import com.imooc.oa.entity.Employee;
import com.imooc.oa.entity.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service("employeeBiz")
public class EmployeeBizImpl implements EmployeeBiz {
    @Autowired
    private EmployeeDao employeeDao;

    public void add(Employee employee) {
        employee.setPassword("000000");
        employeeDao.insert(employee);
    }

    public void edit(Employee employee) {
        employeeDao.update(employee);
    }

    public void remove(String sn) {
        employeeDao.delete(sn);
    }

    public Employee get(String sn) {
        return employeeDao.select(sn);
    }

    public List<Employee> getAll() {
        return employeeDao.selectAll();
    }

    @Override
    public Page<Employee> selectAllByPage(int currentPage) {
        Page<Employee> page = new Page<Employee>();
        HashMap<String,Object> map = new HashMap<String, Object>();

        //设置当前页数
        page.setCurrPage(currentPage);

        //设置每页显示的页数
        int pageSize = 7;
        page.setPageSize(pageSize);

        //获取总记录数
        int totalCount = employeeDao.selectCount();
        page.setTotalCount(totalCount);

        //获取总页数

        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        page.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", page.getPageSize());
        //封装每页显示的数据
        List<Employee> lists = employeeDao.findByPage(map);
        page.setLists(lists);

        return  page;
    }


}
