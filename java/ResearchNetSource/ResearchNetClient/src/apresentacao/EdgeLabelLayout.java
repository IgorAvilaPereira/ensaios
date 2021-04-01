/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.awt.geom.Rectangle2D;
import java.util.Iterator;
import prefuse.action.layout.Layout;
import prefuse.visual.DecoratorItem;
import prefuse.visual.VisualItem;

/**
 *
 * @author lucas
 */
public class EdgeLabelLayout extends Layout {

    public EdgeLabelLayout(String group) {
        super(group);
    }

    @Override
    public void run(double frac) {
        Iterator iter = m_vis.items(m_group);
        while (iter.hasNext()) {
            DecoratorItem item = (DecoratorItem) iter.next();
            VisualItem edge = item.getDecoratedItem();
            Rectangle2D bounds = edge.getBounds();
            Double h = bounds.getHeight();
            Double w = bounds.getWidth();
            if (h < w) {
                setX(item, null, bounds.getCenterX());
                setY(item, null, bounds.getCenterY() - 5);
            } else {
                setX(item, null, bounds.getCenterX() + 5);
                setY(item, null, bounds.getCenterY());
            }
            
            

        }
    }
}
