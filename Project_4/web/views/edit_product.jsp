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
                       
            System.out.println(rs);
            
            if (!rs.isBeforeFirst()) {
                response.sendRedirect("product");
            }
            
        %>
        <% while(rs.next()) { %>
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
                                    <option value="1" 
                                            <%= rs.getString("category_id").equals("1") ? "selected" : ""%>
                                            >Motherboard</option>
                                    <option value="2" 
                                            <%= rs.getString("category_id").equals("2") ? "selected" : ""%>
                                            >CPU Cooler</option>
                                    <option value="3" 
                                            <%= rs.getString("category_id").equals("3") ? "selected" : ""%>
                                            >Storage</option>
                                    <option value="4" 
                                            <%= rs.getString("category_id").equals("4") ? "selected" : ""%>
                                            >Graphic Card</option>
                                    <option value="5" 
                                            <%= rs.getString("category_id").equals("5") ? "selected" : ""%>
                                            >Processor</option>
                                    <option value="6" 
                                            <%= rs.getString("category_id").equals("6") ? "selected" : ""%>
                                            >Fan Case</option>
                                    <option value="7" 
                                            <%= rs.getString("category_id").equals("7") ? "selected" : ""%>
                                            >Power Suply</option>
                                    <option value="8" 
                                            <%= rs.getString("category_id").equals("8") ? "selected" : ""%>
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