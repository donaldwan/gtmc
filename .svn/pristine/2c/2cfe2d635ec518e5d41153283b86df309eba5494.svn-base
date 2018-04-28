package cn.com.gtmc.glaf2.service.security;

import java.util.List;

import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.security.Dept;


public interface DeptService extends BaseService {

    /**
     * 删除部门
     *
     * @param dept 部门
     * @return 结果
     */
    int updateStatus(Dept dept);

    /**
     * 根据部门编码查询部门信息
     * @param deptCode
     */
    List<Dept> findByDeptCode(String deptCode);

    /**
     * 从deptTemp表同步部门信息
     */
    public boolean syncDeptInfo();
    
}
