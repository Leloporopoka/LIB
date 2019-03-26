<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Book</title>
    <link href="resources\CSS\bootstrap.css" rel="stylesheet">
    <link href="resources\CSS\form.css" rel="stylesheet">
</head>
<body>

<div class="container jumbotron" id="cont">
    <div class="col-md-12 " id="form" >
        <div class="form_main">
            <h2>Add Changes that you Need</h2>
            <div class="form">
                <form action="/changeBook" method="POST" id="contactFrm" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${book.id}">
                    <input class="txt"  type="text"  name="name"  value="${book.name}"/>
                    <input  class="txt" type="text" name="description" path="description" value="${book.description}"/>
                    <input type="text"   value="${book.author}"  name="author" class="txt"/>
                    <input  type="text"   value="${book.edition}"  name="edition" class="txt"/>
                    <input type="text"   value="${book.amount}"   name="amount" class="txt"/>
                    <input type="file" name="fileUpload" size="50" /></td>                
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <input type="submit" value="Accept" name="submit" class="txt2">
                </form>
            </div>
        </div>
    </div>

</div>

</body>
</html>
