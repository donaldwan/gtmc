package cn.com.gtmc.glaf2.mapper;

import cn.com.gtmc.glaf2.base.BaseTest;
import cn.com.gtmc.glaf2.entity.common.Attachment;
import cn.com.gtmc.glaf2.entity.common.LogImportData;
import cn.com.gtmc.glaf2.entity.common.MailTemplate;
import cn.com.gtmc.glaf2.entity.notify.Message;
import cn.com.gtmc.glaf2.entity.notify.MessageNotifyUser;
import cn.com.gtmc.glaf2.entity.notify.MessageRead;
import cn.com.gtmc.glaf2.entity.security.*;
/*import cn.com.gtmc.glaf2.mapper.ElementParamsMapper;
import cn.com.gtmc.glaf2.mapper.GlobalEventMapper;
import cn.com.gtmc.glaf2.mapper.MonitoringMapper;
import cn.com.gtmc.glaf2.mapper.NodeEventMapper;
import cn.com.gtmc.glaf2.mapper.NodeExtMapper;
import cn.com.gtmc.glaf2.mapper.NodeProcesserMapper;
import cn.com.gtmc.glaf2.mapper.OperateRecordMapper;*/
//import cn.com.gtmc.glaf2.mapper.ScheduleJobMapper;
/*import cn.com.gtmc.glaf2.mapper.WFProxyMapper;
import cn.com.gtmc.glaf2.mapper.WorkFlowMapper;*/
import cn.com.gtmc.glaf2.mapper.common.AttachmentMapper;
import cn.com.gtmc.glaf2.mapper.common.LogImportDataMapper;
import cn.com.gtmc.glaf2.mapper.common.MailTemplateMapper;
import cn.com.gtmc.glaf2.mapper.notify.MessageMapper;
import cn.com.gtmc.glaf2.mapper.notify.MessageReadMapper;
import cn.com.gtmc.glaf2.mapper.security.*;
//import cn.com.gtmc.glaf2.plugins.job.entity.ScheduleJob;
//import cn.com.gtmc.glaf2.plugins.job.entity.ScheduleJobRunLog;
/*import cn.com.gtmc.glaf2.plugins.workflow.entity.*;*/
import org.junit.Assert;
import org.junit.Test;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class InsertTest extends BaseTest {

    private static String[] COMMON_FIELDS = {"serialVersionUID",
            "id",
            "createdTime",
            "createdUserId",
            "createdUserName",
            "updatedTime",
            "updatedUserId",
            "updatedUserName"};

    @Resource
    AttachmentMapper attachmentMapper;

    @Test
    @Transactional
    @Rollback
    public void testAttachmentMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(attachmentMapper.insert((Attachment) fillEntity(Attachment.class.newInstance())) == 1);
    }

    @Resource
    LogImportDataMapper logImportDataMapper;

    @Test
    @Transactional
    @Rollback
    public void testLogImportDataMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(logImportDataMapper.insert((LogImportData) fillEntity(LogImportData.class.newInstance())) == 1);
    }

    @Resource
    MailTemplateMapper mailTemplateMapper;

    @Test
    @Transactional
    @Rollback
    public void testMailTemplateMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(mailTemplateMapper.insert((MailTemplate) fillEntity(MailTemplate.class.newInstance())) == 1);
    }

    @Resource
    MessageMapper messageMapper;

    @Test
    @Transactional
    @Rollback
    public void testMessageMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(messageMapper.insert((Message) fillEntity(Message.class.newInstance())) == 1);
        List<MessageNotifyUser> messageList = new ArrayList<>();
        messageList.add((MessageNotifyUser) fillEntity(MessageNotifyUser.class.newInstance()));
        Assert.assertTrue(messageMapper.insertMessageNotifyUser(messageList) == 1);
    }

    @Resource
    MessageReadMapper messageReadMapper;

    @Test
    @Transactional
    @Rollback
    public void testMessageReadMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(messageReadMapper.insert((MessageRead) fillEntity(MessageRead.class.newInstance())) == 1);
    }

    @Resource
    AuthenticationMapper authenticationMapper;

    @Test
    @Transactional
    @Rollback
    public void testAuthenticationMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(authenticationMapper.insert((Authentication) fillEntity(Authentication.class.newInstance())) == 1);
        authenticationMapper.addAuthResource((AuthenticationResource) fillEntity(AuthenticationResource.class.newInstance()));
    }

    @Resource
    DeptMapper deptMapper;

    @Test
    @Transactional
    @Rollback
    public void testDeptMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(deptMapper.insert((Dept) fillEntity(Dept.class.newInstance())) == 1);
    }

    @Resource
    DictionaryMapper dictionaryMapper;

    @Test
    @Transactional
    @Rollback
    public void testDictionaryMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(dictionaryMapper.insert((Dictionary) fillEntity(Dictionary.class.newInstance())) == 1);
    }

    @Resource
    ResourceMapper resourceMapper;

    @Test
    @Transactional
    @Rollback
    public void testResourceMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(resourceMapper.insert((cn.com.gtmc.glaf2.entity.security.Resource) fillEntity(cn.com.gtmc.glaf2.entity.security.Resource.class.newInstance())) == 1);
    }

    @Resource
    RoleMapper roleMapper;

    @Test
    @Transactional
    @Rollback
    public void testRoleMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(roleMapper.insert((Role) fillEntity(Role.class.newInstance())) == 1);
        Assert.assertTrue(roleMapper.insertRoleScreen((RoleScreen) fillEntity(RoleScreen.class.newInstance())) == 1);
        Assert.assertTrue(roleMapper.insertRoleAuth((RoleAuthentication) fillEntity(RoleAuthentication.class.newInstance())) == 1);
    }

    @Resource
    RoleScreenMapper roleScreenMapper;

    @Test
    @Transactional
    @Rollback
    public void testRoleScreenMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(roleScreenMapper.insert((RoleScreen) fillEntity(RoleScreen.class.newInstance())) == 1);
    }

    @Resource
    ScreenMapper screenMapper;

    @Test
    @Transactional
    @Rollback
    public void testScreenMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(screenMapper.insert((Screen) fillEntity(Screen.class.newInstance())) == 1);
    }

    @Resource
    UserMapper userMapper;

    @Test
    @Transactional
    @Rollback
    public void testUserMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(userMapper.insert((User) fillEntity(User.class.newInstance())) == 1);
        Assert.assertTrue(userMapper.saveUserRole((UserRole) fillEntity(UserRole.class.newInstance())) == 1);
        Assert.assertTrue(userMapper.insertLoginLog((LogLogin) fillEntity(LogLogin.class.newInstance())) == 1);
    }

    @Resource
    UserPropertyMapper userPropertyMapper;

    @Test
    @Transactional
    @Rollback
    public void testUserPropertyMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(userPropertyMapper.insert((UserProperty) fillEntity(UserProperty.class.newInstance())) == 1);
        Assert.assertTrue(userPropertyMapper.insertUserPropertyValue((UserPropertyValue) fillEntity(UserPropertyValue.class.newInstance())) == 1);
    }

