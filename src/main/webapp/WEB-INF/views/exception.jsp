<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exception</title>
<style>
.content h4, .content p {
color: white;
}
</style>
</head>
<body>
<h4>${err.getCause()}</h4>
<p>${err.getMessage()}</p>
<p>${ err.printStackTrace() }</p>
</body>
</html>