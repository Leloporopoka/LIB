<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: duski
  Date: 16.12.2018
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <meta charset="UTF-8">
        <title>Book</title>
        <link href="resources\CSS\bootstrap.min.css" rel="stylesheet">
        <link href="resources\CSS\style.css" rel="stylesheet">
        <link href="resources\CSS\tag.css" rel="stylesheet">
        <script type="text/javascript" src="resources\JS\jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="resources\JS\bootstrap.min.js"></script>

    </head>
</head>
<body>
<jsp:include page="fragments/nav.jsp" />

<div class="container">
    <div class="tags_system">
        <h2 class="align-content-center"> Tags: </h2>

        <div class="accordion" id="accordionExample">
        <c:if test="${!(parent==null)}">
             <c:forEach items="${parent}" var="parentTag">

            <div class="card">
                <div class="card-header bg-dark" id="heading${parentTag.id}">
                    <h5 class="mb-0">
                        <button class="btn btn-dark" type="button" data-toggle="collapse" data-target="#collapse${parentTag.id}" aria-expanded="false" aria-controls="collapse${parentTag.id}">
                            ${parentTag.name}
                        </button>
                    </h5>
                </div>

                <div id="collapse${parentTag.id}" class="collapse" aria-labelledby="heading${parentTag.id}" data-parent="#accordionExample">
                    <c:if test="${!(child==null)}">
                    <div class="card-body">

                        <c:forEach items="${child}" var="childTag">
                            <c:if test="${childTag.parents_id == parentTag.id}">
                        <div class="tag_link">
                            <a href="/searchByTag?child=${childTag.name}" >${childTag.name}</a>
                        </div>
                            </c:if>
                        </c:forEach>

                    </div>
                    </c:if>
                </div>
            </div>
             </c:forEach>
        </c:if>
        </div>
    </div>


    <%----%>

</div>
</body>
</html>
