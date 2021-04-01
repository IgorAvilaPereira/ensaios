package app;

import java.util.HashMap;
import java.util.Map;

import spark.ModelAndView;
import spark.template.mustache.MustacheTemplateEngine;

import static spark.Spark.get;

public class App {

    public static void main(String[] args) {
        
        //get("/hello", (request, response) -> "world");
        
        
        Map map = new HashMap();
        map.put("name", "Sam");

        // hello.mustache file is in resources/templates directory
        get("/hello", (rq, rs) -> new ModelAndView(map, "hello.mustache"), new MustacheTemplateEngine());
    }

}