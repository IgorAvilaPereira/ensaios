package controle;

import java.util.HashMap;
import java.util.Map;
import spark.ModelAndView;
import spark.Request;
import spark.Response;

public class BookController {

    public ModelAndView index(Request rq, Response rs) {
        Map map = new HashMap();
        map.put("msg", "oi");
        // o hello deve ser criado na pasta templates/hello.mustache
        return new ModelAndView(map, "index.mustache");
    }

    public ModelAndView teste(Request rq, Response rs) {        
        Map map = new HashMap();
        map.put("msg", "olá");
        // o hello deve ser criado na pasta templates/hello.mustache
        return new ModelAndView(map, "teste.mustache");
    }
}
