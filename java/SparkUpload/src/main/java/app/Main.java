package app;

//https://github.com/tipsy/spark-file-upload


import controller.TestController;
import spark.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.*;
import static spark.Spark.*;
import spark.template.mustache.MustacheTemplateEngine;


public class Main {

    public static void main(String[] args) {

        //enableDebugScreen();
        
        File uploadDir = new File("upload");
        uploadDir.mkdir(); // create the upload directory if it doesn't exist

        staticFiles.externalLocation("upload");

        get("/", (req, res)
                -> "<form method='post' enctype='multipart/form-data'>" // note the enctype
                + "    <input type='file' name='uploaded_file' accept='.png'>" // make sure to call getPart using the same "name" in the post
                + "    <button>Upload picture</button>"
                + "</form>"
        );

        post("/", (Request req, Response res) -> {

            Path tempFile = Files.createTempFile(uploadDir.toPath(), "", "");

            req.attribute("org.eclipse.jetty.multipartConfig", new MultipartConfigElement("/temp"));

            try (InputStream input = req.raw().getPart("uploaded_file").getInputStream()) { // getPart needs to use same "name" as input field in form
                Files.copy(input, tempFile, StandardCopyOption.REPLACE_EXISTING);
            }

            logInfo(req, tempFile);
            return "<h1>You uploaded this image:<h1><img src='" + tempFile.getFileName() + "'>";

        });
        
        /*
        // controllers        
        TestController testController = new TestController();

        // rotas
        get("/hello", (req, res) -> "Hello World");

        get("/index", (req, res) -> new ModelAndView(testController.index(req, res), "index.mustache"), new MustacheTemplateEngine());

        //get("/hello2", (req, res) -> new ModelAndView(new HashMap(), "index.mustache"), new MustacheTemplateEngine());
        */
    }

    // methods used for logging
    private static void logInfo(Request req, Path tempFile) throws IOException, ServletException {
        System.out.println("Uploaded file '" + getFileName(req.raw().getPart("uploaded_file")) + "' saved as '" + tempFile.toAbsolutePath() + "'");
    }

    private static String getFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
