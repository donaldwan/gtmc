package cn.com.gtmc.glaf2.service.security.impl;

import cn.com.gtmc.glaf2.base.BaseEntity;
import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.security.Dept;
import cn.com.gtmc.glaf2.entity.security.DeptTemp;
import cn.com.gtmc.glaf2.mapper.security.DeptMapper;
import cn.com.gtmc.glaf2.mapper.security.DeptTempMapper;
import cn.com.gtmc.glaf2.notification.Notification;
import cn.com.gtmc.glaf2.notification.NotificationType;
import cn.com.gtmc.glaf2.service.security.DeptService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itextpdf.text.log.SysoCounter;

import java.util.List;

/**
 * 部门维护
 *
 * @author intasect
 */
@Service
@Transactional
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptMapper mDeptMapper;
    
    @Autowired
    private DeptTempMapper deptTempMapper;
    
    @Autowired(required = false)
    @Qualifier("wfNotification")
    private Notification mWfNotification;

    @Override
    public BaseMapper getBaseMapper() {
        return this.mDeptMapper;
    }


    @SuppressWarnings("unchecked")
    @Override
    public List<Dept> findAll() {
        java.util.List<Dept> orderDepts = new java.util.ArrayList<>();
        java.util.List<Dept> depts = this.mDeptMapper.findAll();

        for (Dept s : depts) {
            if (s.getParentId() == null || 0 == s.getParentId()) {
                s.setLevel(0);
                orderDepts.add(s);
                this.setChildren(s, depts, 0, orderDepts);
            }
        }

        return orderDepts;
    }


    private void setChildren(Dept parent, java.util.List<Dept> depts, int level, java.util.List<Dept> orderDepts) {
        for (Dept dept : depts) {
            if (parent.getId().equals(dept.getParentId())) {
                parent.setIsParent(true);
                parent.setLeaf(false);
                dept.setLevel(level + 1);
                orderDepts.add(dept);
                this.setChildren(dept, depts, level + 1, orderDepts);
            }
        }
    }


    /**
     * 删除部门
     */
    @Transactional
    @Override
    public int updateStatus(Dept dept) {
        return this.mDeptMapper.updateStatus(dept);
    }

    @Transactional
    @Override
    public <T extends BaseEntity<?>> int insert(T t) {
        Dept dept = (Dept) t;
        this.getBaseMapper().insert(dept);

        if (this.mWfNotification != null) {
            java.util.Map<String, Object> map = new java.util.HashMap<>();
            map.put("action", Notification.ACTION.GROUP);
            map.put("id", dept.getId().toString());
            map.put("name", dept.getDeptName());
            map.put("prefix", Dept.GROUP_PREFIX);
            this.mWfNotification.notification(NotificationType.INSERT, map);
        }

        return 1;
    }


	@Override
	public List<Dept> findByDeptCode(String deptCode) {
		return this.mDeptMapper.findByDeptCode(deptCode);
	}


	@Override
	public boolean syncDeptInfo() {
		boolean result = false;
		
		//根节点处理方式
		System.out.println("根节点处理方式");
		List<DeptTemp> rootDeptTemps = deptTempMapper.findByDeptTempCode("0");//根节点的code默认为0
		if(rootDeptTemps.size()>0){
			DeptTemp rootDeptTemp =  rootDeptTemps.get(0);
			System.out.println("id=" + rootDeptTemp.getId() + " parint_id = " +rootDeptTemp.getParentId() + " deptName = " + rootDeptTemp.getDeptName());
			Dept deptRoot = null;
			if(rootDeptTemp.getDeptId() == null || "".equals(rootDeptTemp.getDeptId())){
				deptRoot = mDeptMapper.findById(rootDeptTemp.getDeptId());
			}else{
				List<Dept> rootDepts = mDeptMapper.findByDeptCode("0");//根据code去dept查找部门信息
				if(rootDepts.size() > 0)
				deptRoot = rootDepts.get(0);
			}
			if(deptRoot != null){//dept表存在根节点
				System.out.println("开始修改根节点");
				boolean flag = false;
				if(rootDeptTemp.getDeptCode() != null && !"".equals(rootDeptTemp.getDeptCode()) ){
					if(!rootDeptTemp.getDeptCode().equals(deptRoot.getDeptCode())){
						deptRoot.setDeptCode(rootDeptTemp.getDeptCode());
						flag = true;
					}
				}
				if(rootDeptTemp.getDeptName() != null && !"".equals(rootDeptTemp.getDeptName()) ){
					if(!rootDeptTemp.getDeptName().equals(deptRoot.getDeptName())){
						deptRoot.setDeptName(rootDeptTemp.getDeptName());
						flag = true;
					}
				}
				if(flag){
					System.out.println("修改根节点 id=" + deptRoot.getId() + " parint_id = " +deptRoot.getParentId() + " deptName = " + deptRoot.getDeptName() + "deptCode = " + deptRoot.getDeptCode());
					mDeptMapper.update(deptRoot);
				}
			}else{//dept表不存在根节点则插入根节点
				deptRoot = new Dept();
				//newDeptInfo(deptRoot,rootDeptTemp);
				deptRoot.setDeptName(rootDeptTemp.getDeptName());
				deptRoot.setDeptCode(rootDeptTemp.getDeptCode());
				deptRoot.setStatus(rootDeptTemp.getStatus());
				deptRoot.setParentId(null);
				mDeptMapper.insert(deptRoot);//插入节点
				System.out.println("插入根节点 " + "id=" + deptRoot.getId() + " parint_id = " +deptRoot.getParentId() + " deptName = " + deptRoot.getDeptName());
				rootDeptTemp.setDeptId(deptRoot.getId());
				deptTempMapper.updateDeptId(rootDeptTemp);//跟新deptTemp表的dept_id信息
				System.out.println("更新deptTemp  deptid = " +rootDeptTemp.getDeptId());
			}
			System.out.println("根节点处理完成");
		}else{//如果不存在根节点则返回false
			return false;
		}
		
		//其他节点处理
		System.out.println("其他节点处理");
		List<DeptTemp> deptTempList = deptTempMapper.findAllNode();//获取临时表节点(除根节点)
		int size =  deptTempList.size();
		int i = 0;
		for(;i<size;i++){
			DeptTemp deptTemp =  deptTempList.get(i);//本节点信息
			System.out.println(" i = " + i+ ",id=" + deptTemp.getId() + " parint_id = " +deptTemp.getParentId() + " deptName = " + deptTemp.getDeptName() + " deptId = " + deptTemp.getDeptId());
			DeptTemp parentDeptTemp = deptTempMapper.findById(deptTemp.getParentId());//查询父节点是否存在
			//如果数据  异常  则后面节点不添加
			System.out.println(" parentDeptTemp ,id=" + parentDeptTemp.getId() + " parint_id = " +parentDeptTemp.getParentId() + " deptName = " + parentDeptTemp.getDeptName() + " deptId = " + parentDeptTemp.getDeptId());
			
			if(parentDeptTemp !=null && parentDeptTemp.getDeptId() != null && !"".equals(parentDeptTemp.getDeptId())){ ////查询父节点dept_id是否存在
				/**
				 * 使用dept_coed查询数据
				 * 对于dept_coed为空，修改名字的部门手动对应数据
				 */
				if(deptTemp.getDeptCode() != null && !"".equals(deptTemp.getDeptCode())){
					List<Dept> depts = mDeptMapper.findByDeptCode(deptTemp.getDeptCode());
					if(depts.size() > 0){
						System.out.println("开始修改根节点");
						Dept dept = depts.get(0);
						boolean flag = false;
						if(deptTemp.getDeptCode() != null && !"".equals(deptTemp.getDeptCode()) ){
							if(!deptTemp.getDeptCode().equals(dept.getDeptCode())){
								deptTemp.setDeptCode(dept.getDeptCode());
								flag = true;
							}
						}
						if(deptTemp.getDeptName() != null && !"".equals(deptTemp.getDeptName()) ){
							if(!deptTemp.getDeptName().equals(dept.getDeptName())){
								deptTemp.setDeptName(dept.getDeptName());
								flag = true;
							}
						}
						if(flag){
							System.out.println("修改节点 id=" + dept.getId() + " parint_id = " +dept.getParentId() + " deptName = " + dept.getDeptName() + "deptCode = " + dept.getDeptCode());
							mDeptMapper.update(dept);
						}
						
						mDeptMapper.update(dept);
						deptTemp.setDeptId(dept.getId());
						deptTempMapper.update(deptTemp);
					}else{//dept表不存在节点则插入节点
						
						Dept dept = new Dept();
						dept.setDeptName(deptTemp.getDeptName());
						dept.setDeptCode(deptTemp.getDeptCode());
						dept.setStatus(deptTemp.getStatus());
						dept.setParentId(parentDeptTemp.getDeptId());//父节点id
						mDeptMapper.insert(dept);//插入节点
						System.out.println("插入根节点 " + "id=" + dept.getId() + " parint_id = " +dept.getParentId() + " deptName = " + dept.getDeptName());
						deptTemp.setDeptId(dept.getId());
						deptTempMapper.updateDeptId(deptTemp);//跟新deptTemp表的dept_id信息
						System.out.println("更新deptTemp  deptid = " +deptTemp.getDeptId());//跟新deptTemp表的dept_id信息
					}
				}else{
					
				}
			}
		}
		
		if(i == size ){
			result = true;
		}
		
		return result;
	}
	
}