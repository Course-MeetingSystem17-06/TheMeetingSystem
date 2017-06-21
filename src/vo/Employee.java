package vo;

public class Employee {
	private Integer employeeid;
	private String employeename;
	private String password;
	private String username;
	private String email;
	private String department;
	private String phone;
	
	private String status="0";
	
	private String role="2";
	
	public Employee() {
		super();
	}
	
	public Employee(String username, String password, String role) {
		super();
		this.username = username;
		this.password = password;
		this.role = role;
	}
	
	public Employee(String employeename, String username, String password,
			String department, String email, String phone, String status,
			String role) {
		super();
		this.employeename = employeename;
		this.username = username;
		this.password = password;
		this.department = department;
		this.email = email;
		this.phone = phone;
		this.status = status;
		this.role = role;
	}

	public Employee(Integer employeeid, String employeename, String username,
			String password, String department, String email, String phone,
			String status, String role) {
		super();
		this.employeeid = employeeid;
		this.employeename = employeename;
		this.username = username;
		this.password = password;
		this.department = department;
		this.email = email;
		this.phone = phone;
		this.status = status;
		this.role = role;
	}
	public Integer getEmployeeid() {
		return employeeid;
	}
	public void setEmployeeid(Integer employeeid) {
		this.employeeid = employeeid;
	}
	public String getEmployeename() {
		return employeename;
	}
	public void setEmployeename(String employeename) {
		this.employeename = employeename;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "employeeid: "+employeeid+"  username: "+username+"  password: "+password+" " +
				"status: "+status+" role: "+role;
				
	}
	
	
}