package cn.com.gtmc.glaf2.controller.system;

import cn.com.gtmc.glaf2.base.BaseController;
import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.security.AuthenticationResource;
import cn.com.gtmc.glaf2.entity.security.Dictionary;
import cn.com.gtmc.glaf2.entity.security.Resource;
import cn.com.gtmc.glaf2.service.security.DictionaryService;
import cn.com.gtmc.glaf2.service.security.ResourceService;
import cn.com.gtmc.glaf2.tools.Util;
import cn.com.gtmc.glaf2.tools.log.Logger;
import cn.com.gtmc.glaf2.tools.web.ReturnMessage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 * 资源维护
 *
 * @author intasect
 */
@Controller
@RequestMapping("system/resource")
public class ResourceController implements BaseController<Resource> {

    private static final Logger LOG = Logger.getLogger(ResourceController.class);

    @Autowired
    private ResourceService mResourceService;
    
    @Autowired
    private DictionaryService dictionaryService;

    public ResourceController() {
        LOG.debug("init...");
    }

    @Override
    public BaseService getService() {
        return this.mResourceService;
    }
    /**
     * 进入修改编辑页面(新增也同样适用，如果新增和编辑是采用同一个view，建议采用此方法)
     *
     * @param Resource 参数为对应实体对象
     * @return ModelAndView
     */
    @RequestMapping(EDIT_VIEW_NAME)
    @Override
    public ModelAndView edit(Resource resource){
    	 ModelAndView mav = new ModelAndView(this.getViewPath() + EDIT_VIEW_NAME);

         HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

         if (resource != null && !"".equals(Util.filter(resource.getPK()))) {
             mav.addObject("model", this.getService().findById(resource.getPK()));
         } else {
             mav.addObject("model", resource);
         }
         boolean isDetail = false;
         try {
             isDetail = Boolean.parseBoolean(request.getParameter("isDetail"));
         } catch (Exception ex) {
             logger.error(ex.getMessage());
         }
         mav.addObject("isDetail", isDetail);
         List<Dictionary> resourceTypeList = dictionaryService.findByTypeCode("RESOURCE_TYPE");
         mav.addObject("resourceTypeList", resourceTypeList);
         return mav;
    }
    @ResponseBody
    @RequestMapping("delete")
    public ReturnMessage delete(@RequestParam(value = "ids[]") String[] ids) {
        this.mResourceService.deleteResourceList(ids);
        return this.ok();
    }

    @ResponseBody
    @RequestMapping("find-by-auth")
    public java.util.List<Resource> findByAuthentication(String authId, String resourceName) {
        LOG.debug("find-by-auth..." + authId + "__" + resourceName);
        AuthenticationResource mAuthenticationResource = new AuthenticationResource();
        mAuthenticationResource.setAuthenticationId(authId);
        mAuthenticationResource.setResourceName(resourceName);
        return this.mResourceService.findByAuthentication(mAuthenticationResource);
    }

    @RequestMapping("find-resource-by-screenid")
    @ResponseBody
    public java.util.List<Resource> findByScreenId(String screenId) {
        LOG.debug("find-resource-by-screenid..." + screenId);
        java.util.List<Resource> list = new java.util.ArrayList<>();
        Resource mResource = mResourceService.findByScreenId(screenId);
        if (null != mResource) {
            list.add(mResource);
        }
        return list;
    }
}
