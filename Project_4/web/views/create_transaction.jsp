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
    </head>
    <body class="d-flex flex-column h-100">
        <jsp:include page='layouts/navbar.jsp'></jsp:include>
        <%
            ProductController pc = new ProductController();
            ResultSet rs = pc.get();
        %>
        <main class="flex-shrink-0">
            <div class="container">
                <h1 class="mt-5">Tambah Transaksi</h1>
                <div class="row pt-5">
                    <div class="col-12">
                        <div class="mb-3">
                            <label class="form-label">Admin : </label>
                            <p> <%= request.getSession(true).getAttribute("name") %></p>
                        </div>
                        <form method="POST" action="createtransaction">
                            <div class="mb-3">
                                <label class="form-label">ID Admin</label>
                                 <input type="text" class="form-control" placeholder="Masukkan nama produk..." name="name" required
                                 value="<%= rs.getString("id")%>">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Product</label>
                                <select class="form-select" aria-label="Default select example" required>
                                    <% while(rs.next()) { %>
                                        <option value="<%= rs.getString("id") %>"><%= rs.getString("name") %></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Type</label>
                                    <select class="form-select" aria-label="Default select example" name="type" required>
                                    <option value="Barang masuk">Barang masuk</option>
                                    <option value="Barang keluar">Barang keluar</option>
                                    </select>
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
        <jsp:include page='layouts/scripts.jsp'></jsp:include>
    </body>
</html>