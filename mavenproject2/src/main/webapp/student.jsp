<%-- 
    Document   : student
    Created on : 13 окт. 2023 г., 20:30:03
    Author     : artem
--%>

<%@page import="java.util.*"%>
<%@page import="sumdu.edu.ua.mavenproject2.Student"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            html{
                background-image: url('https://images.wallpaperscraft.ru/image/single/devushka_reka_zakat_1067581_1920x1080.jpg');
                background-size: cover;
                background-repeat: no-repeat;
            }
            h1{
            text-align:center;
            }
            #page{
            width:600px;
            margin:auto;
            padding: 20px;
            background-color: white;
            border-radius: 20px;
            margin-top: 50px;
            }
            form{
            width:400px;
            margin:20px auto;
            }
            input[type=submit]{
            margin:auto;
            }
            .list, .list td, .list th {
            margin:auto;
            border:1px solid black;
            border-collapse: collapse;
            }
        </style>
    </head>
    <body>
         <div id="page">
    <h1>Student Form</h1>
    <form>
    <table>
    <tbody>
        <tr>
            <td><label for="name">Name</td>
            <td><input id="name" type="text" name="name"></td>
        </tr>
        <tr>
            <td><label for="surname">Surname</td>
            <td><input id="surname" type="text" name="surname"></td>
        </tr>
        <tr>
            <td><label for="email">Email</td>
            <td><input id="email" type="email" name="email"></td>
        </tr>
    </tbody>
    </table>
    <input type="submit" name="send" value="Send">
    </form>

        <% List<Student> students= (List<Student>)application.getAttribute("students"); %>
        <c:if test="${not empty param.send }">
        <%
        if(students ==null){
            students= new LinkedList<Student>();
            application.setAttribute("students",students);
        }
        if(request.getParameter("name")!=""||request.getParameter("surname")!=""){
            Student student = new Student();
            student.setName(request.getParameter("name"));
            student.setSurname(request.getParameter("surname"));
            student.setEmail(request.getParameter("email"));
            students.add(student);
        }
        response.sendRedirect("student.jsp");
        %>

        </c:if>

        <%
        if(students != null){
            out.println("<table class=\"list\"><tr><th>Name</th><th>Surname</th><th>Email</th></tr>");
            for(Student s:students){
                out.println("<tr><td>"+s.getName()+"</td><td>"+s.getSurname()+"</td><td>"+s.getEmail()+"</td></tr>");
            }
            out.println("</table>");
        }
        %>
    </>
    </body>
</html>
