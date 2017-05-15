<%-- 
    Document   : misvisitas
    Created on : 14-may-2017, 19:13:15
    Author     : Leonel
--%>

<%@page import="com.parcial3.visitas.Visitas"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.parcial3.docentes.Docentes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Tercer Parcial</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <%
            HttpSession mySession = request.getSession();
            if (mySession.getAttribute("idUser") == null) {
                response.sendRedirect("error.jsp");
            } else {
        %>
        <!-- menu bar -->
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="home.jsp">Doc Center</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <%
                            Docentes doc = new Docentes();
                            ResultSet rs = doc.Datos(mySession.getAttribute("userName").toString());
                            int rol = 0;
                            int id = 0;

                            if (rs.next()) {
                                id = rs.getInt(1);
                                rol = rs.getInt(8);
                            }

                            if (rol == 1) {
                        %>
                        <li><a href="inputdoc.jsp">Ingesar Docentes</a></li>
                        <li><a href="inputvisita.jsp">Ingresar Visitas</a></li>
                        <li><a href="visitas.jsp">Ver Visitas</a></li>
                            <%
                            } else {
                            %>
                        <li><a href="misvisitas.jsp">Ver Visitas</a></li>
                            <% }%>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <!-- fin menu bar -->

        <div class="container jumbotron">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Docente</th>
                        <th>Fecha</th>
                        <th>Institucion</th>
                    </tr>
                </thead>
                <%
                    Visitas vis = new Visitas();
                    rs = vis.misVisitas(id);

                    if (rs != null) {
                        while (rs.next()) {%>

                <tr>
                    <td><%= rs.getString(1)%></td>
                    <td><%= rs.getDate(2)%></td>
                    <td><%= rs.getString(3)%></td>
                </tr>
                <%      }
                } else {
                %>
                <p>No posees visitas</p>
                <% } %>
            </table>
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <% }%>
    </body>
</html>