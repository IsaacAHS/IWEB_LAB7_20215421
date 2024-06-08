<%--
  Created by IntelliJ IDEA.
  User: Isaac
  Date: 7/06/2024
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.lab7_20215421.Beans.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="lista" scope="request" type="ArrayList<Employee>"/>

<html>
<head>
    <title>Empleados</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="clearfix mt-3 mt-2">
        <a href="<%=request.getContextPath()%>/ServletEmployee">
            <h1 class="float-start link-dark">Lista de Empleados</h1>
        </a>
        <a class="btn btn-primary float-end mt-1" href="<%=request.getContextPath() %>/ServletEmployee?action=new">Crear empleado</a>
    </div>


    <table class="table table-striped mt-3">
        <tr class="table-primary">
            <th>Employee_ID</th>
            <th>Nombre completo</th>
            <th>Job_ID</th>
            <th>Correo electronico</th>
            <th>Numero telefonico</th>
            <th>Fecha Inicio</th>
            <th>Salario</th>
            <th></th>
            <th></th>
        </tr>
        <% for (Employee empleado : lista) { %>
        <tr>
            <td><%=empleado.getEmployee_id()  %>
            </td>
            <td><%=empleado.getFullNameEmployee()%>
            </td>
            <td><%=empleado.getJob_id()%>
            </td>
            <td><%=empleado.getEmail()%>
            </td>
            <td><%=empleado.getPhone_number()%>
            </td>
            <td><%=empleado.getHire_date()%>
            </td>
            <td><%=empleado.getSalary()%>
            </td>


            <td><a class="btn btn-success" href="<%=request.getContextPath()%>/ServletEmployee?action=edit&id=<%= empleado.getEmployee_id() %>">Editar</a></td>
            <td><a onclick="return confirm('¿Esta seguro de borrar?')" class="btn btn-danger" href="<%=request.getContextPath()%>/ServletEmployee?action=del&id=<%= empleado.getEmployee_id() %>">Borrar</a></td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
