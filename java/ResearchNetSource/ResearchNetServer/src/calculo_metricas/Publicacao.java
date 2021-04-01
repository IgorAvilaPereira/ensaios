package calculo_metricas;

public class Publicacao{
    String titulo, autores, ano, localPublicado, tipo, nome_membro;
    int cluster, id_membro;
    Integer id_publicacao;
    Publicacao replica;

    public Publicacao() {
    }
       

    public String getAno() {
        return ano;
    }

    public String getAutores() {
        return autores;
    }

    public int getCluster() {
        return cluster;
    }

    public int getId_membro() {
        return id_membro;
    }

    public Integer getId_publicacao() {
        return id_publicacao;
    }

    public String getLocalPublicado() {
        return localPublicado;
    }

    public String getNome_membro() {
        return nome_membro;
    }

    public Publicacao getReplica() {
        return replica;
    }

    public String getTipo() {
        return tipo;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    public void setAutores(String autores) {
        this.autores = autores;
    }

    public void setCluster(int cluster) {
        this.cluster = cluster;
    }

    public void setId_membro(int id_membro) {
        this.id_membro = id_membro;
    }

    public void setId_publicacao(Integer id_publicacao) {
        this.id_publicacao = id_publicacao;
    }

    public void setLocalPublicado(String localPublicado) {
        this.localPublicado = localPublicado;
    }

    public void setNome_membro(String nome_membro) {
        this.nome_membro = nome_membro;
    }

    public void setReplica(Publicacao replica) {
        this.replica = replica;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    
    /*@Override
    //toString sem html
        public String toString()
    {
        ResourceBundle msg = ResourceBundle.getBundle("resources/msgs", guiGrafo.location);
        StringBuilder str = new StringBuilder();
        str.append(msg.getString("autores"));
        str.append(autores);           
        str.append("\n");
        str.append(msg.getString("titulo"));
        str.append(titulo);
        
        if(tipo.equals("AA"))
        {
            str.append("\n");
            str.append(msg.getString("revista"));
        }
        else if(tipo.equals("AP"))
        {
            str.append("\n");
            str.append(msg.getString("revista"));
        }
        else if(tipo.equals("CL"))
        {
            str.append("\n");
            str.append(msg.getString("livro"));
        }
        else if(tipo.equals("TC") || tipo.equals("RC") || tipo.equals("RE"))
        {
            str.append("\n");
            str.append(msg.getString("evento"));
        }
        
        if(!tipo.equals("LP"))
        {
            str.append(localPublicado);
        }
        str.append("\n");
        str.append(msg.getString("ano"));
        str.append(ano);
        //str.append(id_publicacao);

        
        return str.toString();
    }*/
}