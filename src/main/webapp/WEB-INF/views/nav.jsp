<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="mr-auto">

        <img width="50" height="50" src="..\resources\pic\13.png" alt="" class="d-inline-block align-top">

        <a href="/home" class="navbar-brand">
            <span>LIBRORUM-ONLINE</span>

        </a>
    </div>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <ul class="navbar-nav ml-md-auto d-md-flex">
            <li class="nav-item">

                <c:if test="${user==null}" >
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#AddWorkers" >Login
                    </a>
                </c:if>
                <c:if test="${!(user==null)}">
                    <a class="nav-link" href="/profile"  >${user.name}
                    </a>
                </c:if>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/tags">All Tag</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/ContactUs">Contact Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/aboutUs">About Us</a>
            </li>


        </ul>



        <!— Modal —>
        <div class="modal fade" id="AddWorkers" tabindex="-1" role="dialog" aria-labelledby="AddWorkersCenter" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <form method="post" action="/login" id="form">
                        <div class="modal-header">
                            <h1 class="modal-title" id="AddWorkersLongTitle" >Login</h1>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Student Id:</label>
                                <input type="text" class="form-control" id="recipient-name" name="login_parameter">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Password:</label>
                                <input type="password" class="form-control" id="message-text" name="password_parameter">
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <input class="btn btn-primary" type="button" onclick="validate(this.form)" value="Login">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function showError(container, errorMessage) {
            container.className = 'error';
            var msgElem = document.createElement('span');
            msgElem.className = "error-message";
            msgElem.innerHTML = errorMessage;
            container.appendChild(msgElem);
        }

        function resetError(container) {
            container.className = '';
            if (container.lastChild.className == "error-message") {
                container.removeChild(container.lastChild);
            }
        }

        function validate(form) {
            var elems = form.elements;

            resetError(elems.login_parameter.parentNode);
            resetError(elems.password_parameter.parentNode);

            if (!elems.login_parameter.value) {
                showError(elems.login_parameter.parentNode, ' Please add Login.');
            }
            if (!elems.password_parameter.value) {
                showError(elems.password_parameter.parentNode, ' Please add Password.');
            }

            if(elems.login_parameter.value&&elems.password_parameter.value){
                document.getElementById('form').submit();
            }


        }
    </script>
</nav>
