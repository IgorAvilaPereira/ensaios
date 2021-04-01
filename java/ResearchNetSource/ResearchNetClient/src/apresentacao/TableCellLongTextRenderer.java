/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import javax.swing.JEditorPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.table.TableCellRenderer;
import javax.swing.text.StyledEditorKit;
import javax.swing.text.html.HTMLEditorKit;

/**
 *
 * @author lucas
 */
public class TableCellLongTextRenderer extends JTextArea implements TableCellRenderer{  
  
    @Override  
    public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {  
        
        this.setText((String)value);  
        this.setWrapStyleWord(true);  
        this.setLineWrap(true);   
        
        //set the JTextArea to the width of the table column  
        setSize(table.getColumnModel().getColumn(column).getWidth(),getPreferredSize().height);  
        if (table.getRowHeight(row) != getPreferredSize().height) {  
            //set the height of the table row to the calculated height of the JTextArea  
            table.setRowHeight(row, getPreferredSize().height);  
        }  
        
        this.setEditable(false);
        //this.addMouseListener(new mouseText(this));
        
        Color gray = new Color(200,200,200);
        
        if(isSelected == true){
            this.setBackground(gray);
        }
        else{
            this.setBackground(Color.WHITE);
        }
            
        return this;  
    }  
  
} 
