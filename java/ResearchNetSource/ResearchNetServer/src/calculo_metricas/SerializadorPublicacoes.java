/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package calculo_metricas;

import configuracao.Configuracao;
import java.beans.XMLEncoder;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import persistencia.ConexaoPostgreSQL;

/**
 *
 * @author lucas
 */
public class SerializadorPublicacoes {

    public void serializarPubsRede(int idRede) throws SQLException {
        ConexaoPostgreSQL conexao = new ConexaoPostgreSQL();
        String query;

        query = "select atual from versao";
        ResultSet rs = conexao.executeQuery(query);
        rs.next();
        int versao = rs.getInt("atual");

        query = "select nome, anoinicio, anofim from rede where id = " + idRede;
        rs = conexao.executeQuery(query);
        if (rs.next()) {
            String nomeRede = rs.getString("nome");
            int anoInicio, anoFim;
            anoInicio = rs.getInt("anoinicio");
            anoFim = rs.getInt("anofim");

            query = "select id_publicacao, titulo, autores, ano, publicacao.id_membro, cluster, tipo"
                    + " from publicacao, membros"
                    + " where publicacao.id_membro = membros.id_membro"
                    + " and membros.id_lattes in (select idlattes from membrosrede where idrede = " + idRede + ")";

            if (anoInicio > 0) {
                query += " and publicacao.ano >= " + anoInicio;
            }
            if (anoFim > 0) {
                query += " and publicacao.ano <= " + anoFim;
            }
            query += " order by publicacao.id_membro, ano;";

            List<Publicacao> listaPublicacoes = new LinkedList<Publicacao>();

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
                } else if (listaPublicacoes.get(i).tipo.equals("RE")) {
                    query = "select evento from resumo_exp where id_publicacao=" + listaPublicacoes.get(i).id_publicacao.toString();
                } else if (listaPublicacoes.get(i).tipo.equals("RC")) {
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

            try (XMLEncoder encoder = new XMLEncoder(new BufferedOutputStream(
                    new FileOutputStream(Configuracao.DIR_SERVER_DATA+"pubs_rede_id" + idRede + "_v" + versao + ".xml")))) {

                for (int i = 0; i < listaPublicacoes.size(); i++) {
                    encoder.writeObject(listaPublicacoes.get(i));
                }
                System.out.println("Gravando o XML de publicacoes...");
                encoder.flush();

            } catch (Exception e) {
            }

        }
    }
}
