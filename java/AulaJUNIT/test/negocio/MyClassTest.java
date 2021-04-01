/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

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
public class MyClassTest {
    
    public MyClassTest() {
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
     * Test of multiply method, of class MyClass.
     */
    @Test
    public void testMultiply() {
        System.out.println("multiply");
        int x = 0;
        int y = 0;
        MyClass instance = new MyClass();
        int expResult = 0;
        int result = instance.multiply(x, y);
        assertEquals("0 x 0 espero 0", expResult, result);
        //fail("The test case is a prototype.");
    }
    
}
