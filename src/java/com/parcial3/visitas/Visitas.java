/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.parcial3.visitas;

import com.docentes.conexion.Conexion;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Leonel
 */
public class Visitas {
    Conexion myCon = new Conexion();
    PreparedStatement myPstat;
    ResultSet myRs;
    
    public int addVisita(String institucion, int docente, String des, String dia, String mes, String anyo){
        int i = 0;
        String fecha = formatoFecha(anyo, mes, dia);
        try {
            //Formateando la fecha para ingresarla a la bd
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date myDate = formato.parse(fecha);
            java.sql.Date sqlDate = new Date(myDate.getTime());
            
            myCon.conectar();
            myPstat = myCon.con.prepareStatement("Insert into visitas(docente, institucion, fechaVisita,objetivo) values(?,?,?,?)");
            myPstat.setInt(1, docente);
            myPstat.setString(2, institucion);
            myPstat.setString(4, des);
            myPstat.setDate(3, sqlDate);
            
            i = myPstat.executeUpdate();
            
            myPstat.close();
        } catch (SQLException ex) {
            Logger.getLogger(Visitas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(Visitas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }
    
    private String formatoFecha(String anyo, String mes, String dia) {
        switch (mes) {
            case "Enero":
                mes = "01";
                break;
            case "Febrero":
                mes = "02";
                break;
            case "Marzo":
                mes = "03";
                break;
            case "Abril":
                mes = "04";
                break;
            case "Mayo":
                mes = "05";
                break;
            case "Junio":
                mes = "06";
                break;
            case "Julio":
                mes = "07";
                break;
            case "Agosto":
                mes = "08";
                break;
            case "Septiembre":
                mes = "09";
                break;
            case "Octubre":
                mes = "10";
                break;
            case "Noviembre":
                mes = "11";
                break;
            case "Diciembre":
                mes = "12";
                break;
        }
        return anyo + "-" + mes + "-" + dia;
    }
}
