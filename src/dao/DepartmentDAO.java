package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.ConnectionFactory;
import vo.Department;

public class DepartmentDAO {
//	 DAO类关联连接工厂类
	 private Connection conn;	
	 
//	 查询所有部门信息，返回到集合中
	 public List<Department> selectAll(){
		 System.out.println("222");
		 conn=ConnectionFactory.getConnection();
		 List<Department> departmentsList=new ArrayList<Department>();
		 try {
				Statement st=null;
				String sql="select * from department";
		 		st = conn.createStatement();
				ResultSet rs =st.executeQuery(sql);
				Department department;
				while(rs.next()){
					department=new Department();
					department.setDepartmentid(rs.getString("Depart_ID"));
					department.setDepartmentname(rs.getString("Depart_name"));
					departmentsList.add(department);
				}
			 } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				ConnectionFactory.closeConnection();
			}
		 return departmentsList;
	 }
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		DepartmentDAO dao=new DepartmentDAO();
		List<Department> list=dao.selectAll();
		for(Department d:list){
			System.out.println(d);
		}

	}

}
