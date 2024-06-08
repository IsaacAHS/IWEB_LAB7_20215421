<%--
  Created by IntelliJ IDEA.
  User: Isaac
  Date: 7/06/2024
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
    <title>Crear un nuevo empleado</title>
</head>
<body>
<div class='container'>
    <h1 class='mb-3'>Crear un nuevo empleado</h1>
    <!--
        para enviar un form necesito 4 cosas:
            - método http: post
            - a dónde va: a un servlet -> ??? -> ServletEmployee
            - ¿qué voy a mandar? -> inputs y deben tener "name"
            - un botón con type submit (para enviarlo)
    -->
    <form method="post" action="<%=request.getContextPath()%>/ServletEmployee">
        <div class="mb-3">
            <label>ID Empleado:</label>
            <h5>(Ingrese valores mayores a 210)</h5>
            <input type="text" class="form-control" name="employee_id">
        </div>

        <div class="mb-3">
            <label>Nombre y Apellido</label>
            <h5>(Ingrese solo un nombre y un apellido)</h5>
            <input type="text" class="form-control" name="fullNameEmployee">
        </div>
        <div class="mb-3">
            <label>JOB_ID:</label>
            <h5>(Ingrese solo JOB_ID validos como AC_ACCOUNT,AC_MGR,IT_PROG,MK_MAN,MK_REP,PR_REP,ST_CLERK,ST_MAN)</h5>
            <input type="text" class="form-control" name="job_id">
        </div>
        <div class="mb-3">
            <label>Correo electronico:</label>
            <input type="text" class="form-control" name="email">
        </div>
        <div class="mb-3">
            <label>Numero telefonico:</label>
            <input type="text" class="form-control" name="phone_number">
        </div>
        <div class="mb-3">
            <label>Fecha de inicio:</label>
            <input type="text" class="form-control" name="hire_date">
        </div>
        <div class="mb-3">
            <label>Salario:</label>
            <input type="text" class="form-control" name="salary">
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
