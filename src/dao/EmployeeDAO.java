package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.ConnectionFactory;
import vo.Employee;

public class EmployeeDAO {
	
//	DAO类关联连接工厂类
	 private Connection conn=ConnectionFactory.getConnection();
	 
//	 通过用户名和密码查询，返回Employee对象，把查到的所有属性返回，以便后续使用。如果返回值为null，表示用户名密码出错
	 public Employee selectByNamePwd(String username,String pwd){
		 Employee employee=null;
		
		 try {
			 PreparedStatement st=null;
			String sql="select * from employee where Employee_username='"+username+"' and  Employee_password='"+pwd+"'";
	 		st = conn.prepareStatement(sql);
			ResultSet rs =st.executeQuery(sql);
			if(rs.next()==true){
				employee=new Employee();
				employee.setEmployeeid(rs.getInt("Employee_ID"));
				employee.setEmployeename(rs.getString("Employee_name"));
				System.out.println("DAO: "+ rs.getString("Employee_name"));
				employee.setUsername(rs.getString("Employee_username"));
				employee.setPhone(rs.getString("Employee_telenumber"));
				employee.setEmail(rs.getString("Employee_E-mail"));
				employee.setStatus(rs.getString("Employee_state"));
				employee.setdepartment(rs.getString("Employee_department"));
				employee.setPassword(rs.getString("Employee_password"));
				employee.setRole(rs.getString("Employee_limit"));
			}
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionFactory.closeConnection();
		}
		 return employee;
	 }
	 
	 
/*	*//**
	 * @param args
	 * 写代码测试类中的方法
	 *//*
	public static void main(String[] args) {
		EmployeeDAO dao=new EmployeeDAO();
		Employee e=dao.selectByNamePwd("wangxh", "1");
//		if(e!=null){
//			System.out.println(e);
//		}else{
//			System.out.println("登录失败");
//		}
	}*/

}