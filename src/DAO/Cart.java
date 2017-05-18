package DAO;  
  
import java.util.ArrayList;  
import java.util.Iterator;  
import java.util.List;  
  
public class Cart {  
    List<CartItem> items = new ArrayList<CartItem>();  
  
    public List<CartItem> getItems() {  
        return items;  
    }  
  
    public void setItems(List<CartItem> items) {  
        this.items = items;  
    }  
      
    public void add2Cart(CartItem ci) {  
        for (Iterator<CartItem> iter = items.iterator(); iter.hasNext(); ) {  
            CartItem item = iter.next();
            String c_id = item.getItem().getitemid();
            String n_id = ci.getItem().getitemid();
            if(c_id.equals(n_id)) {  
                item.setCount(item.getCount() + 1);  
                return;  
            }  
        }
        items.add(ci);  
    }  
      
    public double getTotalPrice() {  
        double p = 0.00;  
        for(Iterator<CartItem> it = items.iterator(); it.hasNext(); ) {  
            CartItem current = it.next();  
            p += Double.parseDouble(current.getItem().getitemprice()) * current.getCount();
        }  
        return p;  
    }  
      
    public void deleteItemById(String id) {  
        for (Iterator<CartItem> iter = items.iterator(); iter.hasNext(); ) {  
            CartItem item = iter.next();
            String c_id = item.getItem().getitemid();
            if(c_id.equals(id)) {  
                iter.remove();  
                return;  
            }  
        }  
    }
    
    public void clearCart() {
    	items.clear();
    }
      
}  