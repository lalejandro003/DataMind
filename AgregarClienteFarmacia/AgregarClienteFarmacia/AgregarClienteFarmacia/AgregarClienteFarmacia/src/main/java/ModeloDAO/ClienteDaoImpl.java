/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Excepciones.ExcpecionesDao;
import Persistencia.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import modelo.Cliente;

/**
 *
 * @author Cristian
 */
public class ClienteDaoImpl implements iClienteDao {
    final String DELETE = "DELETE FROM cliente WHERE idCliente=?";
    final String UPDATE = "UPDATE cliente SET rfcCliente=?,nombreCliente=?,apellidoPaterno=?,apellidoMaterno=?,numeroTelefono=?,correoElectronico=?,calleCliente=?,numeroExterior=?,numeroInterior=?,codigoPostal=?,colonia=?,municipio=?,estado=?,pais=?,fechaRegistro=?,estatus=? WHERE idCliente=?";
    Conexion conexion = new Conexion();
    Connection conn = conexion.obtenerConexion();
    
        public ClienteDaoImpl()
    {
        this.conexion= new Conexion();
    }
        
    
    public Cliente obtenerClienteyid(String idCliente) {
        /**
         * primero me conecto
         */
       
       Cliente user =null;
       String sql = "SELECT * FROM cliente WHERE idCliente ="+idCliente;
       
       try{
           
           /**
            * Realizo la consulta a la base de datos
            */
           Statement sentencia = conn.createStatement();
           ResultSet resultado = sentencia.executeQuery(sql);
            /**
             * Se recorren las tuplas retornadas
             */
            user = new Cliente();
             
            while (resultado.next()) {
          
               user.setId(resultado.getInt("id"));
               user.setRfc(resultado.getString("Rfc"));
               user.setNombre(resultado.getString("nombre"));
               user.setApellidoPaterno(resultado.getString("apellidoPaterno"));
               user.setApellidoMaterno(resultado.getString("apellidoMaterno"));
               user.setNumeroTelefonico(resultado.getString("numeroTelefonico"));
               user.setCorreo(resultado.getString("correo"));
               user.setCalle(resultado.getString("calle"));              
               user.setNumeroExterior(resultado.getInt("numeroExterior"));
               user.setNumeroInterior(resultado.getInt("numeroInterior"));
               user.setCodigoPostal(resultado.getInt("codigoPostal"));
               user.setColonia(resultado.getString("colonia"));
               user.setMunicipio(resultado.getString("municipio"));
               user.setEstado(resultado.getString("estado"));
               user.setPais(resultado.getString("pais"));
               user.setFechaRegistro(resultado.getString("fechaRegistro"));
               user.setEstatus(resultado.getString("estatus"));
            }
            
            conn.close(); 
       }catch(SQLException ex){
       
       }
       return user;
    }
    
    public boolean crearCliente(Cliente user) {
        boolean registrar=false;
        Statement stm;
        Connection con = this.conexion.obtenerConexion();
        
        
        /**
         * insertamos nuevos registros en una tabla de una base de datos.
         */
        String sql="INSERT INTO cliente values (NULL,'"
                +user.getRfc()+"','"
                +user.getNombre()+"','"    
                +user.getApellidoPaterno()+"','"
                +user.getApellidoMaterno()+"','"
                +user.getNumeroTelefonico()+"','"
                +user.getCorreo()+"','"
                +user.getCalle()+"','"
                +user.getNumeroExterior()+"','"
                +user.getNumeroInterior()+"','"
                +user.getCodigoPostal()+"','"
                +user.getColonia()+"','"
                +user.getMunicipio()+"','"
                +user.getEstado()+"','"
                +user.getPais()+"','"
                +user.getFechaRegistro()+"','"
                +user.getEstatus()+"')";
        
        try
        {
         stm=con.createStatement();
         stm.execute(sql);
         registrar=true;
         stm.close();
         con.close();
        }
        catch(SQLException e)
                {
                    System.out.println("ERROR EN REGISTRAR");
                    e.printStackTrace();
                }
        return registrar;
    }
  
    
    public void eliminarCliente(Cliente dato) throws ExcpecionesDao {
        PreparedStatement stat = null;
        try{
            stat = conn.prepareStatement(DELETE);
            stat.setInt(1, dato.getId());//modificacion
            System.out.println(dato.getId());
            if(stat.executeUpdate()== 0){
                throw new ExcpecionesDao("La categoría no se borró");
            }
        }catch(SQLException ex){
            throw new ExcpecionesDao("Error de SQL", ex);
        }finally{
            if(stat!=null){
                try{
                    stat.close();
                }catch(SQLException ex){
                    throw new ExcpecionesDao("Error de SQL", ex);
                }
            }
        }
    }

    public void actualizarCliente(Cliente dato) throws ExcpecionesDao{
        PreparedStatement stat = null;
        try{
            stat = conn.prepareStatement(UPDATE);
            stat.setString(1, dato.getRfc());
            stat.setString(2, dato.getNombre());
            stat.setString(3, dato.getApellidoPaterno());
            stat.setString(4, dato.getApellidoMaterno());
            stat.setString(5, dato.getNumeroTelefonico());
            stat.setString(6, dato.getCorreo());
            stat.setString(7, dato.getCalle());
            stat.setInt(8, dato.getNumeroExterior());
            stat.setInt(9, dato.getNumeroInterior());
            stat.setInt(10, dato.getCodigoPostal());
            stat.setString(11, dato.getColonia());
            stat.setString(12, dato.getMunicipio());
            stat.setString(13, dato.getEstado());
            stat.setString(14, dato.getPais());
            stat.setString(15, dato.getFechaRegistro());
            stat.setString(16, dato.getEstatus());
            stat.setInt(17, dato.getId());
            
            stat.execute();
            
            if(stat.executeUpdate()==0){
                throw new ExcpecionesDao("No se actualizó la categoría");
            }
            }catch(SQLException ex){
                throw new ExcpecionesDao("Error de SQL", ex);
            }finally{
                if(stat!=null){
                    try{
                        stat.close();
                    }catch(SQLException ex){
                        throw new ExcpecionesDao("Error de SQL", ex);
                }
            }
        }
                    
    }
    
    public void getTodosClientes() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Cliente obtenerClientebyid(String idCliente) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}