package negocio;

import persistencia.ConexaoPostgreSQL;
import java.sql.*;
import java.util.*;


public class Aresta {

    private List<Publicacao> listaPublicacoes;
    private List<Publicacao> listaImprime;
    private String nomeMembro1;
    private String nomeMembro2;
    private int anoIni;
    private int anoFim;

    public Aresta(int anoIni, int anoFim){
        this.anoIni = anoIni;
        this.anoFim = anoFim;
        if(anoFim == 0){
            this.anoFim = 9999;
        }
        
        
    }

    public boolean adjacentes(String nome1, String nome2) {
        try {
            String id_membro1, id_membro2;

            nomeMembro1 = nome1;
            nomeMembro2 = nome2;
            listaPublicacoes = new LinkedList<Publicacao>();
            listaImprime = new LinkedList<Publicacao>();

            ConexaoPostgreSQL conexao = new ConexaoPostgreSQL();

            String query = "select id_membro from membros where nome='" + nome1 + "' or nome='" + nome2 + "'";

            ResultSet rs = conexao.executeQuery(query);
            rs.next();
            id_membro1 = rs.getString(1);
            rs.next();
            id_membro2 = rs.getString(1);
            
            query = "select pub.id_publicacao, pub.titulo, pub.autores, pub.ano, pub.id_membro, c.cluster, pub.tipo "
                    +"from publicacao as pub "
                    +"join (select cluster, count(*) from publicacao "
                    +"where id_membro = "+id_membro1+" or id_membro = "+id_membro2+" "
                    +" and ano between "+anoIni+" and "+anoFim
                    +" group by cluster having count(*)=2) as c "
                    +"on c.cluster = pub.cluster "
                    +"where pub.id_membro = "+id_membro1+" or pub.id_membro= "+id_membro2
                    +" and pub.ano between "+anoIni+" and "+anoFim
                    +" order by ano desc, tipo, c.cluster, pub.id_membro";
            
            
            rs =  conexao.executeQuery(query);
            while (rs.next()) {
                Publicacao pub = new Publicacao();
                pub.id_publicacao = rs.getInt(1);
                pub.titulo = rs.getString(2);
                pub.autores = rs.getString(3);
                pub.ano = rs.getString(4);
                pub.id_membro = rs.getInt(5);
                pub.cluster = rs.getInt(6);
                pub.tipo = rs.getString(7);

                listaPublicacoes.add(pub);
                
            }
            
            for (int i = 0; i < listaPublicacoes.size(); i++) {
                if (listaPublicacoes.get(i).tipo.equals("AP")) {
                    query = "select revista from revista where id_publicacao=" + listaPublicacoes.get(i).id_publicacao.toString();
                } else if (listaPublicacoes.get(i).tipo.equals("CL")) {
                    query = "select livro from capitulo where id_publicacao=" + listaPublicacoes.get(i).id_publicacao.toString();
                } else if (listaPublicacoes.get(i).tipo.equals("TC")) {
                    query = "select evento from conferencia where id_publicacao=" + listaPublicacoes.get(i).id_publicacao.toString();
                } else if (listaPublicacoes.get(i).tipo.equals("AA")) {
                    query = "select revista from revista_aceito where id_publicacao=" + listaPublicacoes.get(i).id_publicacao.toString();
                } else if (listaPublicacoes.get(i).tipo.equals("RE")){
                    query = "select evento from resumo_exp where id_publicacao=" + listaPublicacoes.get(i).id_publicacao.toString();
                } else if (listaPublicacoes.get(i).tipo.equals("RC")){
                    query = "select evento from resumo where id_publicacao=" + listaPublicacoes.get(i).id_publicacao.toString();
                } 
                rs = conexao.executeQuery(query);
                rs.next();
                listaPublicacoes.get(i).localPublicado = rs.getString(1);

                query = "select nome from membros where id_membro=" + listaPublicacoes.get(i).id_membro;
                rs = conexao.executeQuery(query);
                rs.next();
                listaPublicacoes.get(i).nome_membro = rs.getString(1);
            }
            for (int i=0; i < listaPublicacoes.size(); i+=2){
                listaPublicacoes.get(i).replica=listaPublicacoes.get(i+1);
                listaPublicacoes.get(i+1).replica=listaPublicacoes.get(i);
                listaImprime.add(listaPublicacoes.get(i));
            }
            return !listaImprime.isEmpty();

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void compilarListaPublicacoes(String nome1) {
        try {
            Integer id_membro1;

            listaPublicacoes = new LinkedList<Publicacao>();
            nomeMembro1 = nome1;

            ConexaoPostgreSQL conexao = new ConexaoPostgreSQL();

            String query = "select id_membro from membros where nome='" + nome1 + "'";

            ResultSet rs = conexao.executeQuery(query);
            rs.next();
            id_membro1 = rs.getInt(1);

            query = "select id_publicacao,titulo,autores,ano,id_membro,cluster,tipo "
                    + "from publicacao "
                    + " where id_membro=" + id_membro1.toString()
                    + " and ano between "+anoIni+" and "+anoFim
                    + " order by ano desc, tipo";

            rs = conexao.executeQuery(query);

            while (rs.next()) {
                Publicacao pub = new Publicacao();
                pub.id_publicacao = rs.getInt(1);
                pub.titulo = rs.getString(2);
                pub.autores = rs.getString(3);
                pub.ano = rs.getString(4);
                pub.id_membro = rs.getInt(5);
                pub.cluster = rs.getInt(6);
                pub.tipo = rs.getString(7);

                listaPublicacoes.add(pub);
            }

            for (int i = 0; i < listaPublicacoes.size(); i++) {
                if (listaPublicacoes.get(i).tipo.equals("AP")) {
                    query = "select revista from revista where id_publicacao=" + listaPublicacoes.get(i).id_publicacao.toString();
                } else if (listaPublicacoes.get(i).tipo.equals("CL")) {
                    query = "select livro from capitulo where id_publicacao=" + listaPublicacoes.get(i).id_publicacao.toString();
                } else if (listaPublicacoes.get(i).tipo.equals("TC")) {
                    query = "select evento from conferencia where id_publicacao=" + listaPublicacoes.get(i).id_publicacao.toString();
                } else if (listaPublicacoes.get(i).tipo.equals("AA")) {
                    query = "select revista from revista_aceito where id_publicacao=" + listaPublicacoes.get(i).id_publicacao.toString();
                } else if (listaPublicacoes.get(i).tipo.equals("RE")){
                    query = "select evento from resumo_exp where id_publicacao=" + listaPublicacoes.get(i).id_publicacao.toString();
                } else if (listaPublicacoes.get(i).tipo.equals("RC")){
                    query = "select evento from resumo where id_publicacao=" + listaPublicacoes.get(i).id_publicacao.toString();
                } 
                rs = conexao.executeQuery(query);
                rs.next();
                listaPublicacoes.get(i).localPublicado = rs.getString(1);
            }
            

//            guiPublicacoes janela = new guiPublicacoes();
//            janela.preenche();
//            janela.setVisible(true);
//            janela.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        } catch (SQLException e) {
        }
    }

    public List<Publicacao> getListaPublicacoes() {
        return listaPublicacoes;
    }

    public List<Publicacao> getListaImprime() {
        return listaImprime;
    }

    public String[] getNomes() {
        String[] nomes = new String[2];
        nomes[0] = nomeMembro1;
        nomes[1] = nomeMembro2;
        return nomes;
    }
}
