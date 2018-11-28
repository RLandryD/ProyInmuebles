/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.persistencia;

import app.modelo.Cliente;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Acceso01
 */
public class ClienteBD {
    //Conexión con MYSQL
      static private String URL = "jdbc:mysql://localhost:3306/proyectofinal";
      static private String drive = "com.mysql.jdbc.Driver";
      static private String usuBD = "root";
      static private String contrasenaBD = "";
      static private Connection conexion;

    public static String getURL() {
        return URL;
    }

    public static void setURL(String URL) {
        ClienteBD.URL = URL;
    }

    public static String getDrive() {
        return drive;
    }

    public static void setDrive(String drive) {
        ClienteBD.drive = drive;
    }

    public static String getUsuBD() {
        return usuBD;
    }

    public static void setUsuBD(String usuBD) {
        ClienteBD.usuBD = usuBD;
    }

    public static String getContrasenaBD() {
        return contrasenaBD;
    }

    public static void setContrasenaBD(String contrasenaBD) {
        ClienteBD.contrasenaBD = contrasenaBD;
    }

    public static Connection getConexion() {
        return conexion;
    }

    public static void setConexion(Connection conexion) {
        ClienteBD.conexion = conexion;
    }
      
    public void agregar(Cliente c) throws SQLException{
       
        Statement st;
        ResultSet rs;
        String sql;
        
        //Abrir la base de datos
        abrir();
        
        //Insertar en la BD
        sql = "INSERT INTO cliente (Nombre, Password, Calle, Colonia, Ciudad, Rfc, Telefono, Tipo, Correo) "
                + "VALUES ("+"'"+c.getNombre()+"',"+"'"+c.getPassword()+"',"+"'"+c.getCalle()+"',"+"'"+c.getColonia()+"',"+"'"+c.getCiudad()+"',"
                +"'"+c.getRfc()+"',"+"'"+c.getTelefono()+"',"+"'"+c.getTipo()+"',"+"'"+c.getCorreo()+"')";
        System.out.println(sql);
        st = conexion.createStatement();
        st.executeUpdate(sql);
        
    }
    
    public static ArrayList<Cliente> TodosClientes() throws SQLException, IOException {
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        Cliente c = null;
        int controlarCliente = 0;
        //Abrir la base de datos
        abrir();
        // Implementacion
        String sql = "SELECT * FROM CLIENTE";

        Statement st;
        ResultSet rs;
        st = conexion.createStatement();
        rs = st.executeQuery(sql);
        while (rs.next()) {
            controlarCliente++;
            c = new Cliente();
            c.setId_cliente(rs.getInt("ID_CLIENTE"));
            c.setNombre(rs.getString("NOMBRE"));
            c.setPassword(rs.getString("PASSWORD"));
            c.setCalle(rs.getString("CALLE"));
            c.setColonia(rs.getString("COLONIA"));
            c.setCiudad(rs.getString("CIUDAD"));
            c.setRfc(rs.getString("RFC"));
            c.setTelefono(rs.getString("TELEFONO"));
            c.setTipo(rs.getString("TIPO"));
            c.setCorreo(rs.getString("CORREO"));
            lista.add(c);
        }

        return lista;
    }
    
    public Cliente buscar(int id) throws SQLException{
        Cliente c = null;
        
        //Abrir la base de datos
        abrir();
        // Implementacion
        String sql = "SELECT * FROM CLIENTE "
                + "WHERE Id_cliente =" +id;
        
        Statement st;
        ResultSet rs;
        st = conexion.createStatement();
        rs = st.executeQuery(sql);
        while (rs.next()) {
            c = new Cliente(); 
            c.setId_cliente(rs.getInt("ID_CLIENTE"));
            c.setNombre(rs.getString("NOMBRE"));
            c.setPassword(rs.getString("PASSWORD"));
            c.setCalle(rs.getString("CALLE"));
            c.setColonia(rs.getString("COLONIA"));
            c.setCiudad(rs.getString("CIUDAD")); 
            c.setRfc(rs.getString("RFC")); 
            c.setTelefono(rs.getString("TELEFONO")); 
            c.setTipo(rs.getString("Tipo"));
            c.setCorreo(rs.getString("Correo"));
        }
        
        return c;
    }
    
    public void modificar(Cliente c) throws SQLException{
        Statement st;
        String sql = "Update CLIENTE Set"
                             +" NOMBRE = '"+c.getNombre()+"'"
                             +", PASSWORD = '"+c.getPassword()+"'"
                             +", CALLE = '"+c.getCalle()+"'"
                             +", COLONIA = '"+c.getColonia()+"'"
                             +", CIUDAD = '"+c.getCiudad()+"'"
                             +", RFC = '"+c.getRfc()+"'"
                             +", TELEFONO = '"+c.getTelefono()+"'"
                             +", TIPO = '"+c.getTipo()+"'"
                             +", CORREO = '"+c.getCorreo()+"'"
                             +" where ID_CLIENTE = "+c.getId_cliente();
        st = conexion.createStatement();
        st.execute(sql);
    }
    
    public void eliminar(int id) throws SQLException{
        Statement st;
        String sql = "delete from CLIENTE where ID_CLIENTE ="+id;
        st = conexion.createStatement();
        st.execute(sql);
    }
    
    public Cliente buscar(String nombre, String contrasena) throws SQLException{
        Cliente c = null;
        Statement st;
        ResultSet rs;
        String sql;
        
        //Abrir la base de datos
        abrir();
        
        //Buscar el registro que cumpla
        sql = "Select * from cliente where nombre = "+"'"+nombre+"'"
            + "and password = "+"'"+contrasena+"'";
        System.out.println(sql);
        st = conexion.createStatement();
        rs = st.executeQuery(sql);
                
        // Construir un objeto de tipo Usuario
        while(rs.next()){
            c = new Cliente();
            c.setId_cliente(rs.getInt("ID_CLIENTE"));
            c.setNombre(rs.getString("NOMBRE"));
            c.setPassword("PASSWORD");
            c.setCalle(rs.getString("CALLE"));
            c.setColonia(rs.getString("COLONIA"));
            c.setCiudad(rs.getString("CIUDAD"));
            c.setRfc(rs.getString("RFC"));
            c.setTelefono(rs.getString("TELEFONO"));
            c.setTipo(rs.getString("TIPO"));
            c.setCorreo(rs.getString("CORREO"));
        }
        
        //Retornar ese objeto
        return c;
    }
    
    public static void abrir() throws SQLException{
        conexion = DriverManager.getConnection(URL, usuBD, contrasenaBD);
    }
    
    public void cerrar() throws SQLException{
        conexion.close();
    }
}
