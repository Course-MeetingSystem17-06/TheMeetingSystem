package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
				System.out.println("DAO_selectByNamePwd: "+ rs.getString("Employee_name"));
				employee.setUsername(rs.getString("Employee_username"));
				employee.setPhone(rs.getString("Employee_telenumber"));
				employee.setEmail(rs.getString("Employee_Email"));
				employee.setStatus(rs.getString("Employee_state"));
				employee.setDepartment(rs.getString("Employee_department"));
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
	 
//	 通过用户名查询，返回Employee对象，把查到的所有属性返回，以便后续使用。如果返回值为null，表示用户名不存在
	 public Employee selectByUsername(String username){
		 conn=ConnectionFactory.getConnection();
		 Employee employee=null;	
		 try {
			 PreparedStatement st=null;
			String sql="select * from employee where Employee_username='"+username+"'";
	 		st = conn.prepareStatement(sql);
			ResultSet rs =st.executeQuery(sql);
			if(rs.next()==true){
				employee=new Employee();
				employee.setEmployeeid(rs.getInt("Employee_ID"));
				employee.setEmployeename(rs.getString("Employee_name"));
				System.out.println("DAO_selectByUsername: "+ rs.getString("Employee_name"));
				employee.setUsername(rs.getString("Employee_username"));
				employee.setPhone(rs.getString("Employee_telenumber"));
				employee.setEmail(rs.getString("Employee_Email"));
				employee.setStatus(rs.getString("Employee_state"));
				employee.setDepartment(rs.getString("Employee_department"));
				employee.setPassword(rs.getString("Employee_password"));
				employee.setRole(rs.getString("Employee_limit"));
			}
		 } catch (SQLException e) {
			    e.printStackTrace();
		}finally{
			ConnectionFactory.closeConnection();
		}
		 return employee;
	 }
	 //根据所属部门查询人员
	 public Employee selectBydepartment(String department){
		 conn=ConnectionFactory.getConnection();
		 Employee employee=null;	
		 try {
			 PreparedStatement st=null;
			String sql="select * from employee where Employee_department='"+department+"'";
	 		st = conn.prepareStatement(sql);
			ResultSet rs =st.executeQuery(sql);
			if(rs.next()==true){
				employee=new Employee();
				employee.setEmployeeid(rs.getInt("Employee_ID"));
				employee.setEmployeename(rs.getString("Employee_name"));
				System.out.println("DAO_selectByUsername: "+ rs.getString("Employee_name"));
				employee.setUsername(rs.getString("Employee_username"));
				employee.setPhone(rs.getString("Employee_telenumber"));
				employee.setEmail(rs.getString("Employee_Email"));
				employee.setStatus(rs.getString("Employee_state"));
				employee.setDepartment(rs.getString("Employee_department"));
				employee.setPassword(rs.getString("Employee_password"));
				employee.setRole(rs.getString("Employee_limit"));
			}
		 } catch (SQLException e) {
			    e.printStackTrace();
		}finally{
			ConnectionFactory.closeConnection();
		}
		 return employee;
	 }
	 
//	向表employee中插入记录，其中status和role使用默认值
	  public void insert(Employee employee){
		  conn=ConnectionFactory.getConnection();
		  String sql="insert into employee"
				  +
					"(Employee_name,Employee_username,Employee_password,Employee_telenumber,Employee_Email,Employee_department,Employee_state,Employee_limit)" +
					" values(?,?,?,?,?,?,?,?)";
		  try {		
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,employee.getEmployeename());
			pstmt.setString(2,employee.getUsername());
			pstmt.setString(3,employee.getPassword() );
			pstmt.setString(4,employee.getPhone() );
			pstmt.setString(5,employee.getEmail());
			pstmt.setString(6,employee.getDepartment());
//			注册成功后，默认为正在审核，status为0
			pstmt.setString(7,"0");
//			注册时，默认为员工角色，role值为2
			pstmt.setString(8,"2");
			pstmt.executeUpdate();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionFactory.closeConnection();
		}	  
	  }
	  
// 		查询正在审核的员工信息，返回到集合中
		public List<Employee> selectAllEmployee() {
			conn = ConnectionFactory.getConnection();
			List<Employee> employeeslist = new ArrayList<Employee>();
			Employee employee = null;
			try {
			PreparedStatement psd = null;
			String sql="select * from employee where Employee_limit='2' and Employee_state='0'";
			psd = conn.prepareStatement(sql);
			ResultSet rs = psd.executeQuery(sql);
			while(rs.next()){
				employee=new Employee();
				employee.setEmployeeid(rs.getInt("Employee_ID"));
				employee.setEmployeename(rs.getString("Employee_name"));
				employee.setUsername(rs.getString("Employee_username"));
				employee.setPhone(rs.getString("Employee_telenumber"));
				employee.setEmail(rs.getString("Employee_Email"));
				employee.setStatus(rs.getString("Employee_state"));
				employee.setDepartment(rs.getString("Employee_department"));
				employee.setPassword(rs.getString("Employee_password"));
				employee.setRole(rs.getString("Employee_limit"));
				employeeslist.add(employee);
			}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				ConnectionFactory.closeConnection();
			}
			
			return employeeslist;

		}
		
//		向表employee中插入记录，其中status和role使用默认值
		  public void updateStatus(int employeeid,String status){
			  conn=ConnectionFactory.getConnection();
			  String sql="update employee set Employee_state='"+status+"'where Employee_ID="+employeeid;
			  try {		
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();	
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				ConnectionFactory.closeConnection();
			}	  
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