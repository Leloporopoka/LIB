<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change User</title>
    <link href="resources\CSS\bootstrap.css" rel="stylesheet">
    <link href="resources\CSS\form.css" rel="stylesheet">

</head>
<body>
<div class="container jumbotron" id="cont">
    <div class="col-md-12 " id="form" >
            <div class="form_main">
                <h4 class="heading">Add Changes</h4>
                <div class="form">
                    <form action="/changeUser" method="POST" id="contactFrm" name="contactFrm">
                        <input type="hidden" value="${user.id}" name="id">
                        <input type="text" value="${user.login}" name="login" class="txt">
                        <input type="text" value="${user.password}" name="password" class="txt">
                        <input type="text"  value="${user.name}" name="name" class="txt">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <input type="submit" value="Accept" name="submit" class="txt2">
                    </form>
                </div>
            </div>
    </div>
</div>
</body>
</html>
