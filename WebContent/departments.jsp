<%@ page language="java" import="java.util.*,vo.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>CoolMeeting会议管理系统</title>
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript">
	function edit(id, departmentid, i) {
		if (i == 1) {
			var currentBtn = document.getElementById(id);
			currentBtn.style.display = "none";
			//var a = "save"+departmentid;
			var saveBtn = document.getElementById("save"+departmentid);
			saveBtn.style.display = ""; //style中的display属性
			var cancelBtn = document.getElementById("cancel"+departmentid);
			cancelBtn.style.display = ""; //style中的display属性
			var editdepartmentname = document.getElementById("editdepartmentname"+departmentid);
			editdepartmentname.style.display = "";
			var departmentname = document.getElementById("departmentname"+departmentid);
			departmentname.style.display = "none";
		} 
		else if (i == 0) {
			var saveBtn = document.getElementById("edit"+departmentid);
			saveBtn.style.display = ""; //style中的display属性
			var saveBtn = document.getElementById("save"+departmentid);
			saveBtn.style.display = "none"; //style中的display属性
			var cancelBtn = document.getElementById(id);
			cancelBtn.style.display = "none"; //style中的display属性
			var editdepartmentname = document.getElementById("editdepartmentname"+departmentid);
			editdepartmentname.style.display = "none";
			var departmentname = document.getElementById("departmentname"+departmentid);
			departmentname.style.display = "";
		}
	}
	function change(id){
		var content = document.getElementById("editdepartmentname"+id).value;
		alert(content);
		window.location.href="AddDeleteDepartmentServlet?code=edit&departmentid="+id+"&editdepartmentname="+content;
	}
</script>
<link rel="stylesheet" href="styles/common03.css">
</head>
<body>
	<div class="page-content">
		<div class="content-nav">人员管理 > 注册审批</div>

		<form action="AddDeleteDepartmentServlet" method="post">
			<fieldset>
				<legend>添加部门</legend>
				部门名称： <input type="text" name="departmentname" maxlength="20" /> <input
					type="hidden" name="code" value="add"> <input type="submit"
					class="clickbutton" value="添加" />
			</fieldset>
		</form>
		<c:if test="${requestScope.departmentsList!=null}">
			<table class="listtable">
				<caption>所有部门：</caption>
				<tr class="listheader">
					<th>部门编号</th>
					<th>部门名称</th>
					<th>操作</th>
				</tr>
				<c:forEach var="emp" items="${requestScope.departmentsList}">
					<tr>
						<td>${emp.departmentid}</td>
						<td><a class="departmentname" id="departmentname${emp.departmentid}" style="">${emp.departmentname
								}</a> <input id="editdepartmentname${emp.departmentid}" name="editdepartmentname" type="text" maxlength="10"
							value="${emp.departmentname}" style="display: none;"/>
						</td>
						<td><a class="clickbutton" onclick="edit(this.id, ${emp.departmentid}, 1)" id="edit${emp.departmentid}"
							style="">编辑</a> <a class="clickbutton" id="save${emp.departmentid}" 
							style="display: none;" onclick="change(${emp.departmentid})">保存</a> <a
							class="clickbutton" id="cancel${emp.departmentid}" style="display: none;"
							onclick="edit(this.id, ${emp.departmentid}, 0)">取消</a> <a class="clickbutton"
							href="AddDeleteDepartmentServlet?code=delete&departmentid=${emp.departmentid}">删除</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
</html><!--  -->