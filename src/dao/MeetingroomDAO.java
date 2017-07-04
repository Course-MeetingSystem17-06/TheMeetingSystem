package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.ConnectionFactory;
import vo.Employee;
import vo.Meetingroom;

;

public class MeetingroomDAO {
	// DAO类关联连接工厂类
	private Connection conn = ConnectionFactory.getConnection();

	// 查询正在审核的员工信息，返回到集合中
	public List<Meetingroom> selectAllMeetingroom() {
		conn = ConnectionFactory.getConnection();
		List<Meetingroom> meetingroomlist = new ArrayList<Meetingroom>();
		Meetingroom meetingroom = null;
		try {
			PreparedStatement psd = null;
			String sql = "select * from meetingroom";
			psd = conn.prepareStatement(sql);
			ResultSet rs = psd.executeQuery(sql);
			while (rs.next()) {
				meetingroom = new Meetingroom();
				meetingroom.setRoomid(rs.getInt("MeetingRoom_ID"));
				meetingroom.setRoomnumber(rs.getString("MeetingRoom_number"));
				// System.out.println("DAO_selectByNamePwd: "+
				// rs.getString("meetingroom_name"));
				meetingroom.setRoomname(rs.getString("MeetingRoom_name"));
				meetingroom.setRoommax(rs.getString("MeetingRoom_max"));
				meetingroom.setRoomstate(rs.getString("MeetingRoom_state"));
				meetingroom.setRoomremark(rs.getString("MeetingRoom_remark"));
				meetingroomlist.add(meetingroom);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
		return meetingroomlist;

	}

	// 按会议室number查询会议室
	public Meetingroom selectBynum(String number) {
		Meetingroom meetingroom = null;

		try {
			PreparedStatement st = null;
			String sql = "select * from meetingroom where MeetingRoom_number='"
					+ number + "'";
			st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			if (rs.next() == true) {
				meetingroom = new Meetingroom();
				meetingroom.setRoomid(rs.getInt("MeetingRoom_ID"));
				meetingroom.setRoomnumber(rs.getString("MeetingRoom_number"));
				// System.out.println("DAO_selectByNamePwd: "+
				// rs.getString("meetingroom_name"));
				meetingroom.setRoomname(rs.getString("MeetingRoom_name"));
				meetingroom.setRoommax(rs.getString("MeetingRoom_max"));
				meetingroom.setRoomstate(rs.getString("MeetingRoom_state"));
				meetingroom.setRoomremark(rs.getString("MeetingRoom_remark"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
		return meetingroom;
	}

	public Meetingroom selectByname(String name) {
		Meetingroom meetingroom = null;

		try {
			PreparedStatement st = null;
			String sql = "select * from meetingroom where MeetingRoom_name='"
					+ name + "'";
			st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			if (rs.next() == true) {
				meetingroom = new Meetingroom();
				meetingroom.setRoomid(rs.getInt("MeetingRoom_ID"));
				meetingroom.setRoomnumber(rs.getString("MeetingRoom_number"));
				// System.out.println("DAO_selectByNamePwd: "+
				// rs.getString("meetingroom_name"));
				meetingroom.setRoomname(rs.getString("MeetingRoom_name"));
				meetingroom.setRoommax(rs.getString("MeetingRoom_max"));
				meetingroom.setRoomstate(rs.getString("MeetingRoom_state"));
				meetingroom.setRoomremark(rs.getString("MeetingRoom_remark"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
		return meetingroom;
	}
	
	// 按会议室id查询会议室
	public Meetingroom selectById(String ID) {
		Meetingroom meetingroom = null;

		try {
			PreparedStatement st = null;
			String sql = "select * from meetingroom where MeetingRoom_ID='"
					+ ID + "'";
			st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			if (rs.next() == true) {
				meetingroom = new Meetingroom();
				meetingroom.setRoomid(rs.getInt("MeetingRoom_ID"));
				meetingroom.setRoomnumber(rs.getString("MeetingRoom_number"));
				// System.out.println("DAO_selectByNamePwd: "+
				// rs.getString("meetingroom_name"));
				meetingroom.setRoomname(rs.getString("MeetingRoom_name"));
				meetingroom.setRoommax(rs.getString("MeetingRoom_max"));
				meetingroom.setRoomstate(rs.getString("MeetingRoom_state"));
				meetingroom.setRoomremark(rs.getString("MeetingRoom_remark"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
		return meetingroom;
	}

	// 插入新会议室
	public void insert(Meetingroom meetingroom) {
		conn = ConnectionFactory.getConnection();
		String sql = "insert into meetingroom"
				+ "(MeetingRoom_number,MeetingRoom_name,MeetingRoom_max,MeetingRoom_state,MeetingRoom_remark)"
				+ " values(?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, meetingroom.getRoomnumber());
			pstmt.setString(2, meetingroom.getRoomname());
			pstmt.setString(3, meetingroom.getRoommax());
			pstmt.setString(4, meetingroom.getRoomstate());
			pstmt.setString(5, meetingroom.getRoomremark());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
	}

	// 根据会议室ID更新某会议室内容
	public void updateRoom(Meetingroom meetingroom) {
		String room[] = { meetingroom.getRoomnumber(),
				meetingroom.getRoomname(), meetingroom.getRoommax(),
				meetingroom.getRoomstate(), meetingroom.getRoomremark() };
		String ID = Integer.toString(meetingroom.getRoomid());
		conn = ConnectionFactory.getConnection();
		String sql = "update meetingroom set MeetingRoom_number='" + room[0]
				+ "',MeetingRoom_name='" + room[1] + "',MeetingRoom_max='"
				+ room[2] + "',MeetingRoom_state='" + room[3]
				+ "',MeetingRoom_remark='" + room[4]
				+ "'where MeetingRoom_ID='" + ID + "'";
		try {
			PreparedStatement st = conn.prepareStatement(sql);
			st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
	}

	// 根据ID更新状态
	public void updateRoomStatus(String ID, String state) {
		conn = ConnectionFactory.getConnection();
		String sql = "update meetingroom set MeetingRoom_state='" + state
				+ "' where MeetingRoom_ID='" + ID + "'";
		try {
			PreparedStatement st = conn.prepareStatement(sql);
			st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
	}
	

	
}
