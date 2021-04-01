/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.sql.SQLException;
import negocio.Time;
import persistencia.TimeDAO;

/**
 *
 * @author iapereira
 */
public class Facade {
    private Time time;
    private TimeDAO timeDAO;
    
    
    public Facade(){
        this.time = new Time();
        this.timeDAO = new TimeDAO();
    }

    public boolean inserir(String nome, String endereco) throws SQLException {
        //Time time = new Time();
        this.time.setNome(nome);
        this.time.setEndereco(endereco);
        //this.timeDAO = new TimeDAO();
        return this.timeDAO.inserir(time);
    }

}
