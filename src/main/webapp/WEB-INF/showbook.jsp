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
		<h2 class="my-4"><c:out value="${book.title}"></c:out></h2>
		<a href="/books">back to the shelves</a>
	</div>
	<c:choose>
		<c:when test="${book.user.id == id}">
			<p>You read <c:out value="${book.title}"></c:out> by <c:out value="${book.author}"></c:out>.</p>
			<p>Here are your thoughts:</p>
		</c:when>
		<c:otherwise>
			<p><c:out value="${book.user.name}"></c:out> read <c:out value="${book.title}"></c:out> by <c:out value="${book.author}"></c:out>.</p>
			<p>Here are <c:out value="${book.user.name}"></c:out>'s thoughts:</p>
		</c:otherwise>
	</c:choose>
	<p class="mx-4"><c:out value="${book.thoughts}"></c:out></p>
	<c:if test="${book.user.id == id}">
		<div>
			<a class="btn btn-info" href="/books/edit/${book.id}">Edit</a>
			<a class="btn btn-info" href="/books/delete/${book.id}">Delete</a>
		</div>	
	</c:if>
</body>
</html>