//    /**
//     * JOB开始----------------------------------------------------------------------------------------------------------
//     */
//    @Resource
//    ScheduleJobMapper scheduleJobMapper;
//
//    @Test
//    @Transactional
//    @Rollback
//    public void testScheduleJobMapper() throws IllegalAccessException, InstantiationException {
//        Assert.assertTrue(scheduleJobMapper.insert((ScheduleJob) fillEntity(ScheduleJob.class.newInstance())) == 1);
//        Assert.assertTrue(scheduleJobMapper.addRunLog((ScheduleJobRunLog) fillEntity(ScheduleJobRunLog.class.newInstance())) == 1);
//    }


   /* *//**
     * 工作流开始-------------------------------------------------------------------------------------------------------
     *//*
    @Resource
    ElementParamsMapper elementParamsMapper;

    @Test
    @Transactional
    @Rollback
    public void testElementParamsMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(elementParamsMapper.insert((ElementParams) fillEntity(ElementParams.class.newInstance())) == 1);
    }

    @Resource
    GlobalEventMapper globalEventMapper;

    @Test
    @Transactional
    @Rollback
    public void testGlobalEventMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(globalEventMapper.insert((GlobalEvent) fillEntity(GlobalEvent.class.newInstance())) == 1);
    }

    @Resource
    MonitoringMapper monitoringMapper;

    @Test
    @Transactional
    @Rollback
    public void testMonitoringMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(monitoringMapper.insert((Monitoring) fillEntity(Monitoring.class.newInstance())) == 1);
    }

    @Resource
    NodeEventMapper nodeEventMapper;

    @Test
    @Transactional
    @Rollback
    public void testNodeEventMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(nodeEventMapper.insert((NodeEvent) fillEntity(NodeEvent.class.newInstance())) == 1);
    }

    @Resource
    NodeExtMapper nodeExtMapper;

    @Test
    @Transactional
    @Rollback
    public void testNodeExtMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(nodeExtMapper.insert((NodeExt) fillEntity(NodeExt.class.newInstance())) == 1);
    }

    @Resource
    NodeProcesserMapper nodeProcesserMapper;

    @Test
    @Transactional
    @Rollback
    public void testNodeProcesserMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(nodeProcesserMapper.insert((NodeProcesser) fillEntity(NodeProcesser.class.newInstance())) == 1);
    }

    @Resource
    OperateRecordMapper operateRecordMapper;

    @Test
    @Transactional
    @Rollback
    public void testOperateRecordMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(operateRecordMapper.insert((OperateRecord) fillEntity(OperateRecord.class.newInstance())) == 1);
    }

    @Resource
    WFProxyMapper wFProxyMapper;

    @Test
    @Transactional
    @Rollback
    public void testWFProxyMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(wFProxyMapper.insertHistoryProxy((Proxy) fillEntity(Proxy.class.newInstance())) == 1);
        Assert.assertTrue(wFProxyMapper.insert((Proxy) fillEntity(Proxy.class.newInstance())) == 1);
    }

    @Resource
    WorkFlowMapper workFlowMapper;

    @Test
    @Transactional
    @Rollback
    public void testWorkFlowMapper() throws IllegalAccessException, InstantiationException {
        Assert.assertTrue(workFlowMapper.insert((WorkFlow) fillEntity(WorkFlow.class.newInstance())) == 1);
    }*/

    private static Object fillEntity(Object obj) {
        try {
            for (Class<?> clazz = obj.getClass(); clazz != Object.class; clazz = clazz.getSuperclass()) {
                Field[] fields = clazz.getDeclaredFields();
                for (Field f : fields) {
                    boolean isCommonField = false;
                    for (String commonFiledName : COMMON_FIELDS) {
                        if (f.getName().equals(commonFiledName)) {
                            isCommonField = true;
                            break;
                        }
                    }
                    if (!isCommonField) {
                        setEntityValue(f, obj);
                    }
                }
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return obj;
    }

    private static void setEntityValue(Field field, Object obj) throws IllegalAccessException {
        field.setAccessible(true);
        Class type = field.getType();
        if (Modifier.isStatic(field.getModifiers())) {
            return;
        }
        if (type.equals(Integer.class) || type.equals(int.class)) {
            field.set(obj, 1);
        } else if (type.equals(Long.class) || type.equals(long.class)) {
            field.set(obj, 1);
        } else if (type.equals(Timestamp.class)) {
            field.set(obj, new Timestamp(Calendar.getInstance().getTimeInMillis()));
        } else if (type.equals(Date.class)) {
            field.set(obj, Calendar.getInstance().getTime());
        } else if (type.equals(String.class)) {
            field.set(obj, "1");
        } else if (type.equals(Double.class) || type.equals(double.class)) {
            field.set(obj, 1);
        } else if (type.equals(BigDecimal.class)) {
            field.set(obj, BigDecimal.ONE);
        }
    }
}