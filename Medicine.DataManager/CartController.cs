using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using Medicine.DataManager;
/// <summary>
/// Summary description for CartController
/// </summary>
public class CartController
{
	public static Cart GetCart(HttpSessionState session)
	{
        if (session["cart"] == null)
        {
            Cart cart= new Cart();
            session["cart"] = cart;
            return cart;
        }
        else
            return (Cart)session["cart"];
	}

    public static void AddMedicine(HttpSessionState session, int sno,int stripinsidebox,int medicineinsidestrip,int extra,float price)
    {
        Cart cart = GetCart(session);
        cart.AddtoCart(sno,stripinsidebox,medicineinsidestrip,extra,price);
    }
    public static void RemoveFromCart(HttpSessionState session, int sno)
    {
        Cart cart = GetCart(session);
        cart.RemoveFromCart(sno); ;
    }
    public static CartItem[] GetShoppingCart(HttpSessionState session)
    {
        Cart cart=GetCart(session);
        return cart.GetCart;
    }
    public static void SaveToDatabase(HttpSessionState session, int receiptno)
    {
      Cart cart=  GetCart(session);
      cart.SaveToDatabase(receiptno);
      cart.Clear();
    }
    public static void Clear(HttpSessionState session)
    {
        Cart cart = GetCart(session);
        cart.Clear();
    }
}