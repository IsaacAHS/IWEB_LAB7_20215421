package com.example.lab7_20215421.Daos;

import com.example.lab7_20215421.Beans.Employee;
import com.example.lab7_20215421.Beans.Job;

import java.sql.*;
import java.util.ArrayList;
public class DaoEmployee {
    public ArrayList<Employee> listarEmpleados(){
        ArrayList<Employee> lista= new ArrayList<>();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/hr";
        String username = "root";
        String password = "root";

        String sql = "select employee_id, concat(first_name,\" \",last_name),job_id,email,phone_number,hire_date,salary from employees ";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Employee employee = new Employee();
                employee.setEmployee_id(rs.getInt(1));
                employee.setFullNameEmployee(rs.getString(2));
                employee.setJob_id(rs.getString(3));
                employee.setEmail(rs.getString(4));
                employee.setPhone_number(rs.getString(5));
                employee.setHire_date(rs.getDate(6));
                employee.setSalary(rs.getDouble(7));

                lista.add(employee);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;

    }

    public Employee buscarPorId(String id){

        Employee empleado = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/hr";
        String username = "root";
        String password = "root";

        String sql = "select employee_id,concat(first_name,\" \",last_name),job_id, email,phone_number,hire_date,salary from employees where employee_id = ?";


        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,id);

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {
                    empleado = new Employee();

                    empleado.setEmployee_id(rs.getInt(1));
                    empleado.setFullNameEmployee(rs.getString(2));
                    empleado.setJob_id(rs.getString(3));
                    empleado.setEmail(rs.getString(4));
                    empleado.setPhone_number(rs.getString(5));
                    empleado.setHire_date(rs.getDate(6));
                    empleado.setSalary(rs.getDouble(7));

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return empleado;
    }

    public void editar(Employee empleado){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/hr";
        String username = "root";
        String password = "root";



        String sql = "update employees set first_name= ?,last_name =?,job_id=?,email = ?,phone_number = ?,hire_date = ?,salary=? where employee_id = ?";

        try(Connection connection = DriverManager.getConnection(url,username,password);
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            String fullName = empleado.getFullNameEmployee().trim();
            String[] names = fullName.split(" ");
            String firstName = names[0];
            String lastName= names[1];


            pstmt.setString(1,firstName);
            pstmt.setString(2,lastName);
            pstmt.setString(3, empleado.getJob_id());
            pstmt.setString(4, empleado.getEmail());
            pstmt.setString(5,empleado.getPhone_number());
            pstmt.setDate(6,empleado.getHire_date());
            pstmt.setDouble(7,empleado.getSalary());
            pstmt.setInt(8,empleado.getEmployee_id());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void borrar(String employee_id) throws SQLException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/hr";
        String username = "root";
        String password = "root";

        String sql = "delete from employees where employee_id = ?";

        try(Connection connection = DriverManager.getConnection(url,username,password);
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,employee_id);
            pstmt.executeUpdate();

        }
    }

    public void crear(Employee empleado){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/hr";
        String username = "root";
        String password = "root";

        String sql = "insert into employees (employee_id,first_name,last_name,job_id,email,phone_number,hire_date,salary) values (?,?,?,?,?,?,?,?)";

        try(Connection connection = DriverManager.getConnection(url,username,password);
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            String fullName = empleado.getFullNameEmployee().trim();
            String[] names = fullName.split(" ");
            String firstName = names[0];
            String lastName=names[1];

            pstmt.setInt(1,empleado.getEmployee_id());
            pstmt.setString(2,firstName);
            pstmt.setString(3,lastName);
            pstmt.setString(4, empleado.getJob_id());
            pstmt.setString(5, empleado.getEmail());
            pstmt.setString(6,empleado.getPhone_number());
            pstmt.setDate(7,empleado.getHire_date());
            pstmt.setDouble(8,empleado.getSalary());


            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
