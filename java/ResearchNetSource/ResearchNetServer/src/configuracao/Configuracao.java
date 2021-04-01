package configuracao;

public class Configuracao {
    // Configuracoes de apoio 
    public static final String DIR_SERVER_DATA_LINUX = System.getProperty("user.dir")+"/data/";
    public static final String DIR_SERVER_DATA_WINDOWS = System.getProperty("user.dir")+"\\data\\";
    // configucoes principais
    public static final String DIR_SERVER_DATA = DIR_SERVER_DATA_LINUX;
    //public static final String DIR_SERVER_DATA = "/home/iapereira/NetBeansProjects/ResearchNetSource/ResearchNetServer/data/";
    public static final String USER_POSTGRES = "postgres";
    public static final String PASSWORD_POSTGRES = "postgres";
    public static final String DBNAME_POSTGRES = "lattes200916";
    public static final String HOST_POSTGRES = "localhost";
    public static final String ADDRESS_SERVER = "localhost";    
    
}
