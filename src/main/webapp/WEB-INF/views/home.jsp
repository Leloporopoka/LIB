<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Librorum</title>
    <link href="resources\CSS\bootstrap.min.css" rel="stylesheet">
    <link href="resources\CSS\style.css" rel="stylesheet">
    <link href="resources\CSS\Footer-with-button-logo.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="resources\CSS\slick.css">
    <link rel="stylesheet" type="text/css" href="resources\CSS\slick-theme.css">
    <script type="text/javascript" src="resources\JS\jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="resources\JS\bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <%--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="resources\JS\slick.js" type="text/javascript" charset="utf-8"></script>
    <script src="resources\JS\script.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
           document.getElementById("vd").src =getSeason();
        });



        $(document).on('ready', function() {
            $(".regular").slick({
                dots: false,
                infinite: true,
                slidesToShow: 4,
                slidesToScroll: 4,
                arrows: true,

            });
        });
    </script>


</head>
<body>
<jsp:include page="nav.jsp" />



<div class="homepage-hero-module">
    <div class="video-container">
        <div class="filter"></div>
        <video autoplay loop muted playsinline src="video" class="fillWidth" id="vd"></video>
        <div class="poster hidden">
            <img src="PATH_TO_JPEG" alt="">
        </div>
    </div>

    <div class="container home-content">
        <div class="search home">
            <img  src="resources\pic\XvmmVWjgBYiZySykWBM8qtUU.jpg" alt="" class="mx-auto d-block">
            <form action="search" class="search-container">

                <input type="text" class="form-control" name="search">
                <input hidden name="tag">
                <button type="submit" class="button search-icon">
                    <img  src="resources\pic\search.png" alt="">
                </button>
            </form>
        </div>



        <div class="most-popular">
            <h1 class="popular">Most Popular</h1>

            <section class="regular slider">
                <c:forEach var="book" items="${books}">
                    <div>
                        <a href="book/${book.id}">
                            <img  src="data:image/jpeg;base64,${book.base64}" height="180px">
                        </a>
                    </div>
                </c:forEach>
            </section>
        </div>



    </div>


</div>



<jsp:include page="footer.jsp" />


</body>

</html>