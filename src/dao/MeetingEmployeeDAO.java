package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.ConnectionFactory;
import vo.MeetingEmployee;

public class MeetingEmployeeDAO {
	private Connection conn = ConnectionFactory.getConnection();
	
	public void insert(int Employeeid, int Meetingid) {
		conn = ConnectionFactory.getConnection();
		String sql = "insert into meetingemployee"
				+ "(Employee_ID,Meeting_ID)"
				+ " values(?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Employeeid);
			pstmt.setInt(2, Meetingid);
//			// 注册成功后，默认为正在审核，status为0
//			pstmt.setString(7, "0");
//			// 注册时，默认为员工角色，role值为2
//			pstmt.setString(8, "2");
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
	}
	
}
