package calculo_metricas;

import configuracao.Configuracao;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;
import persistencia.ConexaoPostgreSQL;

/**
 *
 * @author lucas
 */
public class GeradorGraphML {

    public void gerarGraphML(int idRede) throws SQLException, IOException {
        ConexaoPostgreSQL conexao = new ConexaoPostgreSQL();
        String query;
        
        query = "select atual from versao";
        ResultSet rs = conexao.executeQuery(query);
        rs.next();
        
        int versao = rs.getInt("atual");
        System.out.println("Atual:"+versao);

        query = "select nome, anoinicio, anofim from rede where id = " + idRede;
        rs = conexao.executeQuery(query);
        if (rs.next()) {
            String nomeRede = rs.getString("nome");
            int anoInicio, anoFim;
            anoInicio = rs.getInt("anoinicio");
            anoFim = rs.getInt("anofim");
            
            query = "create temp table adj as "
                    + " select p1.id_membro as membro1,p2.id_membro as membro2,count(p1.cluster) as colaboracao"
                    + " from publicacao as p1, publicacao as p2, membros as m1, membros as m2 "
                    + " where p1.cluster = p2.cluster"
                    + " and p1.id_membro < p2.id_membro"
                    + " and m1.id_membro = p1.id_membro"
                    + " and m2.id_membro = p2.id_membro";
            if(anoInicio > 0){
                query += " and p1.ano >= "+anoInicio;
            }
            if(anoFim > 0){
                query += " and p1.ano <="+anoFim;
            }
            query += " and m1.id_lattes in (select idlattes from membrosrede where idrede = "+idRede+")"
                    + " and m2.id_lattes in (select idlattes from membrosrede where idrede = "+idRede+")"
                    + " group by p1.id_membro,p2.id_membro"
                    + " order by p1.id_membro, p2.id_membro";          
            
            conexao.executeUpdate(query);
            
            query = "select count(*) from adj";
            rs = conexao.executeQuery(query);
            rs.next();
            boolean rede = false;
            if(rs.getInt(1) > 0){
                rede = true;
            }
            
            query = "select count(*) from membrosrede where idrede = "+idRede;
            rs = conexao.executeQuery(query);
            rs.next();
            int nMembros = rs.getInt(1);
            int [][]adj = new int[nMembros][nMembros];
            Map <Integer, Integer> map = new TreeMap<Integer, Integer>();
            
            query = "select id_membro"
                    + " from membrosrede, membros"
                    + " where idrede = "+idRede
                    + " and membrosrede.idlattes = membros.id_lattes"
                    + " order by id_membro";       
            
            rs = conexao.executeQuery(query);
            int a = 0;
            while(rs.next()){
                map.put(rs.getInt(1), a);
                a++;
            }
                                  
            query = "select membro1, membro2, colaboracao from adj order by membro1, membro2;";
            rs = conexao.executeQuery(query);
            int id1, id2;
            while(rs.next()){
                id1 = map.get(rs.getInt(1));
                id2 = map.get(rs.getInt(2));
                adj[id1][id2] = rs.getInt(3);
                adj[id2][id1] = rs.getInt(3);
            }
            String txt = "";
            for(int i=0; i<nMembros; i++){
                for(int j=0; j<nMembros; j++){
                    txt += adj[i][j]+" ";
                }
                txt += "\n";           
            }
            
            FileWriter tx = new FileWriter(Configuracao.DIR_SERVER_DATA+nomeRede+".txt");
            try {
                tx.write(txt);
            } catch (Exception e) {
                System.out.println("oi;;;");
                System.out.println(e);
            }
            tx.close();
                      
            Grafo grafo = new Grafo(Configuracao.DIR_SERVER_DATA+nomeRede+".txt");
            double listaPageRank [] = grafo.getPageRank();
            double listaClusterCoeficient [] = grafo.getClusterCoeficient();
            double listaCloseness [] = grafo.getCloseness();
            Double densidade = grafo.getDensidade();
            
            String xml = "";
            xml += "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
            xml += "<graphml xmlns=\"http://graphml.graphdrawing.org/xmlns\">\n";
            xml += "<graph edgedefault=\"undirected\">\n";
            xml += "<!--name:#"+nomeRede+"#-->\n";
            xml += "<!--years:";
            if(anoInicio > 0){
                xml+=anoInicio;
            }
            xml += "/";
            if(anoFim > 0){
                xml+=anoFim;
            }
            xml += "-->\n";
            xml += "<!--diameter:";
            if(rede){
                ArrayList<Integer> diametro = grafo.getDiametro();
                for(Integer vert: diametro){
                    xml += vert+"/";
                }
            }
            xml += "-->\n";
            xml += "<!--giant:";
            if(rede){
                Double GC = grafo.getGiantComponent();
                xml+= GC.toString();
            }else{
                xml+="0.0";
            }
            xml+= "-->\n";
            xml += "<!--density:"+densidade.toString()+"-->\n";
            xml += "<!-- data schema -->\n";
            xml += "<key id=\"name\" for=\"node\" attr.name=\"name\" attr.type=\"string\"/>\n";
            xml += "<key id=\"link\" for=\"node\" attr.name=\"link\" attr.type=\"string\"/>\n";
            xml += "<key id=\"pubs\" for=\"node\" attr.name=\"pubs\" attr.type=\"int\"/>\n";
            xml += "<key id=\"betweenness\" for=\"node\" attr.name=\"betweenness\" attr.type=\"string\"/>\n";
            xml += "<key id=\"pagerank\" for=\"node\" attr.name=\"pagerank\" attr.type=\"string\"/>\n";
            xml += "<key id=\"degree\" for=\"node\" attr.name=\"degree\" attr.type=\"string\"/>\n";
            xml += "<key id=\"cluster_coefficient\" for=\"node\" attr.name=\"cluster_coefficient\" attr.type=\"string\"/>\n";
            xml += "<key id=\"closeness\" for=\"node\" attr.name=\"closeness\" attr.type=\"string\"/>\n";
            xml += "<key id=\"amount\" for=\"edge\" attr.name=\"amount\" attr.type=\"int\"/>\n";

            xml += "<!-- nodes -->\n";

            //query = "SELECT * FROM membros ORDER BY id_membro;";
            query = "select id_membro, nome, id_lattes"
                    + " from membros, membrosrede"
                    + " where membros.id_lattes = membrosrede.idlattes"
                    + " and membrosrede.idrede = "+idRede;
            
            rs = conexao.executeQuery(query);
            System.out.println("Query:"+query);
            ResultSet res;

            int id, grau, pubs;
            String nome, lattes;
            Double centralidade, pagerank, cluster, closeness;
            while (rs.next()) {
                id = rs.getInt("id_membro");
                nome = rs.getString("nome");
                lattes = rs.getString("id_lattes");
                pagerank = listaPageRank[map.get(id)];
                cluster = listaClusterCoeficient[map.get(id)];
                closeness = listaCloseness[map.get(id)];
                query = "SELECT count(*) FROM publicacao WHERE id_membro=" + id;
                if(anoInicio > 0){
                    query += " and ano >="+anoInicio;
                }
                if(anoFim > 0){
                    query += " and ano <="+anoFim;
                }

                res = conexao.executeQuery(query);
                res.next();
                pubs = res.getInt("count");

                query = "select count(*) from adj where membro1 =" + id + " or membro2 =" + id;
                res = conexao.executeQuery(query);
                res.next();
                grau = res.getInt("count");

                DecimalFormat df = new DecimalFormat("0.00");

                xml += "<node id=\"" + id + "\">\n";
                xml += "<data key=\"name\">" + nome + "</data>\n";
                xml += "<data key=\"link\">http://lattes.cnpq.br/" + lattes + "</data>\n";
                xml += "<data key=\"pubs\">" + pubs + "</data>\n";
                xml += "<data key=\"pagerank\">" + df.format(pagerank) + "</data>\n";
                xml += "<data key=\"degree\">" + grau + "</data>\n";
                xml += "<data key=\"cluster_coefficient\">" + df.format(cluster) + "</data>\n";
                xml += "<data key=\"closeness\">" + df.format(closeness) + "</data>\n";
                xml += "</node >\n";
            }

            xml += "<!-- edges -->\n";

            query = "SELECT * FROM adj;";
            rs = conexao.executeQuery(query);
            int c = 0;
            while (rs.next()) {
                xml += "<edge source=\"" + rs.getInt("membro1") + "\" target=\"" + rs.getInt("membro2") + "\">\n";
                xml += "<data key=\"amount\">" + rs.getInt("colaboracao") + "</data>\n</edge>\n";
                c++;
            }

            xml += "</graph>\n</graphml>";
            
            String nomeXML= "rede_id"+idRede+"_v"+versao+".xml";

            FileWriter fw = new FileWriter(Configuracao.DIR_SERVER_DATA+nomeXML);
            try {
                fw.write(xml);
            } catch (Exception e) {
                System.out.println("Caiu na excecao de gerar o xml da rede");
                System.out.println(e);
            }

            fw.close();
            
            query = "update rede set xml = '"+nomeXML+"' where id="+idRede;
            conexao.executeUpdate(query);            
            conexao.close();
            
        }
    }
        
}

