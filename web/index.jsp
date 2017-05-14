<%-- 
    Document   : index
    Created on : 14-may-2017, 7:46:28
    Author     : Leonel
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Tarea Guia 10</title>

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
                <input type="text" name="username" id="username" class="form-control" />
                <label>Contraseña: </label>
                <input type="password" name="passdw" id="passwd" class="form-control"/>
                <input type="submit" name="btnIngresar" class="btn btn-primary" value="Ingresar">
            </form>
            <c:if test="${param.btnIngresar != null}">
                <sql:setDataSource driver="com.mysql.jdbc.Driver" 
                                   url="jdbc:mysql://localhost:3306/parcial3" 
                                   user="root" 
                                   password="" 
                                   var="dataSource" />
                <sql:query dataSource="${dataSource}" var="docent">
                    select * from docentes where usuario = '${param.username}' and passwrd = '${param.passdw}'
                </sql:query>
                <c:forEach var="row" items="${docent.rows}">
                    <c:choose>
                        <c:when test="${row.idDocentes == 1}">
                            <c:set scope="session" var="idDoc" value="${row.idDocentes}"></c:set>
                            <c:set scope="session" var="nivel" value="${row.rol}"></c:set>
                            <c:redirect url="home.jsp"></c:redirect>
                        </c:when>
                        <c:otherwise>
                            <p>Lo sentimos el nombre de usuario o la contrase&ntilde;a son incorrectos</p>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </c:if>
        </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>

    </body>
</html>