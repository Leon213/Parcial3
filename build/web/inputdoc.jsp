<%-- 
    Document   : inputdoc
    Created on : 14-may-2017, 13:47:05
    Author     : Leonel
--%>

<%@page import="com.parcial3.escuela.Escuela"%>
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
        <title>Parcial 3</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">


    </head>
    
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
                            String pNombre = "", pApellido = "";
                            String sNombre = "";
                            String sApellido = "";
                            int rol = 0;

                            if (rs.next()) {
                                pNombre = rs.getString(2);
                                sNombre = rs.getString(3);
                                pApellido = rs.getString(4);
                                sApellido = rs.getString(5);
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
                        <li><a href="visitas.jsp">Ver Visitas</a></li>
                            <% }%>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <!-- fin menu bar -->

        <!-- Contenido de la pagina -->
        <div class="container jumbotron">
            <form action="inputdoc.jsp" method="post" name="indoc">
                <div class="form-group">
                    <label for="nombreP">Primer Nombre</label>
                    <input type="text" class="form-control" id="nombreP" name="pNombre" placeholder="Luis" required>
                </div>
                <div class="form-group">
                    <label for="nombreS">Segundo Nombre</label>
                    <input type="text" class="form-control" id="nombreS" name="sNombre" placeholder="David">
                </div>
                <div class="form-group">
                    <label for="apellidoP">Primer Apellido</label>
                    <input type="text" class="form-control" id="apellidoP" name="pApellido" placeholder="Villalta" required>
                </div>
                <div class="form-group">
                    <label for="apellidoS">Segundo Apellido</label>
                    <input type="text" class="form-control" id="apellidoS" name="sApellido" placeholder="Villalta">
                </div>
                <div class="form-group">
                    <label for="escuelas">Escuela</label>
                    <select class="form-control" id="escuelas" name="school">
                        <%
                        Escuela esc = new Escuela();
                        rs = esc.getRoles();
                        
                        while(rs.next()){
                    %>
                    <option value="<%= rs.getInt(1) %>"><%= rs.getString(2)%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <button type="submit" name="btnIngresar" class="btn btn-primary">Registrar</button>
            </form>
            <%
                if(request.getParameter("btnIngresar") != null){%>
                <jsp:useBean id="actualizar" scope="request" class="com.parcial3.bean.docenteBean">
                    <jsp:setProperty name="actualizar" property="*" />
                </jsp:useBean>        
            <%   
                int actu = 0; 
                actu = doc.addDocente();
                
                if(actu > 0){
                    response.sendRedirect("home.jsp?nuevousuario="+doc.getUsuario()+"");
                }
                }
            %>
        </div>
        <!-- Fin del contenido -->
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <% }%>
    
</html>
