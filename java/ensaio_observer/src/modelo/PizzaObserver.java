package modelo;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;

/**
 *
 * @author iapereira
 */
public class PizzaObserver implements Observer {

    @Override
    public void update(Dados d) {
           DefaultPieDataset dataset = new DefaultPieDataset( );
      dataset.setValue("A~="+((int) d.getA()), d.getA() );
      dataset.setValue("B~="+((int) d.getB()), d.getB() );
      dataset.setValue("C~="+((int) d.getC()), d.getC());
      //dataset.setValue("Nokia Lumia", new Double( 10 ) );

      JFreeChart chart = ChartFactory.createPieChart(
         "Dados",   // chart title
         dataset,          // data
         true,             // include legend
         true,
         false);
         
  //    int width = 640;   /* Width of the image */
//      int height = 480;  /* Height of the image */ 
      
          JFrame frame = new JFrame();

        frame.setSize(400, 400);

        //JLabel label = new JLabel("Hello, World!");
        ImageIcon image = new ImageIcon(chart.createBufferedImage(400, 400));

        JLabel imageLabel = new JLabel(image);

//            label.setOpaque(true);
        //      label.setBackground(myColor);
        frame.add(imageLabel);

        //frame.add(label);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        frame.setVisible(true);
    }
    
}
