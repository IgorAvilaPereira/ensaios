import negocio.Calculo;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author iapereira
 */
public class CalculoTest {
    
    public CalculoTest() {
    }

    /**
     * Test of ExecutaCalculo method, of class Calculo.
     */
    @Test
    public void testExecutaCalculo() {
        System.out.println("ExecutaCalculo");
        float Valor1 = 10.0F;
        float Valor2 = 5.0F;
        float expResult = 15.0F;
        float result = Calculo.ExecutaCalculo(Valor1, Valor2);
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    
}
