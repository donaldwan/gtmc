package cn.com.gtmc.glaf2.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.gtmc.glaf2.tools.log.Logger;

/**
 * 常用例子Demo
 * @author chenwandong
 *
 */
@Controller
@RequestMapping("demo/common-demo")
public class CommonDemoController {
	private static final Logger LOG = Logger.getLogger(CommonDemoController.class);
	
	public CommonDemoController() {
		LOG.info("init...");
	}
	
	/**
	 * 文件上传例子
	 * @return
	 */
	@RequestMapping("upfile")
	public ModelAndView upfile(){
		return new ModelAndView("demo/common-demo/upfile");
	}
	/**
	 * 文件导入例子
	 * @return
	 */
	@RequestMapping("import-data")
	public ModelAndView importData(){
		return new ModelAndView("demo/common-demo/import-data");
	}

    /**
     * 文件打包参数
     */
    @RequestMapping("packagefiles")
    public ModelAndView packagefiles(){
        return new ModelAndView("demo/common-demo/packagefiles");
    }
}
