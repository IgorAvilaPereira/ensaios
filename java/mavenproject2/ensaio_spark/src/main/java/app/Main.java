package app;

import controle.BookController;
import spark.Request;
import spark.Response;
import static spark.Spark.get;
import static spark.Spark.port;
import static spark.Spark.staticFiles;
import spark.template.mustache.MustacheTemplateEngine;

public class Main {

    public static void main(String[] args) {
                
        port(4567);
        staticFiles.location("/public");         
        
        BookController bookController = new BookController();
        
        get("/", (Request rq, Response rs) -> {                        
            return bookController.index(rq, rs);
        }, new MustacheTemplateEngine());
        
        
        
        get("/teste", (Request rq, Response rs) -> {                        
            return bookController.teste(rq, rs);
        }, new MustacheTemplateEngine());
    }
}
