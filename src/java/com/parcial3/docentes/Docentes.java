/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.parcial3.docentes;

import com.docentes.conexion.Conexion;
import com.parcial3.bean.docenteBean;
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
    private static String usuario;

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    
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
    
    public ResultSet getDocentes(int id){
        try {
            myConn.conectar();
            myPstat = myConn.con.prepareStatement("SELECT `idDocentes`, CONCAT(pNombre, ' ', sNombre, ' ' , pApellido, ' ', sApellido) as nombres FROM docentes WHERE rol = ?");
            myPstat.setInt(1, id);
            myRs = myPstat.executeQuery();
            
            return myRs;
        } catch (SQLException ex) {
            Logger.getLogger(Docentes.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public int verificarUsuario(String usuario){
        int i = 0;
        try {
            myConn.conectar();
            myPstat = myConn.con.prepareStatement("SELECT * FROM docentes WHERE usuario = ?");
            myPstat.setString(1, usuario);
            myRs = myPstat.executeQuery();
            
            if(myRs.next())
                i = 100;
            return i;
        } catch (SQLException ex) {
            Logger.getLogger(Docentes.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
    public int updateDocPass(String pName, String sName, String pApell, String sApell, String user, String pass, int id){
        int i = 0;
        
        try {
            myPstat = myConn.con.prepareStatement("UPDATE docentes SET pNombre=?,sNombre=?,pApellido=?,sApellido=?,usuario=?,passwrd=? WHERE idDocentes=?");
            myPstat.setString(1, pName);
            myPstat.setString(2, sName);
            myPstat.setString(3, pApell);
            myPstat.setString(4, sApell);
            myPstat.setString(5, user);
            myPstat.setString(6, pass);
            myPstat.setInt(7, id);
            
            i = myPstat.executeUpdate();
            
            return i;
        } catch (SQLException ex) {
            Logger.getLogger(Docentes.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
    private int cantidadUsuarios(String usuario){
        int i = 0;
        
        try {
            myConn.conectar();
            myPstat = myConn.con.prepareStatement("select count(*) as kount from docentes where usuario=?");
            myPstat.setString(1, usuario);
            myRs = myPstat.executeQuery();
            
            if(myRs.next())
                i = myRs.getInt(1);
            
            return i;
        } catch (SQLException ex) {
            Logger.getLogger(Docentes.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
    
    public int addDocente(){
        
        docenteBean dBea = new docenteBean();
        String nombreP = dBea.getpNombre();
        String nombreS = dBea.getsNombre();
        String apellP = dBea.getpApellido();
        String apellS = dBea.getsApellido();
        String escuela = dBea.getSchool();
        String usurio = dBea.userAndPass();
        int i = 0, school = 0, can = 0;
        
        can = this.cantidadUsuarios(usurio);
        school = Integer.parseInt(escuela);
        
        if(can > 0){
            can = can + 1;
            usurio = usurio + Integer.toString(can);
        }
        
        try {
            myConn.conectar();
            myPstat = myConn.con.prepareStatement("insert into docentes(pNombre, sNombre, pApellido, sApellido, usuario, passwrd, rol, escuela) values(?,?,?,?,?,?,?,?)");
            myPstat.setString(1, nombreP);
            myPstat.setString(2, nombreS);
            myPstat.setString(3, apellP);
            myPstat.setString(4, apellS);
            myPstat.setString(5, usurio);
            myPstat.setString(6, usurio);
            myPstat.setInt(7, 2);
            myPstat.setInt(8, school);
            
            i = myPstat.executeUpdate();
            
            if(i > 0)
                this.setUsuario(usurio);
            
            
        } catch (SQLException ex) {
            Logger.getLogger(Docentes.class.getName()).log(Level.SEVERE, null, ex);
            i = -1;
        }
        
        return i;
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
