<%-- 
    Document   : create
    Created on : Jun 29, 2022, 10:59:12 PM
    Author     : Hudya
--%>

<%@page import="Controller.ProductController"%>
<%@page import="java.sql.ResultSet"%>
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
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://unpkg.com/js-datepicker/dist/datepicker.min.css"> 

    </head>
    <body class="d-flex flex-column h-100">
        <jsp:include page='layouts/navbar.jsp'></jsp:include>
        <%
            ProductController ptc = new ProductController();
            ResultSet rs = ptc.get();
        %>
        <!-- Begin page content -->
        <main class="flex-shrink-0">
            <div class="container">
                <h1 class="mt-5">Tambah Produk</h1>
                <p class="lead">Tambah produk baru pada sistem aplikasi produk</p>
                <div class="row pt-5">
                    <div class="col-12">
                        <form method="POST" action="create_tr">
                            <div class="mb-3">
                                <label class="form-label">Admin</label>
                                <h1 class="mt-5"> <%= request.getSession(true).getAttribute("name") %></h1>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Product</label>
                                <select class="form-select" aria-label="Default select example" name="type" required>
                                    <% while(rs.next()) { %>
                                        <option value="<%= rs.getString("id") %>"><%= rs.getString("name") %></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Type</label>
                                <input type="text" class="form-control" placeholder="Masukkan nama produk..." name="type" required>
                            </div>
                           
                            <div class="mb-3">
                                <label class="form-label">Total Items</label>
                                <input type="number" min="0" class="form-control" placeholder="Masukkan stok..." name="total_items" required>
                            </div>
                            
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary btn-small btn-rounded">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>


        <jsp:include page='layouts/footer.jsp'></jsp:include>
        <jsp:include page='layouts/scripts.jsp'></jsp:include>
        <script src="https://unpkg.com/js-datepicker"></script> 
        <script>
            const picker = datepicker('#date', {
                formatter: (input, date, instance) => {
                    input.value = date.toLocaleDateString(); // => '1/1/2099'
                }
            })
        </script>

    </body>
</html>