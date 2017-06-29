<%@ page language="java" import="java.util.*,vo.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/common03.css" />
<style type="text/css">
#divfrom {
	float: left;
	width: 150px;
}

#divto {
	float: left;
	width: 150px;
}

#divoperator {
	float: left;
	width: 50px;
	padding: 60px 5px;
}

#divoperator input[type="button"] {
	margin: 10px 0;
}

#selDepartments {
	display: block;
	width: 100%;
}

#selEmployees {
	display: block;
	width: 100%;
	height: 200px;
}

#selSelectedEmployees {
	display: block;
	width: 100%;
	height: 225px;
}
</style>
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function aa() {
		alert("111");
	}
	function employee(employeeid, employeename) {
		this.employeeid = employeeid;
		this.employeename = employeename;
	}
	function department(departmentid, departmentname, employees) {
		this.departmentid = departmentid;
		this.departmentname = departmentname;
		this.employees = employees;
	}
	/*var data = new Array(new department(1, "技术部", new Array(new employee(1001,
			"a00"), new employee(1002, "a01"), new employee(1003, "a02"),
			new employee(1004, "a03"))), new department(2, "销售部", new Array(
			new employee(2001, "b00"), new employee(2002, "b01"), new employee(
					2003, "b02"), new employee(2004, "b03"))), new department(
			3, "市场部", new Array(new employee(3001, "c00"), new employee(3002,
					"c01"), new employee(3003, "c02"),
					new employee(3004, "c03"))), new department(4, "行政部",
			new Array(new employee(4001, "d00"), new employee(4002, "d01"),
					new employee(4003, "d02"), new employee(4004, "d03"))));*/

	var selDepartments;
	var selEmployees;
	var selSelectedEmployees;

	function body_load() {
		selDepartments = document.getElementById("selDepartments");
		selEmployees = document.getElementById("selEmployees");
		selSelectedEmployees = document.getElementById("selSelectedEmployees");

		for ( var i = 0; i < 8; i++) {//长度
			var dep = document.createElement("option");
			dep.value = data[i].departmentid;
			dep.text = data[i].departmentname;
			selDepartments.appendChild(dep);
		}

		fillEmployees();
	}

	/////////////////////////////////////////
	function showEmployees() {
		//alert("d");
		createXMLHttpRequest();

		var deptid = document.getElementById("selDepartments").value;
		var deptid1 = encodeURI(encodeURI(deptid));
		var url = "SelectEmployeesOfDeptServlet_647?departmentid=" + deptid1
				+ "";
		xmlHttp.open("GET", url, true);
		xmlHttp.onreadystatechange = callback;
		xmlHttp.send(null);
	}

	function callback() {
		clearEmployees();
		var selEmployees = document.getElementById("selEmployees");
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {

				//alert(xmlHttp.responseXML);
				var elements = xmlHttp.responseXML
						.getElementsByTagName("option");
				//alert(elements[0].getElementsByTagName("value")[0].firstChild.nodeValue);
				for ( var i = 0; i < elements.length; i++) {
					var value = elements[i].getElementsByTagName("value")[0].firstChild.nodeValue;
					var text = elements[i].getElementsByTagName("text")[0].firstChild.nodeValue;
					selEmployees.options.add(new Option(text, value));
				}
			}
		}

	}
	function createXMLHttpRequest() {
		if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		}
	}
	function clearEmployees() {
		document.getElementById("selEmployees").options.length = 0;
	}
	function selectEmployees() {
		for ( var i = 0; i < document.getElementById("selEmployees").options.length; i++) {
			if (document.getElementById("selEmployees").options[i].selected) {
				addEmployee(document.getElementById("selEmployees").options[i]);
				document.getElementById("selEmployees").options[i].selected = false;
			}
		}
	}
	function deSelectEmployees() {
		var elementsToRemoved = new Array();
		var options = document.getElementById("selSelectedEmployees").options;
		for ( var i = 0; i < options.length; i++) {
			if (options[i].selected) {
				elementsToRemoved.push(options[i]);
			}
		}
		for (i = 0; i < elementsToRemoved.length; i++) {
			document.getElementById("selSelectedEmployees").removeChild(
					elementsToRemoved[i]);
		}
	}
	function addEmployee(optEmployee) {
		var options = document.getElementById("selSelectedEmployees").options;
		var i = 0;
		var insertIndex = -1;
		while (i < options.length) {
			if (optEmployee.value == options[i].value) {
				return;
			} else if (optEmployee.value < options[i].value) {
				insertIndex = i;
				break;
			}
			i++;
		}
		var opt = document.createElement("option");
		opt.value = optEmployee.value;
		opt.text = optEmployee.text;

		if (insertIndex == -1) {
			document.getElementById("selSelectedEmployees").appendChild(opt);
		} else {
			document.getElementById("selSelectedEmployees").insertBefore(opt,
					options[insertIndex]);
		}
	}
	/*function fillEmployees() {
	
		DepartmentDAO
		departmentdao = new DepartmentDAO();
		List<Department>
		DepartmentsList = departmentdao.selectAll();
		clearList(selEmployees);
		var departmentid = selDepartments.options[selDepartments.selectedIndex].value;
		var employees;
		for ( var department in DepartmentsList) {
			if (department.departmentname == departmentname) {
				employees = selectBydepartment(department.departmentname);
				break;
			}
		}
		for ( var employee in employees) {
			var emp = document.createElement("option");
			emp.value = employees[i].employeeid;
			emp.text = employees[i].employeename;
			selEmployees.appendChild(emp);
		}

		for ( var i = 0; i < data.length; i++) {
			if (departmentid == data[i].departmentid) {
				employees = data[i].employees;
				break;
			}
		}
		for ( var i = 0; i < employees.length; i++) {
			var emp = document.createElement("option");
			emp.value = employees[i].employeeid;
			emp.text = employees[i].employeename;
			selEmployees.appendChild(emp);
		}

	}onload="body_load()"

	function clearList(list) {
		while (list.childElementCount > 0) {
			list.removeChild(list.lastChild);
		}
	}

	function selectEmployees() {
		for ( var i = 0; i < selEmployees.options.length; i++) {
			if (selEmployees.options[i].selected) {
				addEmployee(selEmployees.options[i]);
				selEmployees.options[i].selected = false;
			}
		}
	}

	function deSelectEmployees() {
		var elementsToRemoved = new Array();
		var options = selSelectedEmployees.options;
		for ( var i = 0; i < options.length; i++) {
			if (options[i].selected) {
				elementsToRemoved.push(options[i]);
			}
		}
		for (i = 0; i < elementsToRemoved.length; i++) {
			selSelectedEmployees.removeChild(elementsToRemoved[i]);
		}
	}

	function addEmployee(optEmployee) {
		var options = selSelectedEmployees.options;
		var i = 0;
		var insertIndex = -1;
		while (i < options.length) {
			if (optEmployee.value == options[i].value) {
				return;
			} else if (optEmployee.value < options[i].value) {
				insertIndex = i;
				break;
			}
			i++;
		}
		var opt = document.createElement("option");
		opt.value = optEmployee.value;
		opt.text = optEmployee.text;

		if (insertIndex == -1) {
			selSelectedEmployees.appendChild(opt);
		} else {
			selSelectedEmployees.insertBefore(opt, options[insertIndex]);
		}
	} */
