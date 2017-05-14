/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.parcial3.escuela;

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
public class Escuela {
    Conexion myCon = new Conexion();
    PreparedStatement myPstat;
    ResultSet myRs;
    
    public ResultSet getRoles(){
        try {
            myCon.conectar();
            myPstat = myCon.con.prepareStatement("select * from escuelas");
            myRs = myPstat.executeQuery();
            
            return myRs;
        } catch (SQLException ex) {
            Logger.getLogger(Escuela.class.getName()).log(Level.SEVERE, null, ex);
            return  null;
        }
    }
}
