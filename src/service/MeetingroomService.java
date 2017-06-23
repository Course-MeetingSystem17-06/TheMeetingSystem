package service;

import vo.Meetingroom;
import dao.MeetingroomDAO;

public class MeetingroomService {
//	Service类关联DAO类
	private MeetingroomDAO dao=new MeetingroomDAO();
	
	

	public MeetingroomService() {
		super();
		// TODO Auto-generated constructor stub
	}



	//	注册功能，如果账号名存在，注册失败，返回0，否则注册成功，返回1
	public int regist(Meetingroom meetingroom){
		int flag=0;
		Meetingroom e=dao.selectBynum(meetingroom.getRoomnumber());
		if(e==null){
			flag=1;
			dao.insert(meetingroom);
		}
		return flag;
	}
}
