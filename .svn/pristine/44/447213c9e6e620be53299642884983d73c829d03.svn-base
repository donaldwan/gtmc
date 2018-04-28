package cn.com.gtmc.glaf2.controller.system;

import cn.com.gtmc.glaf2.base.BaseController;
import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.security.Dept;
import cn.com.gtmc.glaf2.entity.security.User;
import cn.com.gtmc.glaf2.security.LoginUser;
import cn.com.gtmc.glaf2.service.security.DeptService;
import cn.com.gtmc.glaf2.tools.Util;
import cn.com.gtmc.glaf2.tools.log.Logger;
import cn.com.gtmc.glaf2.tools.web.ReturnMessage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 部门
 *
 * @author intasect
 */
@Controller
@RequestMapping("system/dept")
public class DeptController implements BaseController<Dept> {

    private static final Logger LOG = Logger.getLogger(DeptController.class);

    @Autowired
    private DeptService mDeptService;

    public DeptController() {
        LOG.debug("init...");
    }

    @Override
    public BaseService getService() {
        return this.mDeptService;
    }

    /**
     * 进入部门编辑页面
     */
    @RequestMapping(EDIT_VIEW_NAME)
    @Override
    public ModelAndView edit(Dept dept) {
        ModelAndView mav = new ModelAndView(this.getViewPath() + EDIT_VIEW_NAME);

        if (dept.getId() != null && dept.getId() != 0) {
            Dept model = this.getService().findById(dept.getId());
            if (model.getParentId() != null && model.getParentId() != 0) {
                mav.addObject("parent", this.getService().findById(model.getParentId()));
            }
            mav.addObject("model", model);
        } else {
            if (dept.getParentId() != null && dept.getParentId() != 0) {
                mav.addObject("parent", this.getService().findById(dept.getParentId()));
            }
        }

        return mav;
    }

    /**
     * 删除部门
     *
     * @return
     */
    @RequestMapping("update-status")
    @ResponseBody
    public ReturnMessage updateStatus(Dept dept) {
        dept.setStatus("D");
        this.mDeptService.updateStatus(dept);
        return this.ok();
    }

    /**
     * 进入部门选择页面
     *
     * @return
     */
    @RequestMapping("choose")
    public ModelAndView choose() {
        return new ModelAndView(this.getViewPath() + "/choose");
    }
    
    /**
     * 验证是否存在该部门编码
     * @param deptCode
     * @return
     */
    @RequestMapping(value = "isExistDeptCode", method = RequestMethod.POST)
    @ResponseBody
    public boolean isExistDeptCode(String deptCode) {
    	List<Dept> deptList = this.mDeptService.findByDeptCode(deptCode);
    	if(deptList.size() > 0){
    		return false;
    	}
        return true;
    }
    
    /**
     * 同步部门信息
     * @return
     */
    @RequestMapping(value = "syncDeptInfo", method = RequestMethod.POST)
    @ResponseBody
    public boolean syncDeptInfo(){
    	return this.mDeptService.syncDeptInfo();
    }
    
    
}
