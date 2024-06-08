<%--
  Created by IntelliJ IDEA.
  User: Isaac
  Date: 7/06/2024
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="empleado" type="com.example.lab7_20215421.Beans.Employee" scope="request"/>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
    <title>Editar un empleado</title>
</head>
<body>
<div class='container'>
    <h1 class='mb-3'>Editar un empleado</h1>
    <form method="post" action="<%=request.getContextPath()%>/ServletEmployee?action=editar">
        <div class="mb-3">

            <input type="hidden" class="form-control" name="employee_id" value="<%=empleado.getEmployee_id()%>">
        </div>
        <div class="mb-3">
            <label>Nombre y Apellido:</label>
            <h5>(Ingrese solo un nombre y un apellido)</h5>
            <input type="text" class="form-control" name="fullNameEmployee" value="<%=empleado.getFullNameEmployee()%>">
        </div>
        <div class="mb-3">
            <label>JOB_ID:</label>
            <h5>(Ingrese solo JOB_ID validos como AC_ACCOUNT,AC_MGR,IT_PROG,MK_MAN,MK_REP,PR_REP,ST_CLERK,ST_MAN)</h5>
            <input type="text" class="form-control" name="job_id" value="<%=empleado.getJob_id()%>">
        </div>
        <div class="mb-3">
            <label>Correo electronico:</label>
            <input type="text" class="form-control" name="email" value="<%=empleado.getEmail()%>">
        </div>
        <div class="mb-3">
            <label>Numero telefonico:</label>
            <input type="text" class="form-control" name="phone_number" value="<%=empleado.getPhone_number()%>">
        </div>
        <div class="mb-3">
            <label>Fecha de inicio:</label>
            <input type="text" class="form-control" name="hire_date" value="<%=empleado.getHire_date()%>">
        </div>
        <div class="mb-3">
            <label>Salario:</label>
            <input type="text" class="form-control" name="phone_number" value="<%=empleado.getSalary()%>">
        </div>


        <a href="<%=request.getContextPath()%>/ServletEmployee" class="btn btn-danger">Regresar</a>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>
