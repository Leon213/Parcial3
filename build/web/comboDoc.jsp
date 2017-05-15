<%-- 
    Document   : comboDoc
    Created on : 14-may-2017, 16:47:47
    Author     : Leonel
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.parcial3.docentes.Docentes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<label for="docentes">Docente</label>
<select name="docentes" class="form-control" id="docentes">
<%
    String sId = request.getParameter("idEscuela");
    int idEs = Integer.parseInt(sId);
    Docentes doc1 = new Docentes();
    
    ResultSet rs1 = doc1.getDocentes(idEs);
    
    while(rs1.next()){
%>
<option value="<%=rs1.getInt(1)%>"><%= rs1.getString(2)%></option>
<% } %>
</select>

