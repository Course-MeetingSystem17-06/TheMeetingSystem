
<%@ page language="java" import="java.util.*,vo.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>CoolMeeting会议管理系统</title>
<link rel="stylesheet" href="styles/common.css" />
<script type="text/javascript">
function getRemark(){
	alert(document.getElementById("roomremark").value);
}
</script>
</head>
<body>


	<div class="page-content">
		<div class="content-nav">会议预定 > 添加会议室</div>
		<form name="form1" action="MeetingroomServlet" method="post">
			<fieldset>
				<legend>会议室信息</legend>
				<tr>
					<td>提示信息:</td>
					<td><font color="red">${requestScope.msg}</font></td>
				</tr>
				<table class="formtable" style="width: 50%">
					<tr>
						<td>门牌号:</td>
						<td><input id="roomnumber" name="roomnumber" type="text"
							placeholder="例如：201" maxlength="10" value="${param.roomnumber}" />
						</td>
					</tr>
					<tr>
						<td>会议室名称:</td>
						<td><input id="roomname" name="roomname" type="text"
							placeholder="例如：第一会议室" maxlength="20" value="${param.capacity}" />
						</td>
					</tr>
					<tr>
						<td>最多容纳人数：</td>
						<td><input id="roommax" name="roommax" type="text"
							placeholder="填写一个正整数" value="${param.roomcapacity}" />
						</td>
					</tr>
					<tr>
						<td>当前状态：</td>
						<td><input type="radio" id="roomstate" name="roomstate"
							checked="checked" value="1" /><label for="status">启用</label> <input
							type="radio" id="status" name="status" /><label for="status"
							value="0">停用</label> <input type="radio" id="status"
							name="status" /><label for="status" value="-1">删除</label>
						</td>
					</tr>
					<tr>
						<td>备注：</td>
						<td><textarea id="roomremark" neme="roomremark"
								maxlength="200" rows="5" cols="60" placeholder="200字以内的文字描述"
								onchange="getRemark()"></textarea><input id="roomremark_value" name="roomremark_value" display="none"/>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="command"><input type="submit"
							value="添加" class="clickbutton" /> <input type="reset" value="重置"
							class="clickbutton" />
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>

</body>
</html>