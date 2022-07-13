<%@page import="Controller.CategoriesController"%>
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
    </head>
    <body class="d-flex flex-column h-100">
        <jsp:include page='layouts/navbar.jsp'></jsp:include>
        <%
            CategoriesController cc = new CategoriesController();
            ResultSet rs = cc.get();
        %>
        <main class="flex-shrink-0">
            <div class="container">
                <h1 class="mt-5">Tambah Produk</h1>
                <div class="row pt-5">
                    <div class="col-12">
                        <form method="POST" action="createproduct">
                            <div class="mb-3">
                                <label class="form-label">Nama Produk</label>
                                <input type="text" class="form-control" placeholder="Masukkan nama produk..." name="name" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Jenis Produk</label>
                                <select class="form-select" aria-label="Default select example" name="type" required>
                                    <% while(rs.next()) { %>
                                        <option value="<%= rs.getString("id") %>"><%= rs.getString("name") %></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Harga Produk</label>
                                <input type="number" min="0" class="form-control" placeholder="Masukkan harga..." name="price" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Stok Produk</label>
                                <input type="number" min="0" class="form-control" placeholder="Masukkan stok..." name="stock" required>
                            </div>
                            <div class="mb-3">
                                <button class="btn btn-primary btn-small btn-rounded" type="submit">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page='layouts/scripts.jsp'></jsp:include>
        <script>
    </body>
</html>