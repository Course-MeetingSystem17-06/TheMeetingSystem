package vo;

public class MeetingEmployee {
	int employeeid;
	int meetingid;
	int meetingemployeeid;
	public int getEmployeeid() {
		return employeeid;
	}
	public int getMeetingid() {
		return meetingid;
	}
	public void setMeetingid(int meetingid) {
		this.meetingid = meetingid;
	}
	public int getMeetingemployeeid() {
		return meetingemployeeid;
	}
	public void setMeetingemployeeid(int meetingemployeeid) {
		this.meetingemployeeid = meetingemployeeid;
	}
	
	public MeetingEmployee(int employeeid, int meetingid){
		this.employeeid = employeeid;
		this.meetingid = meetingid;
		
	}
}
