<%--
  Created by IntelliJ IDEA.
  User: Isaac
  Date: 7/06/2024
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.lab7_20215421.Beans.Job" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="lista" scope="request" type="ArrayList<Job>" />

<html>
<head>
    <title>Trabajos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="clearfix mt-3 mt-2">
        <a href="<%=request.getContextPath()%>/JobServlet">
            <h1 class="float-start link-dark">Lista de Trabajos</h1>
        </a>
        <a class="btn btn-primary float-end mt-1" href="<%=request.getContextPath() %>/ServletJob?action=new">Crear trabajo</a>
    </div>
    <hr/>

    <table class="table table-striped mt-3">
        <tr class="table-primary">
            <th>ID</th>
            <th>Job Title</th>
            <th>Min Salary</th>
            <th>Max Salary</th>
            <th></th>
            <th></th>
        </tr>
        <% for (Job job : lista) { %>
        <tr>
            <td><%=job.getJobId()  %>
            </td>
            <td><%=job.getJobTitle()%>
            </td>
            <td><%=job.getMinSalary()%>
            </td>
            <td><%=job.getMaxSalary()%>
            </td>
            <td><a class="btn btn-success" href="<%=request.getContextPath()%>/ServletJob?action=edit&id=<%= job.getJobId() %>">Editar</a></td>
            <td><a onclick="return confirm('¿Esta seguro de borrar?')" class="btn btn-danger" href="<%=request.getContextPath()%>/ServletJob?action=del&id=<%= job.getJobId() %>">Borrar</a></td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
