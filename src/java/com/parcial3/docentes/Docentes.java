/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.parcial3.docentes;

import com.docentes.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Leonel
 */
public class Docentes {
    Conexion myConn = new Conexion();
    PreparedStatement myPstat;
    ResultSet myRs;
    
    public ResultSet Datos(String usr, String pwd){
        try {
            myConn.conectar();
            myPstat = myConn.con.prepareStatement("select * from docentes where usuario =? and passwrd=?");
            myPstat.setString(1, usr);
            myPstat.setString(2, pwd);
            
            myRs = myPstat.executeQuery();
            
            return myRs;
        } catch (SQLException ex) {
            Logger.getLogger(Docentes.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public ResultSet Datos(String usr){
        try {
            myConn.conectar();
            myPstat = myConn.con.prepareStatement("select * from docentes where usuario =?");
            myPstat.setString(1, usr);
            
            myRs = myPstat.executeQuery();
            
            return myRs;
        } catch (SQLException ex) {
            Logger.getLogger(Docentes.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