</script>
</head>
<body>
	<div class="page-content">
		<div class="content-nav">会议预定 > 预定会议</div>
		<form name="form1" action="BookMeetingServlet" method="post">
			<fieldset>
				<legend>会议信息</legend>
				<table class="formtable">
					<tr>
						<td>会议名称：</td>
						<td><input type="text" id="meetingname" name="meetingname"
							maxlength="20" />
						</td>
					</tr>
					<tr>
						<td>预计参加人数：</td>
						<td><input type="text" id="meetingparticipatenumber"
							name="meetingpnumber" />
						</td>
					</tr>
					<tr>
						<td>预计开始时间：</td>
						<td><input class="Wdate" type="text" name="starttime"
							onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
						</td>

					</tr>
					<tr>
						<td>预计结束时间：</td>
						<td><input class="Wdate" type="text" name="endtime"
							onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"></td>

					</tr>
					<tr>
						<td>会议室名称：</td>
						<td><select id="deptid" name="meetingroomid">
								<c:forEach var="meetingroom"
									items="${requestScope.meetingroomsList}">
									<c:if test="${meetingroom.roomnumber== param.deptid}">
										<option value="${meetingroom.roomname}" selected>${meetingroom.roomname}</option>
									</c:if>
									<c:if test="${meetingroom.roomnumber!= param.deptid}">
										<option value="${meetingroom.roomname}">${meetingroom.roomname}</option>
									</c:if>
								</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td>会议说明：</td>
						<td><textarea id="description" name="meetingillustrate"
								rows="5"></textarea>
						</td>
					</tr>
					<tr>
						<td>选择参会人员：</td>
						<td>
							<div id="divfrom" name=meetingrname>
								<select id="selDepartments" name="deptid"
									onchange="showEmployees()">
									<c:forEach var="department"
										items="${requestScope.departmentsList}">
										<c:if test="${department.departmentid== param.deptid}">
											<option value="${department.departmentname}" selected>${department.departmentname}</option>
										</c:if>
										<c:if test="${department.departmentid!= param.deptid}">
											<option value="${department.departmentname}">${department.departmentname}</option>
										</c:if>
									</c:forEach>
								</select> <select id="selEmployees" multiple="true">
								</select>
								<!--  <select id="selDepartments" onchange="fillEmployees()">
								</select> <select id="selEmployees" multiple="true">
								</select>-->
							</div>
							<div id="divoperator">
								<input type="button" class="clickbutton" value="&gt;"
									onclick="selectEmployees()" /> <input type="button"
									class="clickbutton" value="&lt;" onclick="deSelectEmployees()" />
							</div>
							<div id="divto">
								<select id="selSelectedEmployees" multiple="true">
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td class="command" colspan="2"><input type="submit"
							class="clickbutton" value="预定会议" /> <input
							type="reset" class="clickbutton" value="重置" />
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	</div>
</body>
</html>