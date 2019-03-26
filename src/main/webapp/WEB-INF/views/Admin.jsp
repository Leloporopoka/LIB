<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">


    <title>Library Dashboard</title>

    <!-- Bootstrap core CSS -->
    <link href="resources\CSS\bootstrap.css" rel="stylesheet">
    <link href="resources\CSS\form.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="resources\CSS\dashboard.css" rel="stylesheet">
    <style type="text/css">/* Chart.js */
    @-webkit-keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}@keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}.chartjs-render-monitor{-webkit-animation:chartjs-render-animation 0.001s;animation:chartjs-render-animation 0.001s;}
    </style>
</head>

<body>
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">LIBRORUM</a>
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="/logout">Logout</a>
        </li>
    </ul>
</nav>

<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">

                    <li class="nav-item tab fancyTab">
                        <a class="nav-link" id="tab1" href="#tabBody1" role="tab" aria-controls="tabBody1" aria-selected="true" data-toggle="tab" tabindex="0" >
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-book"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                            Change Books
                        </a>
                    </li>


                    <li class="nav-item tab fancyTab">
                        <a class="nav-link" id="tab2" href="#tabBody2" role="tab" aria-controls="tabBody2" aria-selected="true" data-toggle="tab" tabindex="1">
                            <svg href="resources/pic/book" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell"><path d="M22 17H2a3 3 0 0 0 3-3V9a7 7 0 0 1 14 0v5a3 3 0 0 0 3 3zm-8.27 4a2 2 0 0 1-3.46 0"></path></svg>
                            Requests
                        </a>
                    </li>


                    <li class="nav-item tab fancyTab">
                        <a class="nav-link" id="tab3" href="#tabBody3" role="tab" aria-controls="tabBody3" aria-selected="true" data-toggle="tab" tabindex="2">
                            <svg href="resources/pic/bell" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                            Change Users
                        </a>
                    </li>

                    <li class="nav-item tab fancyTab">
                        <a class="nav-link" id="tab4" href="#tabBody4" role="tab" aria-controls="tabBody4" aria-selected="true" data-toggle="tab" tabindex="3">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home">
                                <line x1="8" y1="6" x2="21" y2="6"></line>
                                <line x1="8" y1="12" x2="21" y2="12"></line>
                                <line x1="8" y1="18" x2="21" y2="18"></line>
                                <line x1="3" y1="6" x2="3" y2="6"></line>
                                <line x1="3" y1="12" x2="3" y2="12"></line>
                                <line x1="3" y1="18" x2="3" y2="18"></line>
                            </svg>
                            All Reserved Books
                        </a>
                    </li>

                </ul>
            </div>
        </nav>

        <main id="main" role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>

            <div id="myTabContent" class="tab-content fancyTabContent" aria-live="polite">

             <!-- Operations with books-->
            <div class="tab-pane  fade active in" id="tabBody1" role="tabpanel" aria-labelledby="tab1" aria-hidden="false" tabindex="0">


                        <!-- Modal window-->
                        <a id ="button" class="nav-link btn btn-dark" href="#" data-toggle="modal" data-target="#AddBook" >Add Book</a>
                        <!-- Modal window -->


                <!-- Content of Modal window-->
                    <div class="modal fade" id="AddBook" tabindex="-1" role="dialog" aria-labelledby="AddWorkersCenter" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">

                                <form action="addBook?${_csrf.parameterName}=${_csrf.token}" class="form_sign_in" method="post" enctype="multipart/form-data">
                                    <div class="modal-header">
                                        <h1 class="modal-title" id="AddWorkersLongTitle" >New Book</h1>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                      <div class="form-group">

                                            <label for="message-text" class="col-form-label">Name:</label>
                                            <input type="text" class="form-control" name="name" >
                                            <label for="message-text" class="col-form-label">Description:</label>
                                            <input type ="text" class="form-control" name="description">
                                            <label for="message-text" class="col-form-label">Author:</label>
                                            <input type="text" class="form-control" name="author">
                                            <label for="message-text" class="col-form-label">Edition:</label>
                                            <input type="text" class="form-control" name="edition">
                                            <label for="message-text" class="col-form-label">Amount:</label>
                                            <input type="text" class="form-control" name="amount">
                                            <input type="file" name="fileUpload" size="50" /></td>                
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Add</button>
                                    </div>
                            </form>
                            </div>
                        </div>
                    </div>
                    <!-- Content of Modal window-->

                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Author</th>
                        <th>Amount</th>
                        <th>Image</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="book" items="${books}">
                        <tr>
                            <td>${book.name}</td>
                            <td>${book.description}</td>
                            <td>${book.author}</td>
                            <td>${book.amount}</td>

                            <td> <img src="data:image/jpeg;base64,${book.base64}"></td>
                            <td>
                                <a class="btn btn-dark" href="/editBook/${book.id}">Edit</a>
                            </td>
                            <td>
                                <form action="/deleteBook" method="GET">
                                    <input type="hidden" name="id" value="${book.id}">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <button class="btn btn-dark">Delete</button>
                                </form>
                                </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
                <!-- End of operations with books-->

                <div class="tab-pane  fade" id="tabBody2" role="tabpanel" aria-labelledby="tab2" aria-hidden="true" tabindex="0">
                <div class="row">

                    <div class="col-md-12">
                        <h2>Requests</h2>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>User</th>
                                <th>Book</th>
                                <th>Date</th>
                                <th>Accept</th>
                                <th>Deny</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="rbook" items="${rbooks}">
                                <tr>
                                    <td>${rbook.user.name}</td>
                                    <td>${rbook.book.name}</td>
                                    <td>${rbook.date}</td>
                                    <td>
                                        <form action="/accept" method="GET">
                                            <input type="hidden" name="id" value="${rbook.id}">
                                            <button class="btn btn-dark">Accept</button>
                                        </form>
                                    </td>
                                    <td>
                                        <form action="/deny" method="GET">
                                            <input type="hidden" name="id" value="${rbook.id}">
                                            <button class="btn btn-dark">Deny</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>


                    </div>
                </div>
            </div>


                <div class="tab-pane  fade" id="tabBody3" role="tabpanel" aria-labelledby="tab3" aria-hidden="true" tabindex="0">
                    <div class="row">
                        <!-- Modal window-->
                        <a id ="button1" class="nav-link btn btn-dark" href="#" data-toggle="modal" data-target="#AddUser" >Add User</a>
                        <!-- Modal window -->

                        <!-- Content of Modal window-->
                        <div class="modal fade" id="AddUser" tabindex="-1" role="dialog" aria-labelledby="AddWorkersCenter" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <form method="post" action="/addUser">
                                        <div class="modal-header">
                                            <h1 class="modal-title" id="AddWorkersLongTitle1" >New User</h1>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <label for="recipient-name" class="col-form-label">Login:</label>
                                            <input type="text" class="form-control"   id="recipient-name" name="login"/>
                                            <label for="message-text" class="col-form-label">Password:</label>
                                            <input type="text" class="form-control"   id="message-text" name="password"/>
                                            <label for="message-text" class="col-form-label">Full Name:</label>
                                            <input type="text" class="form-control"   name="name"/>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Add</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Content of Modal window-->


                        <div class="col-md-12">
                            <h2>Users</h2>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Login</th>
                                    <th>Password</th>
                                    <th>Full Name</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="users" items="${users}">
                                    <tr>
                                        <td>${users.login}</td>
                                        <td>${users.password}</td>
                                        <td>${users.name}</td>
                                        <td>
                                            <a class="btn btn-dark" href="/editUser/${users.id}">Edit</a>
                                        </td>
                                        <td>
                                            <form method="get" action="/deleteUser">
                                                <input type="hidden" name="id" value="${users.id}">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                <button class="btn btn-dark" >Delete</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="tab-pane  fade" id="tabBody4" role="tabpanel" aria-labelledby="tab4" aria-hidden="true" tabindex="0">

                    <h2>Last reserved books</h2>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>User</th>
                                <th>Book</th>
                                <th>Date</th>
                                <th>Delete</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="dbook" items="${dbooks}">
                                <tr>
                                    <td>${dbook.user.name}</td>
                                    <td>${dbook.book.name}</td>
                                    <td>${dbook.date}</td>
                                    <td>
                                        <form method="get" action="/deleteDebtBook">
                                            <input type="hidden" name="id" value="${dbook.id}">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <button class="btn btn-dark" >Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>

        </main>
    </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="resources\JS\jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="resources\JS\jquery-slim.min.js"><\/script>')</script>
<script src="resources\JS\popper.min.js"></script>
<script src="resources\JS\bootstrap.min.js"></script>


//End
<!-- Icons -->
<script src="resources\JS\feather.min.js"></script>





</body>
</html>