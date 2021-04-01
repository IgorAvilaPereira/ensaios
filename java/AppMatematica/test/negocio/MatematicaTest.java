/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.BeforeClass;

/**
 *
 * @author iapereira
 */
public class MatematicaTest {
    
    public MatematicaTest() {
    }
    
    @BeforeClass
    public static void beforeClass(){
        System.out.println("Antes de tudo...");
                
                
                
    }
    
    @AfterClass
    public static void afterClass(){
        System.out.println("DEpois de tudo..");
    }
    
    @Before
    public void before(){
        System.out.println("Antes de todo teste...");
    }
    
    @After
    public void after(){
        System.out.println("Depois de todo o teste...");
    }

    /**
     * Test of adicao method, of class Matematica.
     */
    @Test
    public void testAdicao() {
        System.out.println("adicao");
        int x = 0;
        int y = 0;
        Matematica instance = new Matematica();
        int expResult = 0;
        int result = instance.adicao(x, y);
        assertEquals(expResult, result);
        expResult = 10;
        result = instance.adicao(2, 8);
        assertEquals("Deu xabum",expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of multiplicacao method, of class Matematica.
     */
    /*
    @Test
    public void testMultiplicacao() {
        System.out.println("multiplicacao");
        int x = 0;
        int y = 0;
        Matematica instance = new Matematica();
        int expResult = 0;
        int result = instance.multiplicacao(x, y);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
       // fail("The test case is a prototype.");
    }*/

    /**
     * Test of divisao method, of class Matematica.
     */
    
    @Test
    public void testDivisao() {
        System.out.println("divisao");
        int x = 4;
        int y = 2;
        Matematica instance = new Matematica();
        int expResult = 2;
        int result = instance.divisao(x, y);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    
}
