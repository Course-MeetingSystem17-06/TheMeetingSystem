package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import util.ConnectionFactory;
import vo.Employee;
import vo.Meeting_dada;

public class MeetingDAO_dada {

	// DAO类关联连接工厂类
	private Connection conn = ConnectionFactory.getConnection();

	// 根据名称、会议室名称、预定人、开始结束时间， 查询所有会议信息，返回到集合中。
	public List<Meeting_dada> selectMeetingsByFilter(String meetingname,
			String meetingroomname, String meetingbooker,
			Date meetingstarttime, Date meetingendtime,
			Date meetingbookdatestart, Date meetingbookdateend) {
		conn = ConnectionFactory.getConnection();

		List<Meeting_dada> meetingslist = new ArrayList<Meeting_dada>();
		Meeting_dada meeting = null;
		try {
			PreparedStatement st = null;
			String sql = null;
			String namesql, roomnamesql, bookersql, meetingdatestartsql, meetingdateendsql, bookdatesql = null;
			if (meetingname == null || meetingname.equals("")) {
				namesql = "";
			} else {
				namesql = " and Meeting_name='" + meetingname + "'";
			}
			if (meetingroomname == null || meetingroomname.equals("")) {
				roomnamesql = "";
			} else {
				roomnamesql = " and Meeting_rname='" + meetingroomname + "'";
			}
			if (meetingbooker == null || meetingbooker.equals("")) {
				bookersql = "";
			} else {
				bookersql = " and Meeting_booker='" + meetingbooker + "'";
			}

			if (meetingstarttime == null || meetingstarttime.equals("")) {
				meetingdatestartsql = "";
			} else {
				meetingdatestartsql = " and Meeting_stime>='"
						+ meetingstarttime + "'";
			}
			if (meetingendtime == null || meetingendtime.equals("")) {
				meetingdateendsql = "";
			} else {
				meetingdateendsql = " and Meeting_etime<='" + meetingendtime
						+ "'";
			}

			if (meetingbookdatestart == null || meetingbookdateend == null) {
				bookdatesql = "";
			} else {
				bookdatesql = " and Meeting_bookdate between '"
						+ meetingbookdatestart + "' and '" + meetingbookdateend
						+ "'";
			}
			sql = "select * from meeting where Meeting_state='1'" + bookdatesql
					+ namesql + roomnamesql + bookersql + meetingdatestartsql
					+ meetingdateendsql;
			st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				meeting = new Meeting_dada();
				meeting.setMeetingid(rs.getInt("Meeting_id"));
				meeting.setMeetingname(rs.getString("Meeting_name"));
				meeting.setMeetingroomname(rs.getString("Meeting_rname"));
				meeting.setMeetingparticipatenumber(rs
						.getString("Meeting_pnumber"));
				meeting.setMeetingstarttime(rs.getDate("Meeting_stime"));
				meeting.setMeetingendtime(rs.getDate("Meeting_etime"));
				meeting.setMeetingillustrate(rs.getString("Meeting_illustrate"));
				meeting.setMeetingbooker(rs.getString("Meeting_booker"));
				meeting.setMeetingstate(rs.getString("Meeting_state"));
				meeting.setMeetingbookdate(rs.getDate("Meeting_bookdate"));
				meetingslist.add(meeting);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
		return meetingslist;
	}

	// 根据名称、会议室名称、预定人、开始结束时间， 查询当前页会议信息，返回到集合中。
	public List<Meeting_dada> selectMeetingsOfOnePage(String meetingname,
			String meetingroomname, String meetingbooker,
			Date meetingstarttime, Date meetingendtime,
			Date meetingbookdatestart, Date meetingbookdateend, int start,
			int count) {
		conn = ConnectionFactory.getConnection();

		List<Meeting_dada> meetingslist = new ArrayList<Meeting_dada>();
		Meeting_dada meeting = null;
		try {
			PreparedStatement st = null;
			String sql = null;
			String namesql, roomnamesql, bookersql, meetingdatestartsql, meetingdateendsql, bookdatesql = null;
			if (meetingname == null || meetingname.equals("")) {
				namesql = "";
			} else {
				namesql = " and Meeting_name='" + meetingname + "'";
			}
			if (meetingroomname == null || meetingroomname.equals("")) {
				roomnamesql = "";
			} else {
				roomnamesql = " and Meeting_rname='" + meetingroomname + "'";
			}
			if (meetingbooker == null || meetingbooker.equals("")) {
				bookersql = "";
			} else {
				bookersql = " and Meeting_booker='" + meetingbooker + "'";
			}

			if (meetingstarttime == null || meetingstarttime.equals("")) {
				meetingdatestartsql = "";
			} else {
				meetingdatestartsql = " and Meeting_stime>='"
						+ meetingstarttime + "'";
			}
			if (meetingendtime == null || meetingendtime.equals("")) {
				meetingdateendsql = "";
			} else {
				meetingdateendsql = " and Meeting_etime<='" + meetingendtime
						+ "'";
			}

			if (meetingbookdatestart == null || meetingbookdateend == null) {
				bookdatesql = "";
			} else {
				bookdatesql = " and Meeting_bookdate between '"
						+ meetingbookdatestart + "' and '" + meetingbookdateend
						+ "'";
			}
			sql = "select * from meeting where Meeting_state='1'" + bookdatesql
					+ namesql + roomnamesql + bookersql + meetingdatestartsql
					+ meetingdateendsql + " limit " + start + " ," + count;
			st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				meeting = new Meeting_dada();
				meeting.setMeetingid(rs.getInt("Meeting_id"));
				meeting.setMeetingname(rs.getString("Meeting_name"));
				meeting.setMeetingroomname(rs.getString("Meeting_rname"));
				meeting.setMeetingparticipatenumber(rs
						.getString("Meeting_pnumber"));
				meeting.setMeetingstarttime(rs.getDate("Meeting_stime"));
				meeting.setMeetingendtime(rs.getDate("Meeting_etime"));
				meeting.setMeetingillustrate(rs.getString("Meeting_illustrate"));
				meeting.setMeetingbooker(rs.getString("Meeting_booker"));
				meeting.setMeetingstate(rs.getString("Meeting_state"));
				meeting.setMeetingbookdate(rs.getDate("Meeting_bookdate"));
				meetingslist.add(meeting);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
		return meetingslist;
	}

	// 按id查询会议
	public Meeting_dada selectById(String ID) {
		Meeting_dada meeting = null;

		try {
			PreparedStatement st = null;
			String sql = "select * from meeting where Meeting_ID='" + ID + "'";
			st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			if (rs.next() == true) {
				meeting = new Meeting_dada();
				meeting.setMeetingid(rs.getInt("Meeting_id"));
				meeting.setMeetingname(rs.getString("Meeting_name"));
				meeting.setMeetingroomname(rs.getString("Meeting_rname"));
				meeting.setMeetingparticipatenumber(rs
						.getString("Meeting_pnumber"));
				meeting.setMeetingstarttime(rs.getDate("Meeting_stime"));
				meeting.setMeetingendtime(rs.getDate("Meeting_etime"));
				meeting.setMeetingillustrate(rs.getString("Meeting_illustrate"));
				meeting.setMeetingbooker(rs.getString("Meeting_booker"));
				meeting.setMeetingstate(rs.getString("Meeting_state"));
				meeting.setMeetingbookdate(rs.getDate("Meeting_bookdate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
		return meeting;
	}

	// 更新会议说明信息
	public void updateMeetingIllustrate(String meetingid, String illustrate) {
		try {
			PreparedStatement st = null;
			String sql = "update meeting set Meeting_illustrate='" + illustrate
					+ "' where Meeting_ID='" + meetingid + "'";
			st = conn.prepareStatement(sql);
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
	}

	// 取消会议
	public void cancelMeetingById(String meetingid, String reason) {
		try {
			PreparedStatement st = null;
			String sql = "update meeting set Meeting_state='2' , Meeting_cancelreason='"
					+ reason + "' where Meeting_ID='" + meetingid + "'";
			st = conn.prepareStatement(sql);
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
	}

	public void insert(Meeting_dada meeting) {
		conn = ConnectionFactory.getConnection();
		String sql = "insert into meeting"
				+ "(Meeting_name,Meeting_rname,Meeting_pnumber,Meeting_stime,Meeting_etime,Meeting_illustrate,Meeting_booker,Meeting_state,Meeting_bookdate)"
				+ " values(?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, meeting.getMeetingname());
			pstmt.setString(2, meeting.getMeetingroomname());
			pstmt.setString(3, meeting.getMeetingparticipatenumber());
			String a = meeting.getMeetingstarttime().toString();
			pstmt.setString(4, a);
			String b = meeting.getMeetingendtime().toString();
			pstmt.setString(5, b);
			pstmt.setString(6, meeting.getMeetingillustrate());
			pstmt.setString(7, meeting.getMeetingbooker());
			pstmt.setString(8, meeting.getMeetingstate());
			String c = meeting.getMeetingbookdate().toString();
			pstmt.setString(9, c);
			// // 注册成功后，默认为正在审核，status为0
			// pstmt.setString(7, "0");
			// // 注册时，默认为员工角色，role值为2
			// pstmt.setString(8, "2");
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
	}

	// 根据会议id查找此会议的参会人员集合
	public List<Employee> selectEmployeesByMeetingId(String meetingid) {
		conn = ConnectionFactory.getConnection();
		String sql_id = "select * from meetingemployee where Meeting_ID ='"
				+ meetingid + "'";
		List<Employee> meetingemployeesList = new ArrayList<Employee>();
		Employee employee = null;
		try {
			PreparedStatement ps_id = conn.prepareStatement(sql_id);
			ResultSet rs_id = ps_id.executeQuery(sql_id);
			while (rs_id.next()) {
				Connection conn_info = ConnectionFactory.getConnection();
				String sql_info = "select * from employee where Employee_ID='"
						+ rs_id.getString("Employee_ID") + "'";
				PreparedStatement ps_info = conn_info
						.prepareStatement(sql_info);
				ResultSet rs_info = ps_info.executeQuery(sql_info);
				if (rs_info.next()) {
					employee = new Employee();
					employee.setEmployeename(rs_info.getString("Employee_name"));
					employee.setPhone(rs_info.getString("Employee_telenumber"));
					employee.setEmail(rs_info.getString("Employee_email"));
					meetingemployeesList.add(employee);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
		return meetingemployeesList;
	}

	public int selectmeetingid() {
		int id = 0;
		conn = ConnectionFactory.getConnection();
		Meeting_dada meeting = null;
		try {
			PreparedStatement st = null;
			String sql = "select * from meeting where Meeting_id in (select max(Meeting_id) from meeting)";
			st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			if (rs.next() == true) {
				meeting = new Meeting_dada();
				id = rs.getInt("Meeting_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
		return id++;
	}

	// 根据预定人id查找此人7天内的可用会议
	public List<Meeting_dada> selectLatestMeetings(String meetingbooker,
			String now, String future) {
		conn = ConnectionFactory.getConnection();
		String sql = "select * from meeting where Meeting_booker='"
				+ meetingbooker + "' and Meeting_stime>'" + now
				+ "' and Meeting_stime<'" + future + "' and Meeting_state='1'";
		List<Meeting_dada> latestmeetingsList = new ArrayList<Meeting_dada>();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery(sql);
			while (rs.next()) {
				Meeting_dada meeting = new Meeting_dada();
				meeting.setMeetingid(rs.getInt("Meeting_id"));
				meeting.setMeetingname(rs.getString("Meeting_name"));
				meeting.setMeetingroomname(rs.getString("Meeting_rname"));
				meeting.setMeetingstarttime(rs.getDate("Meeting_stime"));
				meeting.setMeetingendtime(rs.getDate("Meeting_etime"));
				latestmeetingsList.add(meeting);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
		return latestmeetingsList;
	}

	// 根据预定人id查找此人未来本应参加但是被取消的会议
	public List<Meeting_dada> selectCancelMeetings(String meetingbooker,
			String date) {
		conn = ConnectionFactory.getConnection();
		String sql = "select * from meeting where Meeting_booker='"
				+ meetingbooker + "' and Meeting_stime>'" + date
				+ "' and Meeting_state='2'";
		List<Meeting_dada> latestmeetingsList = new ArrayList<Meeting_dada>();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery(sql);
			while (rs.next()) {
				Meeting_dada meeting = new Meeting_dada();
				meeting.setMeetingid(rs.getInt("Meeting_id"));
				meeting.setMeetingname(rs.getString("Meeting_name"));
				meeting.setMeetingroomname(rs.getString("Meeting_rname"));
				meeting.setMeetingstarttime(rs.getDate("Meeting_stime"));
				meeting.setMeetingendtime(rs.getDate("Meeting_etime"));
				meeting.setMeetingcancelreason(rs
						.getString("Meeting_cancelreason"));
				latestmeetingsList.add(meeting);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
		return latestmeetingsList;
	}
}
