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
    </head>
    <body>
        <jsp:include page='layouts/navbar.jsp'></jsp:include>
        <%
            ProductController pc = new ProductController();

            String search = "";
            ResultSet rs;

            if (request.getParameter("search") != null) {
                search = request.getParameter("search");
            } 

            if (search.equals("")) {
                rs = pc.get();
            } else {
                rs = pc.getByName(search);
            }
        %>
        <div class="container">   
            <div class="row pt-5">
                    <div class="col-6">
                        <form action="product" method="GET">
                            <div class="mb-3">
                                <label class="form-label">Search</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="search" value="<%= search%>" />
                                    <span class="input-group-append">
                                        <button class="input-group-text bg-light d-block">
                                            <i class='bx bxs-search'></i>
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            <div class="row">
                <div class="col-12">
                     <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nama</th>
                                <th>Category id</th>
                                <th>Stock</th>
                                <th>Harga</th>
                                <th>Tanggal dibuat</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% while(rs.next()) { %>
                            <tr>
                                <td><%= rs.getString("id") %></td>
                                <td><%= rs.getString("name") %></td>
                                <td><%= rs.getString(2) %></td>
                                <td><%= rs.getString("stock") %></td>
                                <td><%= rs.getString("price") %></td>
                                <td><%= rs.getString("created_at") %></td>
                                 <td>
                                        <form action="deleteproduct?id=<%= rs.getString("id") %>" method="POST"
                                              onsubmit="return confirm('Are you sure want to delete the data?')"
                                        >
                                            <a href="editproduct?id=<%= rs.getString("id") %>" class="btn btn-sm btn-info">Edit</a>
                                            <input type="hidden" name="id" value="<%= rs.getString("id")%>" />
                                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                                        </form>
                                        
                                    </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <jsp:include page='layouts/scripts.jsp'></jsp:include>
    </body>
</html>