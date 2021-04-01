package controller;

import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
@EnableAutoConfiguration
public class SampleController {

    @RequestMapping("/")
    @ResponseBody
    String home() {
        return "Hello World sample";
    }
    
    
    @RequestMapping("/oi")
    @ResponseBody
    String oi() {
        return "oi";
    }

    public static void main(String[] args) throws Exception {       
        SpringApplication.run(SampleController.class, args);
    }
}