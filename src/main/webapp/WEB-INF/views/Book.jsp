<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book</title>
    <link href="..\resources\CSS\bootstrap.min.css" rel="stylesheet">
    <link href="..\resources\CSS\style.css" rel="stylesheet">
    <script type="text/javascript" src="..\resources\JS\jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="..\resources\JS\bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="fragments/nav.jsp" />


<div class="container">
    <div class="book">
        <div class="media">

        <img height="330px" width="230px"  src="data:image/jpeg;base64,${book.base64}" alt=""  class="align-self-start mr-3">
            <div class="media-body">
            <h2>${book.name}</h2>

        <h6>By ${book.author}</h6>

        <p>${book.edition} edition</p>
        <p>${book.description}</p>
            </div>
        </div>
         <div class="tags">

        <h5>Tags:</h5>
             <c:forEach items="${book.tags}" var="tag">
                 <div class="tag"><a href="/searchByTag?child=${tag.name}">${tag.name}</a></div>
             </c:forEach>
             <br>


             <c:choose>
                 <c:when test="${book.amount==0}">
             <button type="button" class="btn-dark disabled"  id="reserv" disabled>Reserve</button>
                     <div class="alert alert-danger" role="alert">
                         This book is not available for reservation as it is not in the library at the moment.
                     </div>

                 </c:when>
                 <c:otherwise>
                     <button type="button" class="btn-dark reserv"  id="reserv"  data-toggle="modal" data-target="#ReserveBook" >Reserve</button>
                 </c:otherwise>
             </c:choose>
         </div>
    </div>
</div>

<div class="modal fade" id="ReserveBook" tabindex="-1" role="dialog" aria-labelledby="ReserveBookCenter" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title" id="ReserveBookLongTitle" >Reserve Book</h1>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/reserve" method="post" >

                <div class="modal-body">



                    <c:choose>
                        <c:when test="${user==null}">
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Student Id:</label>
                                <input type="text" class="form-control"    id="recipient-name" name="student_id"/>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="form-group">
                                <label for="recipient-nam" class="col-form-label">Student Id:</label>
                                <input type="text" class="form-control"    id="recipient-nam" name="student_id" value="${user.login}"/>
                            </div>
                        </c:otherwise>
                    </c:choose>

                            <div class="form-group">
                                <label for="text" class="col-form-label">Password:</label>
                                <input type="password" class="form-control"  id="text" name="student_password"/>
                            </div>
                            <input hidden  class="form-control"  id="password-text" name="book" value="${book.id}"/>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Reserve</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
