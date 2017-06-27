package vo;

public class Meetingroom {
	int roomid;
	String roomnumber;
	String roomname;
	String roommax;
	String roomstate;
	String roomremark;
	
	
	
	public Meetingroom() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Meetingroom( String roomnumber, String roomname,
			String roommax, String roomstate, String roomremark) {
		super();
		this.roomnumber = roomnumber;
		this.roomname = roomname;
		this.roommax = roommax;
		this.roomstate = roomstate;
		this.roomremark = roomremark;
	}
	
	public int getRoomid() {
		return roomid;
	}
	public void setRoomid(int roomid) {
		this.roomid = roomid;
	}
	public String getRoomnumber() {
		return roomnumber;
	}
	public void setRoomnumber(String roomnumber) {
		this.roomnumber = roomnumber;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public String getRoommax() {
		return roommax;
	}
	public void setRoommax(String roommax) {
		this.roommax = roommax;
	}
	public String getRoomstate() {
		return roomstate;
	}
	public void setRoomstate(String roomstate) {
		this.roomstate = roomstate;
	}
	public String getRoomremark() {
		return roomremark;
	}
	public void setRoomremark(String roomremark) {
		this.roomremark = roomremark;
	}
	
	
}
