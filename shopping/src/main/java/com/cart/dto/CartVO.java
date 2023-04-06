/*CREATE TABLE `cart` (
<<<<<<< HEAD
	`cart_id`	int(10)	NOT NULL,        (장바구니 번호)
	`user_id`	varchar(50)	NOT NULL, 	 (사용자 아이디)
	`user_name` varchar(50)	NULL,    	  (사용자 이름)
	`product_id     int(10)	NOT NULL,    (상품 번호)
	`product_name` 	varchar(50) NULL,    (상품 이름)
	`cart_price`	int(10)	NULL,		 (상품단가)
	`cart_quantity`	int(10)	NULL,	     (상품 수량)
	`product_money`	int(10)      NULL    (상품 가격)
); */
package com.cart.dto;

public class CartVO {
	private int cart_id;			//장바구니 번호 cartID
	private String user_id;			//사용자 아이디 userID
	private String user_name;		//사용자 이름  userName
	private int product_id;			//상품 번호   productID
	private int product_name;		//상품이름    productName
	private int cart_price;			//상품단가    productPrice
	private int cart_quantity;		//구매수량		amount
	private int product_money;		//상품 가격	money
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
	public int getProduct_name() {
		return product_name;
	}
	public void setProduct_name(int product_name) {
		this.product_name = product_name;
	}
	public int getCart_price() {
		return cart_price;
	}
	public void setCart_price(int cart_price) {
		this.cart_price = cart_price;
	}
	public int getCart_quantity() {
		return cart_quantity;
	}
	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}
	public int getProduct_money() {
		return product_money;
	}
	public void setProduct_money(int product_money) {
		this.product_money = product_money;
	}
	@Override
	public String toString() {
		return "CartVO [cart_id=" + cart_id + ", user_id=" + user_id + ", user_name=" + user_name + ", product_id="
				+ product_id + ", product_name=" + product_name + ", cart_price=" + cart_price + ", cart_quantity="
				+ cart_quantity + ", product_money=" + product_money + "]";
	}
	
	
	
}
=======
   `cart_id`   int(10)   NOT NULL,        (장바구니 번호)
   `user_id`   varchar(50)   NOT NULL,     (사용자 아이디)
   `user_name` varchar(50)   NULL,         (사용자 이름)
   `product_id     int(10)   NOT NULL,    (상품 번호)
   `product_name`    varchar(50) NULL,    (상품 이름)
   `cart_price`   int(10)   NULL,       (상품단가)
   `cart_quantity`   int(10)   NULL,        (상품 수량)
   `product_money`   int(10)      NULL    (상품 가격)
); */
package com.cart.dto;

public class CartVO {
   private int cart_id;         //장바구니 번호 cartID
   private String user_id;         //사용자 아이디 userID
   private String user_name;      //사용자 이름  userName
   private int product_id;         //상품 번호   productID
   private int product_name;      //상품이름    productName
   private int cart_price;         //상품단가    productPrice
   private int cart_quantity;      //구매수량      amount
   private int product_money;      //상품 가격   money
   
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
   public int getProduct_name() {
      return product_name;
   }
   public void setProduct_name(int product_name) {
      this.product_name = product_name;
   }
   public int getCart_price() {
      return cart_price;
   }
   public void setCart_price(int cart_price) {
      this.cart_price = cart_price;
   }
   public int getCart_quantity() {
      return cart_quantity;
   }
   public void setCart_quantity(int cart_quantity) {
      this.cart_quantity = cart_quantity;
   }
   public int getProduct_money() {
      return product_money;
   }
   public void setProduct_money(int product_money) {
      this.product_money = product_money;
   }
   @Override
   public String toString() {
      return "CartVO [cart_id=" + cart_id + ", user_id=" + user_id + ", user_name=" + user_name + ", product_id="
            + product_id + ", product_name=" + product_name + ", cart_price=" + cart_price + ", cart_quantity="
            + cart_quantity + ", product_money=" + product_money + "]";
   }
   

}
>>>>>>> branch 'S.S.M' of https://github.com/kimd0hee/Project_ShoppingMall.git
