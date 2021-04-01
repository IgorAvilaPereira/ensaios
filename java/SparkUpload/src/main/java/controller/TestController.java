/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.HashMap;
import java.util.Map;
import spark.Request;
import spark.Response;

/**
 *
 * @author iapereira
 */
public class TestController {
       

    public Map index(Request rq, Response rs) {
        Map map = new HashMap();
        map.put("name", "Sam");
        return map;
    }
    
}
