package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.ConnectionFactory;
import vo.Department;
import vo.Employee;

public class DepartmentDAO {
	// DAO类关联连接工厂类
	private Connection conn;

	// 查询所有部门信息，返回到集合中
	public List<Department> selectAll() {
		System.out.println("222");
		conn = ConnectionFactory.getConnection();
		List<Department> departmentsList = new ArrayList<Department>();
		try {
			Statement st = null;
			String sql = "select * from department";
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			Department department;
			while (rs.next()) {
				department = new Department();
				department.setDepartmentid(rs.getString("Depart_ID"));
				department.setDepartmentname(rs.getString("Depart_name"));
				departmentsList.add(department);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
		return departmentsList;
	}
	
	public String  selectById(int id) {
		String departmentname = null;
		conn = ConnectionFactory.getConnection();
		try {
			Statement st = null;
			String sql = "select * from department where Depart_ID='"+id+"'";
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				departmentname = rs.getString("Depart_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
		return departmentname;
	}

	public void insert(String departmentname) {
		conn = ConnectionFactory.getConnection();
		String sql = "insert into department" + "(Depart_name)" + " values(?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, departmentname);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
	}

	public void delete(int departmentid) {
		conn = ConnectionFactory.getConnection();
		System.out.println("departmentid:"+departmentid);
		String sql = "delete from department where Depart_ID='"+departmentid+"'";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
	}

	public void edit(int departmentid, String departmentname) {
		conn = ConnectionFactory.getConnection();
		String sql = "update department set Depart_name='"+departmentname+"' where Depart_ID='"+departmentid+"'";
		//String sql1 = "update employee set Employee_department='"+departmentname+"' where Depart_ID='"+departmentid+"'"
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection();
		}
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		DepartmentDAO dao = new DepartmentDAO();
		List<Department> list = dao.selectAll();
		for (Department d : list) {
			System.out.println(d);
		}

	}

}
