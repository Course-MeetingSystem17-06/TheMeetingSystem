package vo;

import java.util.Date;

public class Meeting_dada {
	private Integer meetingid;
	private String meetingname;
	private String meetingroomname;
	private String meetingparticipatenumber;
	private Date meetingstarttime;
	private Date meetingendtime;
	private String meetingillustrate;
	private String meetingbooker;
	private String meetingstate="1";
	private Date meetingbookdate;
	
	public Meeting_dada() {
		super();
	}
	
	public Meeting_dada(String meetingname,String meetingroomname,
			String meetingparticipatenumber,Date meetingstarttime,
			Date meetingendtime,String meetingillustrate,
			String meetingbooker,String meetingstate,
			Date meetingbookdate){
		this.meetingname = meetingname;
		this.meetingroomname = meetingroomname;
		this.meetingparticipatenumber = meetingparticipatenumber;
		this.meetingstarttime = meetingstarttime;
		this.meetingendtime = meetingendtime;
		this.meetingillustrate = meetingillustrate;
		this.meetingbooker = meetingbooker;
		this.meetingstate = meetingstate;
		this.meetingbookdate = meetingbookdate;
	}

	public Integer getMeetingid() {
		return meetingid;
	}

	public void setMeetingid(Integer meetingid) {
		this.meetingid = meetingid;
	}

	public String getMeetingname() {
		return meetingname;
	}

	public void setMeetingname(String meetingname) {
		this.meetingname = meetingname;
	}

	public String getMeetingroomname() {
		return meetingroomname;
	}

	public void setMeetingroomname(String meetingroomname) {
		this.meetingroomname = meetingroomname;
	}

	public String getMeetingparticipatenumber() {
		return meetingparticipatenumber;
	}

	public void setMeetingparticipatenumber(String meetingparticipatenumber) {
		this.meetingparticipatenumber = meetingparticipatenumber;
	}

	public Date getMeetingstarttime() {
		return meetingstarttime;
	}

	public void setMeetingstarttime(Date meetingstarttime) {
		this.meetingstarttime = meetingstarttime;
	}

	public Date getMeetingendtime() {
		return meetingendtime;
	}

	public void setMeetingendtime(Date meetingendtime) {
		this.meetingendtime = meetingendtime;
	}

	public String getMeetingillustrate() {
		return meetingillustrate;
	}

	public void setMeetingillustrate(String meetingillustrate) {
		this.meetingillustrate = meetingillustrate;
	}

	public void setMeetingbooker(String meetingbooker) {
		this.meetingbooker = meetingbooker;
	}

	public String getMeetingbooker() {
		return meetingbooker;
	}

	public void setMeetingstate(String meetingstate) {
		this.meetingstate = meetingstate;
	}

	public String getMeetingstate() {
		return meetingstate;
	}

	public void setMeetingbookdate(Date meetingbookdate) {
		this.meetingbookdate = meetingbookdate;
	}

	public Date getMeetingbookdate() {
		return meetingbookdate;
	}
	
}
