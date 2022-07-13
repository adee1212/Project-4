<%@page import="Controller.ProductController"%>
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
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://unpkg.com/js-datepicker/dist/datepicker.min.css"> 

    </head>
    <body class="d-flex flex-column h-100">
        <jsp:include page='layouts/navbar.jsp'></jsp:include>

        <%
            String id = request.getParameter("id");
            if (id == null || id.equals("")) {
                response.sendRedirect("product");
            }

            ProductController pc = new ProductController();
            ResultSet rs = pc.getById(id);
            
            CategoriesController cc = new CategoriesController();
            ResultSet rsc = cc.get();
            
            System.out.println(rs);
            
            if (!rs.isBeforeFirst()) {
                response.sendRedirect("product");
            }
            
        %>

        <% while(rs.next()) { %>
        <!-- Begin page content -->
        <main class="flex-shrink-0">
            <div class="container">
                <h1 class="mt-5">Edit Produk - <%= rs.getString("name") %></h1>
                <p class="lead">Edit produk <%= rs.getString("name")  %> pada sistem aplikasi produk</p>
                <div class="row pt-5">
                    <div class="col-12">
                        <form method="POST" action="editproduct">
                            <input type="hidden" name="id" value="<%= rs.getString("id")%>" />
                            <div class="mb-3">
                                <label class="form-label">Nama Produk</label>
                                <input type="text" class="form-control" 
                                       placeholder="Masukkan nama produk..." name="name" required
                                       value="<%= rs.getString("name")%>"
                                       >
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Jenis Produk</label>
                                <select class="form-select" aria-label="Default select example" name="type" required>
                                    <option value="Motherboard" 
                                            <%= rs.getString("category_id") == "Motherboard" ? "selected" : ""%>
                                            >Motherboard</option>
                                    <option value="CPU Cooler" 
                                            <%= rs.getString("category_id") == "CPU Cooler" ? "selected" : ""%>
                                            >CPU Cooler</option>
                                    <option value="Storage" 
                                            <%= rs.getString("category_id") == "Storage" ? "selected" : ""%>
                                            >Storage</option>
                                    <option value="Graphic Card" 
                                            <%= rs.getString("category_id") == "Graphic Card" ? "selected" : ""%>
                                            >Graphic Card</option>
                                    <option value="Processor" 
                                            <%= rs.getString("category_id") == "Processor" ? "selected" : ""%>
                                            >Processor</option>
                                    <option value="Fan Case" 
                                            <%= rs.getString("category_id") == "Fan Case" ? "selected" : ""%>
                                            >Fan Case</option>
                                    <option value="Power Suply" 
                                            <%= rs.getString("category_id") == "Power Suply" ? "selected" : ""%>
                                            >Power Suply</option>
                                    <option value="Memory" 
                                            <%= rs.getString("category_id") == "Memory" ? "selected" : ""%>
                                            >Memory</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Harga Produk</label>
                                <input type="number" min="0" class="form-control" 
                                       placeholder="Masukkan harga..." name="price" required
                                       value="<%= rs.getString("price") %>"
                                       >
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Stok Produk</label>
                                <input type="number" min="0" class="form-control" 
                                       placeholder="Masukkan stok..." name="stock" required
                                       value="<%= rs.getString("stock") %>"
                                       >
                            </div>
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary btn-small btn-rounded">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <% } %>
        <jsp:include page='layouts/scripts.jsp'></jsp:include>
    </body>
</html>