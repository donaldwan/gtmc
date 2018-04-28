package cn.com.gtmc.glaf2.entity.security;

import cn.com.gtmc.glaf2.simple.DefaultIntegerEntity;

/**
 * @author  dream.li 
 * @version V1.0 
 * @Title DeptTemp
 * @Package cn.com.gtmc.glaf2.entity.security
 * @Description:  部门临时表-供IDM推送
 * @date 2017年7月24日 上午10:04:02 
 */
public class DeptTemp extends DefaultIntegerEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4777508686704181510L;

	private Integer parentId;//父ID
	private String deptName;//部门名称
	private String deptCode;//部门代码
	private String status;//状态
	private String parentCode;//父code
	
	private Integer deptId;//u_dept正式表的id
	
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	public Integer getDeptId() {
		return deptId;
	}
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	
}
