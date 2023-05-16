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
<title>Read Share</title>
</head>
<body class="container">
	<div class="d-flex justify-content-between align-items-center">
		<h2 class="my-4">Add a book to your shelf!</h2>
		<a href="/books">back to the shelves</a>
	</div>
	<form:form action="/books/create" method="POST" modelAttribute="book" class="col-md-6 mx-auto">
		<form:input type="hidden" path="user" value="${id}"/>
		<div class="form-group">
			<form:label path="title">Title:</form:label>
			<form:errors class="text-danger" path="title"/>
			<form:input class="form-control" path="title"/>
		</div>
		<div class="form-group">
			<form:label path="author">Author:</form:label>
			<form:errors class="text-danger" path="author"/>
			<form:input class="form-control" path="author"/>
		</div>
		<div class="form-group">
			<form:label path="thoughts">My thoughts:</form:label>
			<form:errors class="text-danger" path="thoughts"/>
			<form:textarea class="form-control" path="thoughts"/>
		</div>		
		<input type="submit" class="btn btn-primary my-3" value="Submit"/>
	</form:form>
</body>
</html>