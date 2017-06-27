package service;

import java.util.List;

import dao.DepartmentDAO;
import vo.Department;

public class DepartmentService {
	private DepartmentDAO dao=new DepartmentDAO();

	public List<Department> viewAllDepartments(){
		return dao.selectAll();
	}
	
	public void addDepartment(String departmentname){
		dao.insert(departmentname);
	}
	
	public void deleteDepartment(int departmentid){
		dao.delete(departmentid);
	}
}
