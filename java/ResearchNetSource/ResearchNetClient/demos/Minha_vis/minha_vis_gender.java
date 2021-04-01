package Minha_vis;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import prefuse.Constants;
import prefuse.Display;
import prefuse.Visualization;
import prefuse.action.ActionList;
import prefuse.action.RepaintAction;
import prefuse.action.assignment.ColorAction;
import prefuse.action.assignment.DataColorAction;
import prefuse.action.layout.graph.ForceDirectedLayout;
import prefuse.activity.Activity;
import prefuse.controls.ControlAdapter;
import prefuse.controls.DragControl;
import prefuse.controls.FocusControl;
import prefuse.controls.NeighborHighlightControl;
import prefuse.controls.PanControl;
import prefuse.controls.WheelZoomControl;
import prefuse.controls.ZoomControl;
import prefuse.controls.ZoomToFitControl;
import prefuse.data.Graph;
import prefuse.data.Tuple;
import prefuse.data.event.TupleSetListener;
import prefuse.data.io.DataIOException;
import prefuse.data.io.GraphMLReader;
import prefuse.data.tuple.TupleSet;
import prefuse.render.DefaultRendererFactory;
import prefuse.render.LabelRenderer;
import prefuse.util.ColorLib;
import prefuse.visual.VisualItem;

public class minha_vis_gender {
	public static void main(String[] argv) {

		// -- 1. load the data ------------------------------------------------

		// load the socialnet.xml file. it is assumed that the file can be
		// found at the root of the java classpath
		Graph graph = null;
		try {
			graph = new GraphMLReader().readGraph("c3_capado.xml");
		} catch (DataIOException e) {
			e.printStackTrace();
			System.err.println("Error loading graph. Exiting...");
			System.exit(1);
		}

		// -- 2. the visualization --------------------------------------------

		// add the graph to the visualization as the data group "graph"
		// nodes and edges are accessible as "graph.nodes" and "graph.edges"
		Visualization vis = new Visualization();
		vis.add("graph", graph);
		vis.setInteractive("graph.edges", null, false);

		// -- 3. the renderers and renderer factory ---------------------------

		// draw the "name" label for NodeItems
		LabelRenderer r = new LabelRenderer("name");
		//nessa linha se indica qual atributo do nodo s
		
		r.setRoundedCorner(8, 8); // round the corners

		// create a new default renderer factory
		// return our name label renderer as the default for all non-EdgeItems
		// includes straight line edges for EdgeItems by default
		vis.setRendererFactory(new DefaultRendererFactory(r));

		// -- 4. the processing actions ---------------------------------------

		//Minha nova collorAction
		
		int[] paleta = new int[] { ColorLib.rgb(255, 190, 190), ColorLib.rgb(70, 130, 180)  };
		// map nominal data values to colors using our provided palette
		DataColorAction teste = new DataColorAction("graph.nodes", "gender",
				Constants.NOMINAL, VisualItem.FILLCOLOR, paleta);
		
		// use black for node text
		ColorAction text = new ColorAction("graph.nodes", VisualItem.TEXTCOLOR,
				ColorLib.gray(0));
		// use light grey for edges
		ColorAction edges = new ColorAction("graph.edges",
				VisualItem.STROKECOLOR, ColorLib.gray(100));
		
		
		// create an action list containing all color assignments
		ActionList color = new ActionList();
		//color.add(fill); // tirei a ao de colorir por gender(paleta fill)...
		color.add(teste); //testando a minha paleta, colorindo de acordo com o 'pubs'...
		color.add(text);
		color.add(edges);

		// create an action list with an animated layout
		//ActionList layout = new ActionList(Activity.INFINITY);
		//System.out.println("infinity=["+Activity.INFINITY + "]");
		ActionList layout = new ActionList(-1);
		layout.add(new ForceDirectedLayout("graph", true)); //o segundo parmetro diz que os 'bounds' so o tamanho do display
		layout.add(new RepaintAction());

		// add the actions to the visualization
		vis.putAction("color", color);
		vis.putAction("layout", layout);
		
	  
		// -- 5. the display and interactive controls -------------------------

		Display d = new Display(vis);
		d.setSize(800, 600); // set display size
		d.addControlListener(new DragControl()); // drag individual items around
		d.addControlListener(new PanControl());// pan with left-click drag on background
		d.addControlListener(new FocusControl(1));
        d.addControlListener(new ZoomControl());
        d.addControlListener(new WheelZoomControl());
        d.addControlListener(new ZoomToFitControl());
        d.addControlListener(new NeighborHighlightControl());
        
        //Funcao para abrir um JOptionPane
        d.addControlListener(new ControlAdapter(){
        	
        	 public void itemClicked(VisualItem item, MouseEvent e) {
        		 
        		 JOptionPane.showConfirmDialog(null, "DFDDFDF");
        		 
        	    }
        });
       
		
		// -- 6. launch the visualization -------------------------------------

		// create a new window to hold the visualization
		JFrame frame = new JFrame("C3");
		// ensure application exits when window is closed
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.add(d);
		frame.pack(); // layout components in window
		frame.setVisible(true); // show the window

	
		vis.run("color"); 	// assign the colors
		vis.run("layout");	// start up the animated layout
	}

}
