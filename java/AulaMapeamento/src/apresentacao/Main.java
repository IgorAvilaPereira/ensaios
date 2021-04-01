/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.util.Calendar;
import negocio.Empregado;
import negocio.Projeto;
import java.util.List;
import negocio.EmpregadoProjeto;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws InterruptedException {
        Empregado igor = new Empregado();
        igor.setNome("Igor");
        
        Empregado ricardo = new Empregado();
        ricardo.setNome("Ricardo");
        
        Projeto tinder = new Projeto();
        tinder.setNome("Tinder");
        
        Projeto fotolog = new Projeto();
        fotolog.setNome("Fotolog..");
        
        EmpregadoProjeto empregadoProjeto = new EmpregadoProjeto();
        empregadoProjeto.setProjeto(fotolog);        
        empregadoProjeto.setEmpregado(ricardo);
        empregadoProjeto.setDataInicio(Calendar.getInstance());
        Thread.sleep(5000);  
        empregadoProjeto.setDataFim(Calendar.getInstance());
        ricardo.getVetEmpregadoProjeto().add(empregadoProjeto);
        
        System.out.println("Empregado:"+empregadoProjeto.getEmpregado().getNome());
        System.out.println("Projeto:"+empregadoProjeto.getProjeto().getNome());
        System.out.println("Data Inicio:"+empregadoProjeto.getDataInicio().getTime());
        System.out.println("Data Inicio:"+empregadoProjeto.getDataFim().getTime());
        
        
        
        
        /*
        tinder.getVetEmpregado().add(igor);
        tinder.getVetEmpregado().add(ricardo);
        
        fotolog.getVetEmpregado().add(igor);
        fotolog.getVetEmpregado().add(ricardo);
        
        
        igor.getVetProjeto().add(tinder);
        igor.getVetProjeto().add(fotolog);
        
        ricardo.getVetProjeto().add(tinder);
        ricardo.getVetProjeto().add(fotolog);
        
        List<Projeto> vetProjeto = igor.getVetProjeto();
        for (int i = 0; i < vetProjeto.size(); i++) {
            Projeto projetoIgor  = vetProjeto.get(i);
            System.out.println("Projeto que igor esta fazendo parte:"+projetoIgor.getNome());
            
        }
        */
        
        /*
        Empregado igor = new Empregado();
        igor.setNome("Igor");
        
        Empregado ricardo = new Empregado();
        ricardo.setNome("Ricardo");
        
        Projeto projeto = new Projeto();
        projeto.setNome("Tinder");
        
        projeto.getVetEmpregado().add(igor);
        igor.setProjeto(projeto);
        
        projeto.getVetEmpregado().add(ricardo);
        ricardo.setProjeto(projeto);
        
        
        System.out.println("Projeto do Ricardo:"+ricardo.getProjeto().getNome());
        
        List<Empregado> vetEmpregado = projeto.getVetEmpregado();
        for (int i = 0; i < vetEmpregado.size(); i++) {
            Empregado empregado = vetEmpregado.get(i);
            System.out.println("Empregado:"+empregado.getNome());
        }
        */
        
    }
    
}
