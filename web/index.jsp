<%-- 
    Document   : index
    Created on : 14-may-2017, 7:46:28
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

        <!-- CSS -->
        <style type="text/css">
            html{
                margin: 0px;
                padding: 0px;
                border: 0px;
            }

            .boxlogin{
                border-radius: 5px;
                box-shadow: 0px 2px 6px #d6d6d6;
                width: 45%;
                padding: 30px;
                margin: 100px auto;
                -webkit-border-radius: 4px;
                -moz-border-radius: 4px;
            }


            input[type="submit"], label{ margin-top: 20px; }
        </style>
    </head>
    <body>

        <div class="jumbotron boxlogin">
            <form action="index.jsp" method="post" name="flogin" id="flogin">
                <label>Usuario: </label>
                <input type="text" name="username" id="username" class="form-control" required />
                <label>Contraseña: </label>
                <input type="password" name="passdw" id="passwd" class="form-control" required />
                <input type="submit" name="btnIngresar" class="btn btn-primary" value="Ingresar">
            </form>
            <%
            if(request.getParameter("btnIngresar") != null){
                Docentes doc = new Docentes();
                ResultSet rs = doc.Datos(request.getParameter("username"), request.getParameter("passdw"));
                
                if(rs.next()){
                    HttpSession mySession = request.getSession();
                    mySession.setAttribute("idUser", rs.getInt(1));
                    mySession.setAttribute("userName", rs.getString(6));
                    response.sendRedirect("home.jsp");
                } else { %>
                <p>Lo sentimos el usuario o la contrase&ntilde;a con incorrectas</p>        
        <%        }
            }
        %>
        </div>
        
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>

    </body>
</html>