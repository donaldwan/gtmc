package cn.com.gtmc.glaf2.mapper.security;

import java.util.List;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.security.DeptTemp;

/**
 * @author  dream.li 
 * @version V1.0 
 * @Title DeptTempMapper
 * @Package cn.com.gtmc.glaf2.mapper.security
 * @Description:  
 * @date 2017年7月24日 上午10:12:13 
 */
public interface DeptTempMapper extends BaseMapper{
	
	/**
	 * 根据部门编码查询部门信息
	 * @param code
	 * @return
	 */
	List<DeptTemp> findByDeptTempCode(String deptCode);
	
	/**
	 * 查询除了根节点之外所有子节点信息
	 * @return
	 */
	List<DeptTemp> findAllNode();
	
	/**
	 * 获取所有的根节点信息
	 * @return
	 */
	List<DeptTemp> findAllRootNode();
	
	/**
	 * 修改DeptId
	 * @param deptId
	 * @return
	 */
	int updateDeptId(DeptTemp deptTemp);
	
}
