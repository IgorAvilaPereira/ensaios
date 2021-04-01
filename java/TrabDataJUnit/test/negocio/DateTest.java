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
import org.junit.Ignore;

/**
 *
 * @author iapereira
 */
public class DateTest {
    
    public DateTest() {
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

    @Test
    public void testConstrutor(){
        System.out.println("TestConstrutor");
        Date d1 = new Date();
        assertEquals(1, d1.day);
        assertEquals(1, d1.month);
        assertEquals(1900, d1.year);
    }
    
    /**
     * Test of toString method, of class Date.
     */
    @Test
    public void testToString() {
        System.out.println("toString");
        Date instance = new Date();
        String expResult = "01/01/1900";
        String result = instance.toString();
        assertEquals(expResult, result);        
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of equals method, of class Date.
     */
    
    @Test
    public void testEquals() {
        System.out.println("equals");
        Object o = new Date(1987,1,20);
        Date instance = new Date(20,1,1987);
        boolean expResult = true;
        boolean result = instance.equals(o);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of tomorrow method, of class Date.
     */
    @Ignore
    @Test
    public void testTomorrow() {
        System.out.println("tomorrow");
        Date instance = new Date(2016,5,24);
        Date expResult = new Date(2016,5,25);
        Date result = instance.tomorrow();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of before method, of class Date.
     */
    @Ignore
    @Test
    public void testBefore() {
        System.out.println("before");
        Date x = new Date();
        Date instance = new Date();
        boolean expResult = false;
        boolean result = instance.before(x);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of after method, of class Date.
     */
    @Ignore
    @Test
    public void testAfter() {
        System.out.println("after");
        Date x = new Date();
        Date instance = new Date();
        boolean expResult = false;
        boolean result = instance.after(x);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of isLeapYear method, of class Date.
     */
    @Ignore
    @Test
    public void testIsLeapYear() {
        System.out.println("isLeapYear");
        Date instance = new Date();
        boolean expResult = false;
        boolean result = instance.isLeapYear();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of plusDays method, of class Date.
     */
    @Ignore
    @Test    
    public void testPlusDays() {
        System.out.println("plusDays");
        int days = 0;
        Date instance = new Date();
        Date expResult = new Date();
        Date result = instance.plusDays(days);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of yesterday method, of class Date.
     */
    
    @Test
    public void testYesterday() {
        System.out.println("yesterday");
        Date instance = new Date(1900, 1, 2);
        Date expResult = new Date();
        Date result = instance.yesterday();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of minusDays method, of class Date.
     */
    @Ignore
    @Test
    public void testMinusDays() {
        System.out.println("minusDays");
        int days = 0;
        Date instance = new Date();
        Date expResult = new Date();
        Date result = instance.minusDays(days);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    
}
