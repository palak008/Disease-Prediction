package com.palak.Login;

import java.util.HashMap;

public class Cart1 {
	HashMap<String, Float> cartItems;
    public Cart1(){
     cartItems = new HashMap<>();
      
    }
    public HashMap getCartItems(){
        return cartItems;
    }
    public void addToCart(String itemId, float price){
        cartItems.put(itemId, price);
    }
     
}
