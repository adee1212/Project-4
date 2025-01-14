<%--<%@ taglib prefix="c" uri="http://java.sun/com/jstl/core" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page='layouts/head.jsp'>
            <jsp:param name="title" value="Homepage" />
        </jsp:include>
        <style>
            .input-group-append {
                cursor: pointer;
            }
        </style>
    </head>
    <body>
            <div class="container login-form">
                <h1 class="mt-5">Login</h1>
                <p class="lead">Masukkan username dan password anda</p>
                <div class="row pt-5">
                    <% if (request.getSession(true).getAttribute("errors") != null) {%>
                <div class="col-12 mb-3">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Error!</strong> <%= request.getSession(true).getAttribute("errors")%>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
                <% } %>
                <div class="col-12">
                    <form method="POST" action="login">
                        <div class="mb-3">
                            <label class="form-label fl">Username</label>
                            <input type="text" class="form-control" placeholder="Masukkan username anda..." name="username" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fl">Password</label>
                            <input type="password" class="form-control" placeholder="Masukkan password anda..." name="password" required>
                        </div>
                        <div class="mb-3">
                            <button type="submit" class="button sb">Login</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    <jsp:include page='layouts/scripts.jsp'></jsp:include>
    </body>
</html>