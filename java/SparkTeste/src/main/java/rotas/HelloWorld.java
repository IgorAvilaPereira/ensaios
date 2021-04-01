package rotas;

import java.util.HashMap;
import java.util.Map;
import spark.ModelAndView;
import static spark.Spark.*;
import spark.template.mustache.MustacheTemplateEngine;

public class HelloWorld {
    public static void main(String[] args) {
        staticFiles.location("/public"); // Static files

        get("/hello", (req, res) -> {
            return "Hello Worsssld";
        });    
        
        
        get("/hellotemplate", (rq, rs) -> {            
            Map map = new HashMap();
            map.put("name", "Sam");
            return new ModelAndView(map, "hello.mustache");
        }, new MustacheTemplateEngine());
        
        
        
        
    }
}