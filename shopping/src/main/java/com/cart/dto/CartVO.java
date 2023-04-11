package com.cart.dto;

public class CartVO {
   private int cart_id;
   private String user_id;
   private String user_name;
   private int product_id;
   private String product_name;
   private int cart_price;
   private int amount;
   private int money;
   public int getCart_id() {
      return cart_id;
   }
   public void setCart_id(int cart_id) {
      this.cart_id = cart_id;
   }
   public String getUser_id() {
      return user_id;
   }
   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }
   public String getUser_name() {
      return user_name;
   }
   public void setUser_name(String user_name) {
      this.user_name = user_name;
   }
   public int getProduct_id() {
      return product_id;
   }
   public void setProduct_id(int product_id) {
      this.product_id = product_id;
   }
   public String getProduct_name() {
      return product_name;
   }
   public void setProduct_name(String product_name) {
      this.product_name = product_name;
   }
   public int getProduct_price() {
      return cart_price;
   }
   public void setProduct_price(int product_price) {
      this.cart_price = product_price;
   }
   public int getAmount() {
      return amount;
   }
   public void setAmount(int amount) {
      this.amount = amount;
   }
   public int getMoney() {
      return money;
   }
   public void setMoney(int money) {
      this.money = money;
   }
   @Override
   public String toString() {
      return "CartVO [cart_id=" + cart_id + ", user_id=" + user_id + ", user_name=" + user_name + ", product_id="
            + product_id + ", product_name=" + product_name + ", cart_price=" + cart_price + ", amount="
            + amount + ", money=" + money + "]";
   }

}