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
public class NodeLabelLayout extends Layout {

    public NodeLabelLayout(String group) {
        super(group);
    }

    @Override
    public void run(double frac) {
        Iterator iter = m_vis.items(m_group);
        while (iter.hasNext()) {
            DecoratorItem item = (DecoratorItem) iter.next();
            VisualItem node = item.getDecoratedItem();
            
            Rectangle2D bounds = node.getBounds();
            
            setX(item, null, bounds.getCenterX());
            setY(item, null, bounds.getCenterY()+10);
            
        }
    }
}
