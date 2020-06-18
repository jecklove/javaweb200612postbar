<%@page import="org.jgs1905.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册页面</title>
<link href="${ bp }/static/css/main.css" rel="stylesheet">
<link href="${ bp }/static/css/validate.css" rel="stylesheet">
</head>
<body>
	
	<div id="pageContent">
		<h3>注册页面</h3>
		<form action="${ bp }/user?method=regist" method="post" id="registForm">
			<p>昵称：<input type="text" name="nickname" value="${ user.nickname }"></p>
			<p>用户名：<input type="text" name="username" value="${ user.username }"></p>
			<p>密码：<input type="password" name="password" value="${ user.password }"></p>
			<p>确认密码：<input type="password" name="repassword"></p>
			<p><input type="submit" value="注册"></p>
			<p><a href="${ bp }/user/login.jsp">已有账号？立即登录！</a></p>
			<p style="color:red;">${ message }</p>
		</form>
	</div>

	<script type="text/javascript" src="${ bp }/static/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="${ bp }/static/js/jquery.validate.min.js"></script>
	<script type="text/javascript">
		$(function() {
			// 自定义规则
			$.validator.addMethod('myUsernameRule', function(value, element, param) {
				let usernameRegx = /^\w+$/;
				return this.optional(element) || usernameRegx.test(value);
			});
			
			// 指定表单进行校验
			$('#registForm').validate({
				rules: {
					nickname: {
						required: true,
						maxlength: 10,
					},
					username: {
						required: true,
						minlength: 6,
						maxlength: 20,
						myUsernameRule: true
					},
					password: 'required',
					repassword: {
						required: true,
						equalTo: "[name='password']"
					}
				},
				messages: {
					nickname: {
						required: "昵称不能为空",
						maxlength: "昵称不能超过10位",
					},
					username: {
						required: "用户名不能为空",
						minlength: "用户名不能少于6位",
						maxlength: "用户名不能超过20位",
						myUsernameRule: "用户名必须是数字字母下划线组合"
					},
					password: "密码不能为空",
					repassword: {
						required: "重复密码不能为空",
						equalTo: "两次输入密码不一致"
					}
				}
			});
		})
	</script>
</body>
</html>