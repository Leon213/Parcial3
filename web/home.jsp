<%-- 
    Document   : home
    Created on : 14-may-2017, 11:15:22
    Author     : Leonel
--%>

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

        <!-- Codigo CSS -->
        <style>
            #leftPanel{
                background-color:#0079ac;
                color:#fff;
                text-align: center;
            }

            #rightPanel{
                min-height:415px;
            }

            /* Credit to bootsnipp.com for the css for the color graph */
            .colorgraph {
                height: 5px;
                border-top: 0;
                background: #c4e17f;
                border-radius: 5px;
                background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
                background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
                background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
                background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            }
        </style>
    </head>
    <body>
        <%
            HttpSession mySession = request.getSession();
            if(mySession.getAttribute("idUser") == null){
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
                                String sApellido = "", usuario = "";
                                int rol = 0;
                                
                                if(rs.next()){
                                    pNombre = rs.getString(2);
                                    sNombre = rs.getString(3);
                                    pApellido = rs.getString(4);
                                    sApellido = rs.getString(5);
                                    usuario = rs.getString(6);
                                    rol = rs.getInt(8);
                                }
                                
                                if(rol == 1){
                            %>
                            <li><a href="inputdoc.jsp">Ingesar Docentes</a></li>
                            <li><a href="inputvisita.jsp">Ingresar Visitas</a></li>
                            <li><a href="visitas.jsp">Ver Visitas</a></li>
                            <%
                                } else{
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
        <div class="container">
            <br>
            <br>
            <div class="row" id="main">
                <div id="output">
                </div>
                <div class="col-md-4 well" id="leftPanel">
                    <div class="row">
                        <div class="col-md-12">
                            
                            <div>
                                <img src="img/usuario.png" alt="Usuario" class="img-circle img-thumbnail">
                                <h2><%= pNombre %> <%= pApellido %></h2>
                                    <p>Bienvenido <%= pNombre %> estas en la interfaz principal del sistema web aqui podras 
                                        realiza todas las acciones que necesitas como docente solo debes de seleccionarlas en el menu de la 
                                        parte superior de la pagina</p>
                                    <br/>
                                    <%
                                        if(request.getParameter("nuevousuario") != null){
                                    %>
                                    <p>La contrase&ntilde;a y usuario para el nuevo docente es: <%= request.getParameter("nuevousuario") %></p>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 well" id="rightPanel">
                        <div class="row">
                            <div class="col-md-12">
                                <form role="form" id="miform" action="#" method="POST">
                                    <h2>Edita tu perfil.<small>Siempre es facil.</small></h2>
                                    <hr class="colorgraph">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <input type="text" name="first_name" id="first_name" class="form-control input-lg" placeholder="Primer Nombre" value="<%= pNombre %>" tabindex="1">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <input type="text" name="middle_name" id="middle_name" class="form-control input-lg" placeholder="Segundo Nombre" value="<%= sNombre %>" tabindex="2">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <input type="text" name="last_name" id="last_name" class="form-control input-lg" placeholder="Primer Apellido" value="<%= pApellido %>" tabindex="3">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <input type="text" name="sur_name" id="sur_name" class="form-control input-lg" placeholder="Segundo Apellido" value="<%= sApellido %>" tabindex="4">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="user_name" id="username" class="form-control input-lg" placeholder="Ususario" value="<%= usuario %>" tabindex="5" required>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password" tabindex="6">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-lg" placeholder="Confirm Password" tabindex="7">
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="colorgraph">
                                    <div class="row">
                                        <div class="col-xs-12 col-md-6"></div>
                                        <div class="col-xs-12 col-md-6"><input type="submit" class="btn btn-success btn-block btn-lg"></input></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>       
        </div>
        <!-- Fin del contenido -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <% } %>
</body>
</html>