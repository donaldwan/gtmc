package cn.com.gtmc.glaf2.mapper.common;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.common.Attachment;

import java.util.List;

public interface AttachmentMapper extends BaseMapper {

    /**
     * 查询多个上传附件
     *
     * @param ids 主键集
     * @return 附件对象
     */
    List<Attachment> findByIds(List<Integer> ids);
}
