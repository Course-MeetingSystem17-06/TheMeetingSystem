package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.ConnectionFactory;
import vo.Meetingroom;

;

public class MeetingroomDAO {
	// DAO类关联连接工厂类
	private Connection conn=ConnectionFactory.getConnection();

	// 按会议室number查询
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
}