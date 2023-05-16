<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/main.css"/>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Log In</title>
</head>
<body>
	<div class="text-center my-4">
		<h1>Book Club</h1>
		<p>A place for friends to share thoughts on books.</p>
	</div>
	<div class="container my-3">
		<form:form action="/register" method="POST" modelAttribute="newUser" class="col-md-6 mx-auto">
			<h2>Register</h2>
			<div class="form-group">
				<form:label path="name">Name:</form:label>
				<form:errors class="text-danger" path="name"/>
				<form:input class="form-control" path="name"/>				
			</div>
			<div class="form-group">
				<form:label path="email">Email:</form:label>
				<form:errors class="text-danger" path="email"/>
				<form:input class="form-control" path="email" type="email"/>				
			</div>		
			<div class="form-group">
				<form:label path="password">Password:</form:label>
				<form:errors class="text-danger" path="password"/>
				<form:input class="form-control" path="password" type="password"/>				
			</div>
			<div class="form-group">
				<form:label path="confirm">Confirm Password:</form:label>
				<form:errors class="text-danger" path="confirm"/>
				<form:input class="form-control" path="confirm" type="password"/>				
			</div>		
			<input type="submit" class="btn btn-primary my-3" value="Submit"/>						
		</form:form>
		<form:form action="/login" method="POST" modelAttribute="newLogin" class="col-md-6 mx-auto">
			<h2>Log in</h2>
			<div class="form-group">
				<form:label path="email">Email:</form:label>
				<form:errors class="text-danger" path="email"/>
				<form:input class="form-control" path="email" type="email"/>				
			</div>		
			<div class="form-group">
				<form:label path="password">Password:</form:label>
				<form:errors class="text-danger" path="password"/>
				<form:input class="form-control" path="password" type="password"/>				
			</div>	
			<input type="submit" class="btn btn-primary my-3" value="Submit"/>						
		</form:form>		
	</div>	
</body>
</html>>