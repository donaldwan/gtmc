package cn.com.gtmc.glaf2.entity.job;

import com.fasterxml.jackson.annotation.JsonFormat;


/**
 * 任务调度实体类
 * 
 * @author intasect
 *
 */
public class ScheduleJob extends DefaultStringEntity {

	private static final long serialVersionUID = -1075253715297855678L;

	public static final String JOB_GROUP = "DefaultGroup";
	
	private String jobGroup = JOB_GROUP;
	private String jobName;
	private String jobType;
	private String jobObject;
	private String shellPath;
	private String cronExpression;
	private String runStatus;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private java.util.Date lastRunStartTime;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private java.util.Date lastRunEndTime;
	private String runResult;
	private String runMessage;
	private boolean trigger = false;

	public boolean isTrigger() {
		return trigger;
	}

	public void setTrigger(boolean trigger) {
		this.trigger = trigger;
	}

	public String getJobGroup() {
		return jobGroup;
	}

	public void setJobGroup(String jobGroup) {
		this.jobGroup = jobGroup;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getJobObject() {
		return jobObject;
	}

	public void setJobObject(String jobObject) {
		this.jobObject = jobObject;
	}

	public String getCronExpression() {
		return cronExpression;
	}

	public void setCronExpression(String cronExpression) {
		this.cronExpression = cronExpression;
	}

	public String getRunStatus() {
		return runStatus;
	}

	public void setRunStatus(String runStatus) {
		this.runStatus = runStatus;
	}

	public java.util.Date getLastRunStartTime() {
		return lastRunStartTime;
	}

	public void setLastRunStartTime(java.util.Date lastRunStartTime) {
		this.lastRunStartTime = lastRunStartTime;
	}

	public java.util.Date getLastRunEndTime() {
		return lastRunEndTime;
	}

	public void setLastRunEndTime(java.util.Date lastRunEndTime) {
		this.lastRunEndTime = lastRunEndTime;
	}

	public String getRunResult() {
		return runResult;
	}

	public void setRunResult(String runResult) {
		this.runResult = runResult;
	}

	public String getRunMessage() {
		return runMessage;
	}

	public void setRunMessage(String runMessage) {
		this.runMessage = runMessage;
	}
	
	public String getShellPath() {
		return shellPath;
	}

	public void setShellPath(String shellPath) {
		this.shellPath = shellPath;
	}

	public String getJobId(){
		return this.getId();
	}
	
	public static final class JobType{
		public static final String JAVA_BEAN = "J";
		public static final String SHELL_SCRIPT = "S";
	}
	
	public static final class RunStatus{
		public static final String RUNNING = "R";
		public static final String NORMAL = "A";
		public static final String PAUSE = "P"; 
	}
	
	public static final class RunResult{
		public static final String OK = "1";
		public static final String ERROR = "0";
	}
}
