using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

/// <summary>
/// Summary description for MedicineCartController
/// </summary>
public class PurchaseCartController
{
	
	
		public static PurchaseCart GetCart(HttpSessionState session)
	{
        if (session["purchasecart"] == null)
        {
            PurchaseCart cart= new PurchaseCart();
            session["purchasecart"] = cart;
            return cart;
        }
        else
            return (PurchaseCart)session["purchasecart"];
	
	}
 public static void AddMedicine(HttpSessionState session,PurchaseItemDetails item)
    {
        PurchaseCart cart = GetCart(session);
        cart.AddtoCart(item);
    }

 public static void RemoveFromCart(HttpSessionState session, int medicineno)
 {
     PurchaseCart cart = GetCart(session);
     cart.RemoveFromCart(medicineno); ;
 }

 public static PurchaseItemDetails[] GetShoppingCart(HttpSessionState session)
 {
     PurchaseCart cart = GetCart(session);
     return cart.GetCart;
 }

 public static void SaveToDatabase(HttpSessionState session, int billno)
 {
     PurchaseCart cart = GetCart(session);
     cart.SaveToDatabase(billno);
 }
 public static void Clear(HttpSessionState session)
 {
     PurchaseCart cart = GetCart(session);
     cart.Clear();
 }


}