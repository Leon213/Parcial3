<%-- 
    Document   : inputvisitas
    Created on : 14-may-2017, 16:10:11
    Author     : Leonel
--%>

<%@page import="com.parcial3.visitas.Visitas"%>
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

        <!-- javascript -->
        <script src="http://code.jquery.com/jquery-3.2.1.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#escuelas').change(function () {
                    var id = $('#escuelas').val();
                    $('#docentes').load('comboDoc.jsp?idEscuela=' + id);
                });
            });
        </script>
        <!-- fin javascript -->
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
                        int rol = 0;

                        if (rs.next()) {
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

    <!-- Contenido de la pagina -->
    <div class="container jumbotron">
        <form action="inputvisita.jsp" method="post" name="indoc">
            <div class="form-group">
                <label for="school">Institucion</label>
                <input type="text" class="form-control" id="school" name="institucion" placeholder="Instituto Tecnico Ricaldone" required>
            </div>
            <div class="form-inline">
                <div class="form-group">
                    <label for="FechaNac">Nacimiento</label>
                    <select name="dia" class="form-control">
                        <option>01</option>
                        <option>02</option>
                        <option>03</option>
                        <option>04</option>
                        <option>05</option>
                        <option>06</option>
                        <option>07</option>
                        <option>08</option>
                        <option>09</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                        <option>13</option>
                        <option>14</option>
                        <option>15</option>
                        <option>16</option>
                        <option>17</option>
                        <option>18</option>
                        <option>19</option>
                        <option>20</option>
                        <option>21</option>
                        <option>22</option>
                        <option>23</option>
                        <option>24</option>
                        <option>25</option>
                        <option>26</option>
                        <option>27</option>
                        <option>28</option>
                        <option>29</option>
                        <option>30</option>
                        <option>31</option>
                    </select>
                    <select name="mes" class="form-control">
                        <option>Enero</option>
                        <option>Febrero</option>
                        <option>Marzo</option>
                        <option>Abril</option>
                        <option>Mayo</option>
                        <option>Junio</option>
                        <option>Julio</option>
                        <option>Agosto</option>
                        <option>Septiembre</option>
                        <option>Octubre</option>
                        <option>Noviembre</option>
                        <option>Diciembre</option>
                    </select>
                    <input type="text" name="anyo" class="form-control" id="anyo" placeholder="A&ntilde;o" required>
                </div>
            </div>
            <div class="form-group">
                <label for="escuelas">Escuela</label>
                <select class="form-control" id="escuelas" name="school">
                    <%
                        Escuela esc = new Escuela();
                        rs = esc.getRoles();

                        while (rs.next()) {
                    %>
                    <option value="<%= rs.getInt(1)%>"><%= rs.getString(2)%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div class="form-group" id="docentes">
                <label for="escuelas">Docentes</label>
                <select class="form-control">
                    <option value="no">Selecciones un escuela</option>
                </select>
            </div>
            <div class="form-group">
                <label for="objeti">Objetivo</label>
                <input type="text" class="form-control" id="objeti" name="objetivos" />
            </div>
            <button type="submit" name="btnIngresar" class="btn btn-primary">Registrar</button>
        </form>
        <%
            if (request.getParameter("btnIngresar") != null) {
                Visitas vis = new Visitas();
                String inst = request.getParameter("institucion");
                String docente = request.getParameter("docentes");
                String objetivo = request.getParameter("objetivos");
                String dia = request.getParameter("dia");
                String mes = request.getParameter("mes");
                String anyo = request.getParameter("anyo");
                int idDocen = Integer.parseInt(docente);
                
                int i = vis.addVisita(inst, idDocen, objetivo, dia, mes, anyo);
                
                if(i > 0){
                    response.sendRedirect("visitas.jsp");
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