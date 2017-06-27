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

	//添加功能，如果门牌号存在，失败，返回0，否则成功，返回1
	public int regist(Meetingroom meetingroom){
		int flag=0;
		Meetingroom e=dao.selectBynum(meetingroom.getRoomnumber());
		if(e==null){
			flag=1;
			dao.insert(meetingroom);
		}
		return flag;
	}
	
	public int update(Meetingroom meetingroom){
		int flag=0;
		Meetingroom e = dao.selectById(Integer.toString(meetingroom.getRoomid()));
		if(e!=null){
			flag=1;
			dao.updateRoom(meetingroom);
		}
		return flag;
	}
}
