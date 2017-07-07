<%@ page language="java" import="java.util.*,vo.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>CoolMeeting会议管理系统</title>
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript">
String.prototype.Trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
};
function validate(val) {
	$.ajax({
		type : "POST",
		url : "ValidateDepartmentServlet",
		data : {
			data : val
			},
		success : function(message) {
				var validateMessage = $("#validateMessage");
			var data = JSON.parse(message);
			if (data.flag) {
				var val_trim = val.Trim();
				if (val == "" || val_trim == "") {
					document.getElementById('change_button').disabled = true;
					validateMessage.html("不能为空");
					validateMessage.css({
						color : "red"
					});
					return;
				}
				document.getElementById('change_button').disabled = false;
				validateMessage.html(data.msg);
				validateMessage.css({
					color : "green"
				});

			} else {
				document.getElementById('change_button').disabled = true;
				validateMessage.html("<font name=error>" + data.msg
						+ "</font>");
				validateMessage.css({
					color : "red"
				});

			}
		}
	});
}

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
<link rel="stylesheet" href="styles/form.css">
</head>
<body>
	<div class="page-content">
		<div class="subfiled">
			<h2>人员管理 > 部门管理</h2>
		</div>
		<div style="margin-bottom: 7px;" class="subfiled-style2">
			<h2>添加部门</h2>
		</div>
		<form action="AddDeleteDepartmentServlet" method="post">
			<div class="kv-item">
				<label>部门名称：</label>
				<div class="kv-item-content">
					<input onchange="validate(this.value)" type="text"
						name="departmentname" maxlength="20" /> <input type="hidden"
						name="code" value="add"> <input type="submit"
						class="sapar-btn sapar-btn-recom" value="添加" id="change_button" />
					<div id="validateMessage"></div>
				</div>
			</div>
		</form>
		<div style="margin-top: 50px;" class="subfiled-style2">
			<h2>所有部门</h2>
		</div>
		<c:if test="${requestScope.departmentsList!=null}">
			<div class="table">
				<div class="table-box">
					<table>
						<thead>
							<tr class="listheader">
								<th>部门编号</th>
								<th>部门名称</th>
								<th>操作</th>
							</tr>
						</thead>
						<c:forEach var="emp" items="${requestScope.departmentsList}">
							<tr>
								<td class="orange bold">${emp.departmentid}</td>
								<td><span class="departmentname"
									id="departmentname${emp.departmentid}" style="">${emp.departmentname
										}</span> <input class="inputpartmentname"
									id="editdepartmentname${emp.departmentid}"
									name="editdepartmentname" type="text" maxlength="10"
									value="${emp.departmentname}" style="display: none;" /></td>
								<td><a class="clickbutton"
									onclick="edit(this.id, ${emp.departmentid}, 1)"
									id="edit${emp.departmentid}" style="">编辑</a> <a
									class="clickbutton" id="save${emp.departmentid}"
									style="display: none;" onclick="change(${emp.departmentid})">保存</a>
									<a class="clickbutton" id="cancel${emp.departmentid}"
									style="display: none;"
									onclick="edit(this.id, ${emp.departmentid}, 0)">取消</a> <a
									class="clickbutton"
									href="AddDeleteDepartmentServlet?code=delete&departmentid=${emp.departmentid}">删除</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</c:if>
	</div>
</body>
</html>
<!--  -->