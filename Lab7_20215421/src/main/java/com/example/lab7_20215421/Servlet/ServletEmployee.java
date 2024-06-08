package com.example.lab7_20215421.Servlet;

import com.example.lab7_20215421.Beans.Employee;
import com.example.lab7_20215421.Daos.DaoEmployee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.time.LocalDate;
@WebServlet(name="ServletEmployee", value="/ServletEmployee")
public class ServletEmployee extends HttpServlet{
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws IOException, ServletException {

        response.setContentType("text/html");

        String action= request.getParameter("action")== null? "lista":request.getParameter("action");

        DaoEmployee daoEmployee= new DaoEmployee();
        switch(action){
            case "lista":
                ArrayList<Employee> list= daoEmployee.listarEmpleados();

                request.setAttribute("lista",list);
                RequestDispatcher rd = request.getRequestDispatcher("employee/lista.jsp");
                rd.forward(request,response);
                break;

            case "new":
                request.getRequestDispatcher("employee/nuevo.jsp").forward(request,response);
                break;
            case "edit":
                String id= request.getParameter("id");
                Employee empleado= daoEmployee.buscarPorId(id);

                if(empleado!=null){
                    request.setAttribute("empleado",empleado);
                    request.getRequestDispatcher("employee/editar.jsp").forward(request,response);

                }else{
                    response.sendRedirect(request.getContextPath() +"ServletEmployee");
                }
                break;
            case "del":
                String ide = request.getParameter("id");
                Employee empleadoo= daoEmployee.buscarPorId(ide);
                if(empleadoo!=null){
                    try{
                        daoEmployee.borrar(ide);
                    }catch (SQLException e){
                        System.out.println("Log:exception"+e.getMessage());

                    }
                }
                response.sendRedirect(request.getContextPath()+"/ServletEmployee");
                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        DaoEmployee daoEmployee = new DaoEmployee();

        String action = request.getParameter("action") == null ? "crear" : request.getParameter("action");

        switch(action){
            case "crear":


                String employee_id=request.getParameter("employee_id");
                String fullNameEmployee= request.getParameter("fullNameEmployee");
                String job_id= request.getParameter("job_id");
                String email= request.getParameter("email");
                String phone_number= request.getParameter("phone_number");
                String hire_date= request.getParameter("hire_date");
                String salary= request.getParameter("salary");



                boolean esValido= true;

                if(esValido){
                    Employee empleado= daoEmployee.buscarPorId(employee_id);
                    if(empleado== null){
                        Employee empleado1= new Employee();

                        empleado1.setEmployee_id(Integer.parseInt(employee_id));
                        empleado1.setFullNameEmployee(fullNameEmployee);
                        empleado1.setJob_id(job_id);
                        empleado1.setEmail(email);
                        empleado1.setPhone_number(phone_number);
                        empleado1.setHire_date(Date.valueOf(hire_date));
                        empleado1.setSalary(Double.parseDouble(salary));
                        daoEmployee.crear(empleado1);
                        //daoEmployee.crear(Employees empleado);
                        response.sendRedirect(request.getContextPath()+"/ServletEmployee");
                    }else{
                        request.getRequestDispatcher("employee/nuevo.jsp").forward(request,response);
                    }
                }else{
                    request.getRequestDispatcher("employee/nuevo.jsp").forward(request,response);

                }
                break;

            case "editar":
                String employee_id2= request.getParameter("employee_id");
                String fullNameEmployee2= request.getParameter("fullNameEmployee");
                String job_id2= request.getParameter("job_id");
                String email2= request.getParameter("email");
                String phone_number2= request.getParameter("phone_number");
                String hire_date2= request.getParameter("hire_date");
                String salary2= request.getParameter("salary");

                boolean esValido2= true;

                if(esValido2){
                    Employee empleado2 = new Employee();

                    empleado2.setEmployee_id(Integer.parseInt(employee_id2));
                    empleado2.setFullNameEmployee(fullNameEmployee2);
                    empleado2.setJob_id(job_id2);
                    empleado2.setEmail(email2);
                    empleado2.setPhone_number(phone_number2);
                    empleado2.setHire_date(Date.valueOf(hire_date2));
                    empleado2.setSalary(Double.parseDouble(salary2));

                    daoEmployee.editar(empleado2);
                    response.sendRedirect(request.getContextPath() + "/ServletEmployee");
                }else{
                    request.setAttribute("empleado",daoEmployee.buscarPorId(employee_id2));
                    request.getRequestDispatcher("employee/editar.jsp").forward(request,response);
                }
                break;
        }

    }

}
