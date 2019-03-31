<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contact Us</title>
    <link href="resources\CSS\bootstrap.min.css" rel="stylesheet">
    <link href="resources\CSS\style.css" rel="stylesheet">
    <link href="resources\CSS\Footer-with-button-logo.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="resources\CSS\slick.css">
    <link rel="stylesheet" type="text/css" href="resources\CSS\slick-theme.css">
</head>
<style>
    #form{
        margin-top:5%;
        margin-bottom:5%;
    }

    legend{
        padding-bottom: 2%;
    }
</style>
<body>
<jsp:include page="fragments/nav.jsp" />


<div id="form" class="container border border-dark rounded">

    <form class="well form-horizontal" action=" " method="post"  id="contact_form">
        <fieldset>
            <!-- Form Name -->
            <legend class="text-center">Contact Us Today!</legend>

            <!--Row 1-->
            <div class="row">
                <div class="col-6">
                    <!-- Text input-->
                    <div class="form-group">
                        <label class=" control-label">First Name</label>
                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input  name="first_name" placeholder="First Name" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-6">
                    <!-- Text input-->

                    <div class="form-group">
                        <label class="control-label" >Last Name</label>
                        <div class=" inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input name="last_name" placeholder="Last Name" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Row 1 -->


            <!-- Row 2-->
            <div class="row">
                <div class="col-6">
                    <!-- Text input-->
                    <div class="form-group">
                        <label class=" control-label">E-Mail</label>
                        <div class=" inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <input name="email" placeholder="E-Mail Address" class="form-control"  type="text">
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="control-label">Phone #</label>
                    <div class=" inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input name="phone" placeholder="(845)555-1212" class="form-control" type="text">
                        </div>
                    </div>
                </div>
                    </div>

            </div>

            <!-- Row 2-->
                <div class="row">
                    <!-- Text area -->
                    <div class="col-12">
                    <div class="form-group">
                        <label class=" control-label">Project Description</label>
                        <div class="inputGroupContainer">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                <textarea class="form-control" name="comment" placeholder="Project Description"></textarea>
                            </div>
                        </div>
                    </div>
                    </div>

                </div>
            <button class="btn btn-outline-dark btn-lg">Send</button>

        </fieldset>
    </form>
</div>



<jsp:include page="fragments/footer.html" />
</body>
</html>
