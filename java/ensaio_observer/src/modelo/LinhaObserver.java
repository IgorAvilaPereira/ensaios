package modelo;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

/**
 *
 * @author iapereira
 */
public class LinhaObserver implements Observer {

    @Override
    public void update(Dados d) {
        DefaultCategoryDataset ds = new DefaultCategoryDataset();
        ds.addValue(d.getA(), "valores", "A~="+((int) d.getA()));
        ds.addValue(d.getB(), "valores", "B~="+((int) d.getB()));
        ds.addValue(d.getC(), "valores", "C~="+((int) d.getC()));

        // cria o gráfico
        JFreeChart grafico = ChartFactory.createLineChart("Dados", "Valores",
                "Valor", ds, PlotOrientation.VERTICAL, true, true, false);

        JFrame frame = new JFrame();
        frame.setSize(400, 400);
        ImageIcon image = new ImageIcon(grafico.createBufferedImage(400, 400));
        JLabel imageLabel = new JLabel(image);
        frame.add(imageLabel);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        frame.setVisible(true);

    }

}
