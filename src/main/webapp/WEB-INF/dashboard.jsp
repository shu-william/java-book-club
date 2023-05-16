<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
		<h2 class="my-4">Welcome, <c:out value="${user.name}"></c:out></h2>
		<a href="/logout">logout</a>
	</div>
	<div class="d-flex justify-content-between align-items-center">
		<p>Books from everyone's shelves:</p>
		<a href="/books/new">Add a book to my shelf!</a>
	</div>
	<table class="table col-md-6 mx-auto">
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Title</th>
				<th scope="col">Author</th>
				<th scope="col">Posted By</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="book" items="${books}">
			<tr>
				<td><c:out value="${book.id}"></c:out></td>
				<td><a href="/books/${book.id}"><c:out value="${book.title}"></c:out></a></td>
				<td><c:out value="${book.author}"></c:out></td>
				<td><c:out value="${book.user.name}"></c:out></td>
			</tr>
			</c:forEach>
		</tbody>	
	</table>	
</body>
</html>