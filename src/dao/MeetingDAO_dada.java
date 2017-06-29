package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import util.ConnectionFactory;
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
			sql = "select * from meeting where Meeting_state='1'" + bookdatesql + namesql
			+ roomnamesql + bookersql + meetingdatestartsql
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
			sql = "select * from meeting where Meeting_state='1'" + bookdatesql + namesql
					+ roomnamesql + bookersql + meetingdatestartsql
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
				Date a = meeting.getMeetingendtime();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
		return meeting;
	}
//	更新会议说明信息
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
	//取消会议
	public void cancelMeetingById(String meetingid, String reason){
		try{
			PreparedStatement st = null;
			String sql = "update meeting set Meeting_state='2' , Meeting_cancelreason='" + reason + "' where Meeting_ID='" + meetingid + "'";
			st = conn.prepareStatement(sql);
			st.executeUpdate();
		}catch (SQLException e){
			e.printStackTrace();
		}finally{
			ConnectionFactory.closeConnection();
		}
	}
}
