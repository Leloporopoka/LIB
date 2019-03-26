<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="resources\CSS\bootstrap.min.css" rel="stylesheet">
    <link href="resources\CSS\style.css" rel="stylesheet">
    <script type="text/javascript" src="resources\JS\jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="resources\JS\bootstrap.min.js"></script>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <script>
        $(document).ready(function(){
            $("#tag_close").click(function(){
                $("#tag_input").val(null);
                $(".delete").html("");
            });
        });
    </script>
</head>
<body>
<jsp:include page="nav.jsp" />
<div class="container">
        <div class="search resultSearch">

            <form action="search" class="search-container">

                <input type="text" class="form-control" name="search" value="${search}">


                <input hidden name="tag" value="${tag}" id="tag_input">
                <button type="submit" class="button search-icon">
                    <img  src="resources\pic\search.png" alt="">
                </button>
                <c:if test="${!(tag.equals(''))}">
                <div class="delete">
                <div class="search_tag">
                    <span>${tag} <button id="tag_close">x</button></span>
                </div>
            </div>
                </c:if>
            </form>



        </div>
    <div class="search_result">
        <c:if test="${!(books==null)}">
            <c:forEach items="${books}" var="book">
        <div class="${book.id} result">
            <div class="media">
                <a href="book/${book.id}">
                     <img height="150px" width="100px" src="data:image/jpeg;base64,${book.base64}">
                </a>
                <div class="media-body">
        <a  href="book/${book.id}"><h3>${book.name}</h3></a>
        <p>By ${book.author}</p>
        <p>${book.edition} edition</p>
            </div>
        <div class="available">
            <c:choose>
                <c:when test="${book.amount==0}">
                    <span>X</span>
                    Not available
                </c:when>
                <c:otherwise>
                    <span>&#10003</span>
                    Available
                </c:otherwise>
            </c:choose>
        </div>
        </div>
        </div>
            </c:forEach>

        </c:if>

    </div>
</div>

</div>
</div>
</body>
</html>

