/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.sql.SQLException;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author iapereira
 */
public class UsuarioTest {
    
    public UsuarioTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }


    /**
     * Test of save method, of class Usuario.
     * @throws java.sql.SQLException
     */
    @Test
    public void testSave() throws SQLException {
        System.out.println("save");
        Usuario instance = new Usuario();
        instance.setLogin("iapereira");
        instance.setSenha("#tesudo");
        boolean resultado = instance.save();
        assertEquals(true, resultado);
    }

    /**
     * Test of delete method, of class Usuario.
     * @throws java.sql.SQLException
     */
    @Test
    public void testDelete() throws SQLException  {
        System.out.println("delete");
        Usuario instance = new Usuario("iapereira", "#tesudo");
        instance.setId(5);
        boolean expResult = true;
        boolean result = instance.delete();
        assertEquals(expResult, result);
    }
    
}
