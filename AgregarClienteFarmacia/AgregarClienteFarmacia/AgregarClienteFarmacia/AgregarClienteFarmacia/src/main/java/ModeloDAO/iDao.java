/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package ModeloDAO;

import Excepciones.ExcpecionesDao;
import java.util.List;

/**
 *
 * @author Cristian
 * @param <T>
 */
public interface iDao<T, K> {
    void crearCliente(T dato) throws ExcpecionesDao;
    void eliminarCliente(T dato) throws ExcpecionesDao;
    void actualizarCliente(T dato) throws ExcpecionesDao;
    List<T> getTodosClientes() throws ExcpecionesDao;
   
}
